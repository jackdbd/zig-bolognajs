---
layout: default
---
# Compile-time type reflection

<Transform scale="0.8">

```zig
// demo-reflection.zig
const std = @import("std");

const Hello = struct {
    foo: u32,
    bar: []const u8,
};

pub fn main() void {
    printInfoAboutStruct(Hello);
}

fn printInfoAboutStruct(comptime T: type) void {
    const info = @typeInfo(T);
    inline for (info.Struct.fields, 0..) |field, i| {
        std.debug.print(
            "type {s} field {d} is called '{s}' and is of type {any}\n",
            .{ @typeName(T), i, field.name, field.type },
        );
    }
}
```

Compile and run it with <code class="inline-code">zig run demo-reflection.zig</code>

```text
type demo-reflection.Hello field 0 is called 'foo' and is of type u32
type demo-reflection.Hello field 1 is called 'bar' and is of type []const u8
```

Read about <code class="inline-code">@typeInfo</code> <Anchor 
  href="https://ziglang.org/documentation/master/#typeInfo" 
  text="in the documentation" 
  alt="@typeInfo in the Zig documentation" />.

</Transform>
