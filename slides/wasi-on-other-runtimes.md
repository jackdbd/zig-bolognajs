---
layout: two-cols
---

# JS+WASM runtimes

<Transform scale="0.8">

We can deploy to any environment that offers both a JS runtime <span class="color:accent">and</span> a WebAssembly runtime.

- AWS Lambda and AWS Lambda@Edge (V8)
- Bun (JavaScriptCore)
- Cloudflare Workers and Pages Functions (V8)
- Deno and Deno Deploy (V8)
- Fastly Compute@Edge (SpiderMonkey)
- [WasmEdge](https://wasmedge.org/docs/develop/javascript/intro/) (QuickJS)
- [Lagon](https://lagon.app/)?

No need to change Zig code. Keep compiling it with <code class="inline-code">-target wasm32-wasi</code>.

These ones are <span class="color:accent">just</span> WASM runtimes:

- [wasmtime](https://github.com/bytecodealliance/wasmtime)
- [WebAssembly Micro Runtime (WAMR)](https://github.com/bytecodealliance/wasm-micro-runtime)
- [GraalWasm](https://www.graalvm.org/latest/reference-manual/wasm/)

</Transform>

::right::

# WASI in Workers

<Transform scale="0.8">

```js
import { WASI } from "@cloudflare/workers-wasi"
import demoWasm from "./demo.wasm"

export default {
  async fetch(request, _env, ctx) {
    const stdout = new TransformStream()

    const wasi = new WASI({
      args: [],
      // Cloudflare does not expose a filesystem API
      // => no WASI preopens except stdin/stdout
      // See Cloudflare security-model
      stdin: request.body,
      stdout: stdout.writable,
    })

    const instance = new WebAssembly.Instance(
        demoWasm,
        { wasi_snapshot_preview1: wasi.wasiImport }
    )

    // Keep our worker alive until the WASM has
    // finished executing.
    ctx.waitUntil(wasi.start(instance))

    // Finally, let's reply with the WASM's output.
    return new Response(stdout.readable)
  },
}
```

</Transform>

<!--
The ones within brackets are JS engines.

Clouflare implemented its own JS/WASM runtime based on V8. [workerd](https://github.com/cloudflare/workerd) is the open
source version of the JS/WASM runtime that powers Cloudflare Workers. It has
feature-parity with the Cloudflare Workers runtime.

JS + WASM => no need for containers.

Watch this talk: [Fine-Grained Sandboxing with V8 Isolates](https://www.infoq.com/presentations/cloudflare-v8/)

Beware of platform limitations. For example:

- A Cloudflare Worker cannot exceed 1MB in size (free plan) or 5MB (paid plan).
-->
