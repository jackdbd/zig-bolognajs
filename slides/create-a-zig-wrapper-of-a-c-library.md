---
layout: default
---

<h1>Create a Zig <span class="color:accent">wrapper</span> of a C library</h1>

<Transform scale="0.80">

**Why?**

- Namespaces
- Better error handling
- Easier and safer to use (e.g. less risk of buffer overflow)
- Extend the original library with higher level abstractions (e.g. slices instead of pointers)

**How?**

- <Anchor href="https://rischmann.fr/blog/how-i-built-zig-sqlite" text="How I built zig-sqlite" />
- <Anchor href="https://www.nmichaels.org/zig/wrap-sodium.html" text="Wrapping a C Library with Zig" />
- <Anchor href="https://tiehu.is/blog/zig1" text="Iterative Replacement of C with Zig" />

**Examples:**

- <Anchor href="https://github.com/fubark/zig-v8" text="zig-v8" />
- <Anchor href="https://github.com/jackdbd/zig-cairo" text="zig-cairo" />
- <Anchor href="https://github.com/vrischmann/zig-sqlite" text="zig-sqlite" />
- <Anchor href="https://github.com/beachglasslabs/duckdb.zig/tree/main" text="duckdb.zig" />
- <Anchor href="https://github.com/dying-will-bullet/base64-simd" text="base64-simd" />

</Transform>

<!--
I need to update zig-cairo when the package manager is ready. But also I need to understand whether it makes sense to use cairo when there is skia.
-->
