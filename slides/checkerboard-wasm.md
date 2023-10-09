---
layout: default
---

# Checkerboard (wasm)

<Transform scale="0.75">

We can inspect the sections available in the WASM binary using the <Anchor href="https://github.com/WebAssembly/wabt" text="WebAssembly Binary Toolkit" />.

The `Export` section contains zig functions we exported using `export fn`.

```sh
wasm-objdump public/checkerboard.wasm --details --section Export

Export[3]:
 - func[0] <getCheckerboardBufferPointer> -> "getCheckerboardBufferPointer"
 - func[1] <getCheckerboardSize> -> "getCheckerboardSize"
 - func[2] <colorCheckerboard> -> "colorCheckerboard"
```

The `Import` section contains functions and `WebAssembly.Memory` objects we defined in JS.

```sh
wasm-objdump public/checkerboard.wasm --details --section Import

Import[1]:
 - memory[0] pages: initial=2 max=2 <- env.memory
```

The `Type` section contains the data types available in the wasm module.

```sh
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
