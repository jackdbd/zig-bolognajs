---
layout: two-cols
---

<h1>Build a JS project</h1>

<Transform scale="1">

<code class="inline-code">package.json</code> is a <span class="color:accent">manifest</span>.

You build your project using something else:

- npm scripts
- bash scripts
- make
- webpack
- esbuild
- <Anchor href="https://github.com/vercel/pkg" text="pkg" />
- <Anchor href="https://nodejs.org/api/single-executable-applications.html" text="Single Executable Applications" />
- etc

</Transform>

::right::

<h1>Build a Zig project</h1>

<Transform scale="0.95">

<code class="inline-code">build.zig</code> is a <span class="color:accent">program</span>.

Zig is not the only language that takes this approach.

<Citation
  citeHref="https://clojure.org/guides/tools_build#_builds_are_programs"
  citeText="Builds are programs">
  <template v-slot:quote>
    <p slot="quote">The philosophy behind tools.build is that your project build is inherently a program - a series of instructions to create one or more project artifacts from your project source files.</p>
  </template>
</Citation>


You build your project using the Zig compiler and toolchain. Building should be as simple as running:

```sh
zig build
# which stands for:
zig build --build-file build.zig
```

No need for extra build tools ([make](https://www.gnu.org/software/make/), [Ninja](https://github.com/ninja-build/ninja)) or meta-build tools ([CMake](https://cmake.org/), [Meson](https://mesonbuild.com/), [gn](https://gn.googlesource.com/gn/)).

</Transform>
