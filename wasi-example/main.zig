const std = @import("std");
const wasi = std.fs.wasi;

pub fn main() !void {
    const config = .{ .verbose_log = false };
    // const config = .{ .verbose_log = true };
    var gpa = std.heap.GeneralPurposeAllocator(config){};
    defer _ = gpa.deinit();
    var allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    const stdout = std.io.getStdOut().writer();
    const stderr = std.io.getStdErr().writer();

    // The first argument is the path to the Node.js script.
    if (args.len < 3) {
        try stderr.writeAll("Not enough arguments: you need to specify the input and output file paths.\n");
        std.process.exit(1);
    }

    std.log.debug("Node.js script: {s}", .{args[0]});
    const input_filename = args[1];
    const output_filename = args[2];
    std.log.debug("IN: {s}", .{input_filename});
    std.log.debug("OUT: {s}", .{output_filename});

    var preopens = try wasi.preopensAlloc(allocator);

    const fd_docs = preopens.find("/docs");
    const fd_generated = preopens.find("/generated");

    if (fd_docs == null) {
        try std.fmt.format(stderr, "The WASI preopen /docs is not available! Available WASI preopens: {s}\n", .{preopens.names});
        std.process.exit(1);
    }

    if (fd_generated == null) {
        try std.fmt.format(stderr, "The WASI preopen /generated is not available! Available WASI preopens: {s}\n", .{preopens.names});
        std.process.exit(1);
    }

    std.log.debug("File descriptors:", .{});
    for (preopens.names) |name| {
        std.log.debug("{s}: {?}", .{ name, preopens.find(name) });
    }

    var dir_docs = std.fs.Dir{ .fd = fd_docs orelse unreachable };
    defer dir_docs.close();

    var input_file = try dir_docs.openFile(input_filename, .{});
    defer input_file.close();

    const contents = try input_file.reader().readAllAlloc(allocator, std.math.maxInt(usize));
    defer allocator.free(contents);

    std.log.debug("Contents of {s}\n{s}", .{ input_filename, contents });

    var dir_generated = std.fs.Dir{ .fd = fd_generated orelse unreachable };
    defer dir_generated.close();

    var output_file = try dir_generated.createFile(output_filename, .{});
    try output_file.writeAll(contents);

    try std.fmt.format(stdout, "Wrote {d} bytes to {s}\n", .{ contents.len, output_filename });
}
