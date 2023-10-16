---
layout: two-cols
---

<h1>How to use libraries?</h1>

<Transform scale="1">

**Past solutions**

- <Anchor href="https://github.com/nektro/zigmod" text="nektro/zigmod" />
- <Anchor href="https://github.com/mattnite/gyro" text="mattnite/gyro" />
- <Anchor href="https://github.com/marler8997/zig-build-repos" text="marler8997/zig-build-repos" />

**Evergreen solutions**

- vendorization (i.e. copy external dependencies into your project itself)
- git subtree (basically vendorizing)
- git submodule

</Transform>

::right::

<h1>Package manager</h1>

<Transform scale="1">

**Current status**

Declare dependencies in a <code class="inline-code">build.zig.zon</code> file.

- <Anchor href="https://zig.news/edyu/zig-package-manager-wtf-is-zon-558e" text="Zig Package Manager -- WTF is Zon" />
- <Anchor href="https://github.com/ziglang/zig/issues/14307" text="build system terminology update: package, project, module, dependency #14307" />

**The Future**

- <Anchor href="https://github.com/ziglang/zig/issues/14286" text="Run build.zig logic in a WebAssembly sandbox #14286" />
- <Anchor href="https://github.com/ziglang/zig/projects/4" text="Package Manager GitHub project board" />

</Transform>

<!--
-->
