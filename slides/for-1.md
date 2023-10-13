---
layout: two-cols
---
<h1>Capture value and index</h1>

<Transform scale="0.85">

```text {all|7|all}
const std = @import("std");
const log = std.log;

pub fn main() void {
    const colors = [_][]const u8{ "red", "green" };

    for (colors, 0..) |color, i| {
        log.debug(
            "colors[{d}] is {s}",
            .{ i, color }
        );
    }
}
```

Output:

```sh
debug: colors[0] is red
debug: colors[1] is green
```

</Transform>

::right::

<h1>inline for</h1>

<Transform scale="0.85">

```text {all|12|all}
const std = @import("std");
const log = std.log;

fn typeNameLength(comptime T: type) usize {
    return @typeName(T).len;
}

pub fn main() void {
    const nums = [_]i32{ 2, 4, 6 };

    var sum: usize = 0;
    inline for (nums) |n| {
        const T = switch (n) {
            2 => f32,  // length 3
            4 => i8,   // length 2
            6 => bool, // length 4
            else => @panic("got unexpected n"),
        };
        sum += typeNameLength(T);
    }
    log.debug("sum is {d}", .{sum});
}
```

Output:

```sh
debug: sum is 9
```

</Transform>

<!--
We can use a **capture** in a `for` loop. If the captured value is null, the for exits automatically.
We can use a first capture for the value, and a second capture for its index.

- `for` is an expression, like `while`
- `for` can be labeled, like `while`
- `for` can have a `inline` keyword, like `while`

In the example with `typeNameLength`:

- f32 has length 3
- i8 has length 2
- bool has length 4

The capture value (n) and iterator value (nums) of inlined for loops are **compile-time** known.
-->
