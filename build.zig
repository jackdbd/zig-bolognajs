const std = @import("std");
const Builder = std.build.Builder;
const FileSource = std.build.FileSource;
const Mode = std.builtin.Mode;

const MODULES = [_][]const u8{ "checkerboard", "fmt" };

pub fn build(b: *Builder) void {
    // b.verbose = true;

    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    inline for (MODULES) |name| {
        const root_source_file = .{ .path = "zig" ++ std.fs.path.sep_str ++ name ++ ".zig" };
        // https://ziglang.org/documentation/master/#Freestanding
        // See also this example:
        // https://github.com/thi-ng/umbrella/blob/main/packages/leb128/tools/build-binary.sh
        const lib = b.addSharedLibrary(.{
            .name = name,
            .root_source_file = root_source_file,
            .target = .{
                .cpu_arch = .wasm32,
                .os_tag = .freestanding,
            },
            .optimize = optimize,
        });

        if (std.mem.eql(u8, name, "checkerboard")) {
            // <https://github.com/ziglang/zig/issues/8633>
            lib.global_base = 6560;
            lib.import_memory = true;
            lib.stack_size = std.wasm.page_size;
            // Number of WebAssembly memory pages reserved on the heap memory.
            // This must match the number of pages used in Checkerboard.vue.
            const number_of_pages = 2;
            std.log.debug("building checkerboard.wasm (allow {d} pages of WASM memory, 64KiB each)", .{number_of_pages});
            lib.initial_memory = std.wasm.page_size * number_of_pages;
            lib.max_memory = std.wasm.page_size * number_of_pages;
        } else {
            std.log.debug("building {s}.wasm", .{name});
        }
        // Add all symbols to the dynamic symbol table
        lib.rdynamic = true;

        b.installArtifact(lib);

        // TODO: this seems to do nothing...
        // Creates a step for unit testing. This only builds the test executable
        // but does not run it.
        const main_tests = b.addTest(.{
            .root_source_file = root_source_file,
            .target = target,
            .optimize = optimize,
        });

        const run_main_tests = b.addRunArtifact(main_tests);

        // This creates a build step. It will be visible in the `zig build --help` menu,
        // and can be selected like this: `zig build test-<name>`
        // const test_name = "test-" ++ name;
        // const test_desc = "Run the unit tests for the " ++ name ++ " library";
        const test_step = b.step("test-" ++ name, "Run the unit tests for the " ++ name ++ " library");
        test_step.dependOn(&run_main_tests.step);
    }
}
