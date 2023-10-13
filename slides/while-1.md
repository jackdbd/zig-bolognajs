---
layout: two-cols
---
<h1>while 1/4</h1>

<Transform scale="0.85">

```text {all|11|all}
const std = @import("std");

pub fn main() void {
    std.log.info("while loop [0, 7)", .{});
    var i: usize = 0;
    while (i < 7) {
        std.log.debug(
            "i ({s}): {d}",
            .{ @typeName(@TypeOf(i)), i }
        );
        i += 1;
    }
}
```

Output:

```sh
info: for loop [0, 7)
debug: i (usize): 0
...
debug: i (usize): 7
```

</Transform>

::right::

<h1>while 2/4</h1>

<Transform scale="0.85">

```text {all|6|all}
const std = @import("std");

pub fn main() void {
    std.log.info("while loop [0, 7)", .{});
    var i: usize = 0;
    while (i < 7) : (i += 1) {
        std.log.debug(
            "i ({s}): {d}",
            .{ @typeName(@TypeOf(i)), i }
        );

    }
}
```

Output:

```sh
info: for loop [0, 7)
debug: i (usize): 0
...
debug: i (usize): 7
```

</Transform>

<!--
While loops support a **continue expression** which is executed when the loop is continued.
The `continue` keyword respects this expression.
-->
