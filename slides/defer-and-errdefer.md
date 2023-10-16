---
layout: default
---

<h1><code class="inline-code">defer</code> and <code class="inline-code">errdefer</code></h1>

<Transform scale="0.85">

The deallocation code is always directly following the allocation code.

Resource cleanup is done using <code class="inline-code">errdefer</code>.

```zig
fn createFoo(param: i32) !Foo {
    const foo = try tryToAllocateFoo();

    // Now we have allocated foo. We need to free it if the function fails.
    // But we want to return it if the function succeeds.
    errdefer deallocateFoo(foo);

    const tmp_buf = allocateTmpBuffer() orelse return error.OutOfMemory;
    // tmp_buf is truly a temporary resource, and we for sure want to clean it up
    // before this block leaves scope.
    defer deallocateTmpBuffer(tmp_buf);

    if (param > 1337) return error.InvalidParam;

    // The errdefer will not run since we're returning success from the function.
    // But the defer will run!
    return foo;
}
```

This passage of <Anchor href="https://youtu.be/Gv2I7qTux7g?t=1927" text="The Road to Zig 1.0" /> explains well how <code class="inline-code">errdefer</code> works.

</Transform>

<!--
I think in C++ we would use RAII to implement a function like createFoo(), but we wouldn't have this fine control on resource deallocation.
-->
