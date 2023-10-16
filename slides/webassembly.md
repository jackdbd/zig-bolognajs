---
layout: default
---
<h1>WebAssembly <WebAssemblyLogo /></h1>

<Transform :scale="1">

Zig supports building for WebAssembly <Anchor href="https://ziglang.org/documentation/master/#Freestanding" text="out of the box" />

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
  -O ReleaseFast
```

Generates <code class="inline-code">main.wasm</code>.

</v-click>

</Transform>

<!--
-->
