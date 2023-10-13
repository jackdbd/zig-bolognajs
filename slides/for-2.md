---
layout: two-cols
---
<h1>Iterate over a slice</h1>

<Transform scale="0.85">

```text
const std = @import("std");
const log = std.log;

pub fn main() void {
    var items = [_]i32{ -1, 0, 1 };

    log.debug("items is {any}", .{items});

    for (&items) |*val| {
        log.debug(
            "val has type {s} and is {}",
            .{ @typeName(@TypeOf(val)), val }
        );

        log.debug(
            "val.* has type {s} and is {}",
            .{ @typeName(@TypeOf(val.*)), val.* }
        );

        // dereference and assign
        val.* += 1;
    }

    log.debug("items is {any}", .{items});
}
```

</Transform>

::right::

<h1>Output</h1>

<Transform scale="0.85">

```sh
debug: items is { -1, 0, 1 }

debug: val has type *i32 and is i32@7ffe311feadc
debug: val.* has type i32 and is -1

debug: val has type *i32 and is i32@7ffe311feae0
debug: val.* has type i32 and is 0

debug: val has type *i32 and is i32@7ffe311feae4
debug: val.* has type i32 and is 1

debug: items is { 0, 1, 2 }
```

</Transform>

<!--
We can use a **capture** in a `for` loop. If the captured value is null, the for exits automatically.

We can use a first capture for the value, and a second capture for its index.

- `for` is an expression, like `while`
- `for` can be labeled, like `while`
- `for` can have a `inline` keyword, like `while`
-->
