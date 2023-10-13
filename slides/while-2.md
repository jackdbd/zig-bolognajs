---
layout: two-cols
---
<h1>while 3/4</h1>

<Transform scale="0.85">

```text {all|14|all}
const std = @import("std");

var numbers_left: u32 = undefined;
fn eventuallyNull() ?u32 {
    return if (numbers_left == 0) null else blk: {
        numbers_left -= 1;
        break :blk numbers_left;
    };
}

pub fn main() void {
    var tot: u32 = 0;
    numbers_left = 3;
    while (eventuallyNull()) |value| {
        std.log.debug("num left: {d}", .{value});
        tot += value;
    }
    std.log.debug("total: {d}", .{tot});
}
```

Output:

```sh
debug: num left: 2
debug: num left: 1
debug: num left: 0
debug: total: 3
```

</Transform>

::right::

<h1>while 4/4</h1>

<Transform scale="0.85">

```text {all|9|all}
const std = @import("std");

fn inRange(i0: usize, i1: usize, n: usize) bool {
    var i = begin;
    return while (i < end) : (i += 1) {
        if (i == n) {
            break true;
        }
    } else false;
}

pub fn main() void {
    std.log.debug(
        "is 3 within [1, 5) ? {}",
        .{inRange(1, 5, 3)}
    );
    std.log.debug(
        "is 7 within [1, 5) ? {}",
        .{inRange(1, 5, 7)}
    );
}
```

Output:

```sh
debug: is 3 within [1, 5) ? true
debug: is 7 within [1, 5) ? false
```

</Transform>

<!--
We can use a **capture** in a `while` loop. If the captured value is null, the while exits automatically.

Maybe cite:

- `labeled while`: https://ziglang.org/documentation/master/#Labeled-while
- `inline while`: https://ziglang.org/documentation/master/#inline-while
-->
