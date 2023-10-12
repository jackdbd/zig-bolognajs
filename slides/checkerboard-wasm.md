---
layout: default
---

# Checkerboard (wasm)

<Transform scale="0.75">

We can inspect the sections available in the WASM binary using the <Anchor href="https://github.com/WebAssembly/wabt" text="WebAssembly Binary Toolkit" />.

<p>The <code class="inline-code">Export</code> section contains zig functions we exported using <code class="inline-code">export fn</code>.</p>

```text
wasm-objdump public/checkerboard.wasm --details --section Export

Export[3]:
 - func[0] <getCheckerboardBufferPointer> -> "getCheckerboardBufferPointer"
 - func[1] <getCheckerboardSize> -> "getCheckerboardSize"
 - func[2] <colorCheckerboard> -> "colorCheckerboard"
```

<p>The <code class="inline-code">Import</code> section contains functions and <code class="inline-code">WebAssembly.Memory</code> objects we defined in JS.</p>

```text
wasm-objdump public/checkerboard.wasm --details --section Import

Import[1]:
 - memory[0] pages: initial=2 max=2 <- env.memory
```

<p>The <code class="inline-code">Type</code> section contains the data types available in the wasm module.</p>

```text
wasm-objdump public/checkerboard.wasm --details

Type[2]:
 - type[0] () -> i32
 - type[1] (i32, i32, i32, i32, i32, i32) -> nil
Function[3]:
 - func[0] sig=0 <getCheckerboardBufferPointer>
 - func[1] sig=0 <getCheckerboardSize>
 - func[2] sig=1 <colorCheckerboard>
```
</Transform>
