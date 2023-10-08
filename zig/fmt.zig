//! This module contains functions that will be available to JavaScript when
//! instantiating the generated .wasm module.
const std = @import("std");
const builtin = @import("builtin");

// In zig, assertions are kept only when compiling in debug mode or release-safe
// mode. They are stripped away when compiling in release-fast or release-small.
const assert = std.debug.assert;

const testing = std.testing;

/// Allocate `len` bytes of heap memory.
/// This function is exported to JavaScript (see index.js)
export fn wasm_alloc(len: usize) usize {
    var buf = std.heap.page_allocator.alloc(u8, len) catch |err| {
        assert(err == error.OutOfMemory);
        return 0;
    };
    return @intFromPtr(buf.ptr);
}

test "wasm_alloc can allocate 3 bytes of heap memory, so it returns the starting memory address" {
    const address = wasm_alloc(3);
    try testing.expect(address > 0);
}

test "wasm_alloc cannot allocate 1^11 bytes (100 GB) of heap memory, so it returns 0" {
    const address = wasm_alloc(1e11);
    try testing.expect(address == 0);
}

/// Deallocate `len` bytes previously allocated to the heap.
/// This function is exported to JavaScript (see index.js)
export fn wasm_dealloc(ptr: [*]const u8, len: usize) void {
    // memory allocations might fail, but memory deallocations never fail
    std.heap.page_allocator.free(ptr[0..len]);
}

test "wasm_dealloc can deallocate" {
    var allocator = std.heap.page_allocator;
    var list = std.ArrayList(u8).init(allocator);
    // defer list.deinit(); // don't do this, otherwise segfault

    // https://www.utf8-chartable.de/
    try list.append(48); // H
    try list.append(69); // i
    try list.append(21); // !

    try testing.expectEqual(@as(usize, 3), list.items.len);
    wasm_dealloc(list.items.ptr, list.items.len);
    try testing.expect(list.items.len == 3); // why are list items still 3?
}

/// Format zig `source` code.
/// Note: this function is not exported.
fn format(allocator: std.mem.Allocator, source: [:0]const u8) ![]u8 {

    // parse input source code and create an abstract syntax tree
    // https://github.com/ziglang/zig/blob/5fafcc2b629e2ff00755b2bf45e903590f04aa9f/lib/std/zig/parser_test.zig#L5456
    // https://ziglang.org/documentation/master/std/#A;std:zig.Ast
    var ast = try std.zig.Ast.parse(allocator, source, std.zig.Ast.Mode.zig);
    defer ast.deinit(allocator);

    if (ast.errors.len != 0) {
        return error.ParseError;
    }

    // assume we have at most 1024 bytes to write to the output stream. This is
    // fine here because this app is just a demo.
    var buf: [1024]u8 = undefined;

    // Example: a buffer of 80 bytes would be too small for this demo.
    // var buf: [80]u8 = undefined;

    // print is a function available at runtime in the browser because it is
    // defined in the `importObject` of the WebAssembly instance. But it is not
    // available when running zig tests, so we avoid calling it during tests to
    // avoid a linker error.
    if (!builtin.is_test) {
        print(buf.len);
        foo(123, 456, 1.23, 4.56);
    }

    var fbs = std.io.fixedBufferStream(&buf);

    const out_stream = fbs.writer(); // fbs.outStream() is the same but it's deprecated

    // write something to the output stream, just to understand if we get
    // something on the screen on the browser
    // try out_stream.writeAll("Ciao ");
    // try out_stream.print("{s} {s}!", .{ "Hello", "World" });
    // try out_stream.writeAll(" Mondo");

    // render the abstract syntax tree and write the formatted zig code to the output stream
    var slice = try std.zig.Ast.render(ast, allocator);
    try out_stream.writeAll(slice);

    return fbs.getWritten();
}

test "format returns a ParseError when input is not zig code" {
    var allocator = testing.allocator;
    const input = "this is not zig code";

    try testing.expectError(error.ParseError, format(allocator, input));
}

// test "format returns when input is zig code" {
//     var allocator = testing.allocator;
//     const input = "const answer: u8 =   42;";
//     const expected: []const u8 = "const answer: u8 = 42;";

//     var output = try format(allocator, input);
//     try testing.expectEqual(expected, output);
//     try testing.expect(std.mem.eql(u8, expected, output));
// }

/// Format zig code.
/// Expose a `format_zig_code` function to JavaScript (see index.js)
///
/// The export keyword or @export builtin function can be used to make a
/// variable available to other objects at link time.
/// https://ziglang.org/documentation/master/#export
pub export fn format_zig_code(input_ptr: [*]const u8, input_len: usize, output_ptr: *[*]u8, output_len: *usize) bool {
    // obtain a null terminated slice
    // https://github.com/ziglang/zig/issues/3731#issuecomment-556483080
    const input = input_ptr[0..input_len :0];

    var allocator = std.heap.page_allocator;

    var output = format(allocator, input) catch |err| {
        // formatting might have failed for one of these reasons: a parse error,
        // a memory allocation error. Other possible errors?
        assert((err == error.OutOfMemory) or (err == error.ParseError));
        return false;
    };

    output_ptr.* = output.ptr;
    output_len.* = output.len;

    return true;
}

test "format_zig_code returns false when input is not zig code" {
    const input = "this is not zig code";

    var output = std.ArrayList(u8).init(testing.allocator);
    defer output.deinit();

    const b = format_zig_code(input, input.len, &output.items.ptr, &output.items.len);
    try testing.expectEqual(false, b);
}

test "format_zig_code returns true when input is zig code" {
    const input = "const answer: u8 =   42;";

    var output = std.ArrayList(u8).init(testing.allocator);
    defer output.deinit();

    const succeeded = format_zig_code(input, input.len, &output.items.ptr, &output.items.len);
    try testing.expectEqual(true, succeeded);
}

/// This `print` function WILL be available in the environment the WebAssembly
/// instance will run (i.e. a web browser). See `importObject` in `index.js`
///
/// The extern keyword or @extern builtin function can be used to link against a
/// variable that is exported from another object.
/// https://ziglang.org/documentation/master/#extern
/// https://webassembly.github.io/spec/core/syntax/types.html#external-types
extern fn print(i32) void;

/// https://webassembly.github.io/spec/core/syntax/types.html
extern fn foo(i32, i64, f32, f64) void;
