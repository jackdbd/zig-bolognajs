---
layout: default
---

# WASI (JS)

<Transform scale="0.95">

```js
import { readFile } from "node:fs/promises"
import { WASI } from "node:wasi"

// argv[0] - node binary
// argv[1] - fullpath to this script
// argv[2] - first parameter to pass to the WASI program
const args = process.argv.slice(1);

const wasi = new WASI({
  version: "preview1",
  args,
  env: process.env,
  preopens: {
    "/docs": "/home/jack/repos/zig-bolognajs/assets"
  },
})

const wasm = await WebAssembly.compile(await readFile(new URL("main.wasm", import.meta.url)))

const instance = await WebAssembly.instantiate(wasm, wasi.getImportObject())

wasi.start(instance)

```

</Transform>
