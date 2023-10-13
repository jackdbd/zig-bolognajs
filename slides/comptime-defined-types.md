---
layout: default
---
<h1>Compile-time defined types</h1>

<Transform scale="0.85">

```text {all|4}
const std = @import("std");

pub fn main() void {
    var i: u3 = 0; // 111 in binary is 7 in decimal
    std.log.info("while loop [0, 7)", .{});
    while (i < 7) {
        std.log.debug("i ({s}): {d}", .{ @typeName(@TypeOf(i)), i });
        i += 1;
    }
}
```

<code class="inline-code">u3</code> is not a <Anchor href="https://ziglang.org/documentation/master/#Primitive-Types" text="primitive type" />. It's defined at compile-time by <Anchor href="https://github.com/ziglang/zig/blob/4df87b40fdfa221d169812969458c9112510d73f/lib/std/meta.zig#L1021" text="this function in std/meta.zig" />


```text
pub fn Int(comptime signedness: std.builtin.Signedness, comptime bit_count: u16) type {
    return @Type(.{
        .Int = .{
            .signedness = signedness,
            .bits = bit_count,
        },
    });
}
```

</Transform>

<!--
Notes
-->
