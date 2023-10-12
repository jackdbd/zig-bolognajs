---
layout: default
---
<h1>WebAssembly <WebAssemblyLogo /></h1>

<div>
  <p>Zig supports building for WebAssembly <Anchor href="https://ziglang.org/documentation/master/#Freestanding" text="out of the box" />
  </p>
</div>

<Transform :scale="0.75">

<v-click>

**Browsers**

```sh {all|2|4-6|all}
zig build-lib src/lib.zig \
  -target wasm32-freestanding -dynamic \
  -O ReleaseSmall \
  --export format_zig_code \
  --export wasm_alloc \
  --export wasm_dealloc
```

Generates <code class="inline-code">lib.wasm</code>.
</v-click>

<v-click>

**WASI runtimes** (WASI support is <Anchor href="https://ziglang.org/documentation/master/#WASI" text="under active development" />)

```sh {all|2|all}
zig build-exe src/main.zig \
  -target wasm32-wasi-musl \
  -O ReleaseSmall
```

Generates <code class="inline-code">main.wasm</code>.

In Node.js, launch your app with <code class="inline-code">node app.js</code> (add <code class="inline-code">--experimental-wasi-unstable-preview1</code> for Node.js versions before <code class="inline-code">20.0.0</code>).
</v-click>

<p v-click>Check <Anchor href="https://github.com/jackdbd/zigfmt-web" text="jackdbd/zigfmt-web" /> for both examples.</p>

</Transform>

<!--
For host environments like the web browser and nodejs, build as a dynamic library using the freestanding OS target.

Zig loves WASI! - Jakub Konka
https://youtu.be/g_Degmqfo4Q
-->
