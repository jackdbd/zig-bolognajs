---
layout: two-cols
---
# wasm-api (JS/TS)

<Transform scale="0.85">

```js
import {WasmBridge} from "@thi.ng/wasm-api"
import {WasmDom} from "@thi.ng/wasm-api-dom"
import {WasmCanvas2D} from "@thi.ng/wasm-api-canvas"
import WASM_URL from "/canvas.wasm?url"

const bridge = new WasmBridge([
  new WasmCanvas2D(), new WasmDom()]
)

await bridge.instantiate(fetch(WASM_URL))

// call WASM main function to kick off
bridge.exports.start()
```

</Transform>

::right::

# wasm-api (Zig)

<Transform scale="0.85">

```zig
const canvas2d = @import("wasm-api-canvas");
const wasm = @import("wasm-api");
const dom = @import("wasm-api-dom");

// expose thi.ng/wasm-api core API
// (incl. panic handler & allocation fns)
pub usingnamespace wasm;

fn initApp() !void {
    const canvas = dom.createCanvas(&.{
        .width = 640,
        .height = 480,
        .parent = dom.body,
        .dpr = 1,
        .index = 0,
    });

    canvas2d.beginCtx(canvas);

    canvas2d.setFont("100px Menlo");
    canvas2d.setTextBaseline(.top);
    canvas2d.fillText("Ciao", 10, 10, 0);
}

export fn start() void {
    wasm.printStr("started canvas-wasm");
    initApp() catch |e| @panic(@errorName(e));
}
```

</Transform>
