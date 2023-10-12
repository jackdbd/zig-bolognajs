---
layout: default
---

# WASI (JS)

<Transform scale="0.75">

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

The <Anchor href="https://nodejs.org/api/wasi.html" text="WebAssembly System Interface (WASI)" /> is still experimental.

There is a discussion on <Anchor href="https://github.com/nodejs/node/issues/46254" text="marking the Node.js WASI module as stable" />.

Launch with `node --experimental-wasi-unstable-preview1 app.js` in Node.js < `20.0.0`.

</Transform>
