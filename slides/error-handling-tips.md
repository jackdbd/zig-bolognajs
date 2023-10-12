---
layout: two-cols
---
# Tips for error handling 1/2

<Transform scale="0.95">

✅ **Do** omit the error set of a function.

```text
pub fn foo() !u32 {
  ...
}
```

Even in recursive functions.

```text
const MyError = error{
    FourIsBadLuck,
};

fn factorial(n: usize) !usize {
    if (n == 1) return 1;
    if (n == 4) return MyError.FourIsBadLuck;
    return n * try factorial(n - 1);
}
```

</Transform>

:: right::

# Tips for error handling 2/2

<Transform scale="0.95">

❌ **Do not** use <code class="inline-code">anyerror</code> as the error set.

```text
pub fn foo() anyerror!u32 {
  ...
}
```

The global error set <code class="inline-code">anyerror</code> <Anchor href="https://ziglang.org/documentation/0.10.1/#The-Global-Error-Set" text="should generally be avoided" /> because it prevents the compiler from knowing what errors are possible at compile-time.

Knowing the error set at compile-time is better for generated documentation and helpful error messages.

</Transform>

<!--
Regarding usize, read this and maybe cite it:
https://github.com/ziglang/zig/issues/5185
-->
