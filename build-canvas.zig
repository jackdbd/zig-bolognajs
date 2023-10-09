const std = @import("std");
const wasm_api = @import("node_modules/@thi.ng/wasm-api/zig/build.zig");

pub fn build(b: *std.Build) void {
    const name = "canvas-wasm";
    const optimize = b.standardOptimizeOption(.{});
    std.log.debug("building {s}.wasm", .{name});

    const lib = wasm_api.wasmLib(b, .{
        .root = "zig/" ++ name ++ "/main.zig",
        // Declare extra WASM API packages to use
        .modules = &.{
            .{ .name = "wasm-api-canvas", .path = "@thi.ng/wasm-api-canvas/zig/lib.zig" },
            .{ .name = "wasm-api-dom", .path = "@thi.ng/wasm-api-dom/zig/lib.zig" },
        },
        .optimize = optimize,
    });

    b.installArtifact(lib);
}
