---
layout: default
---
<h1>Generics</h1>

<Transform scale="0.85">

Compile-time parameters is how Zig implements generics. It is compile-time duck typing.

```text
fn max(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}

fn gimmeTheBiggerFloat(a: f32, b: f32) f32 {
    return max(f32, a, b);
}

fn gimmeTheBiggerInteger(a: u64, b: u64) u64 {
    return max(u64, a, b);
}
```

</Transform>

<!--
Notes
-->
