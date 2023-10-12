---
layout: two-cols
---

# WASI (Zig) 1/2

<Transform scale="0.75">

Import the `wasi` module from the standard library.

```zig
const std = @import("std");
const wasi = std.fs.wasi;

pub fn main() !void {}
```

Implement the `main` function (1/2).

```zig
var gpa = std.heap.GeneralPurposeAllocator(){};
defer _ = gpa.deinit();
var allocator = gpa.allocator();

const args = try std.process.argsAlloc(allocator);
defer std.process.argsFree(allocator, args);

const stdout = std.io.getStdOut().writer();
const stderr = std.io.getStdErr().writer();
var preopens = try wasi.preopensAlloc(allocator);

const fd = preopens.find("/docs");
if (fd == null) {
    try std.fmt.format(
        stderr,
        "/docs is not an available preopen: {s}\n",
        .{preopens.names}
    );
    std.process.exit(1);
}
```

</Transform>

::right::

# WASI (Zig) 2/2

<Transform scale="0.75">

Implement the `main` function (2/2).

```zig
var dir = std.fs.Dir{ .fd = fd orelse unreachable };
defer dir.close();

var file = try dir.openFile(input_filename, .{});
defer file.close();

const contents = try file.reader().readAllAlloc(
    allocator, std.math.maxInt(usize)
);
defer allocator.free(contents);

std.log.debug(
    "Contents of {s}\n{s}",
    .{ input_filename, contents }
);
```

Compile with:

```sh
zig build-exe main.zig -target wasm32-wasi
```

Currently, every WASI-compliant runtime implements the file system interface with a libpreopen-like layer.

This group proposes an alternative: [Leveraging eBPF to enhance sandboxing of
WebAssembly runtimes (PDF)](https://cs.unibg.it/seclab-papers/2023/ASIACCS/poster/enhance-wasm-sandbox.pdf).

</Transform>
