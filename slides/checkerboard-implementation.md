---
layout: two-cols
---
# Checkerboard (JS)

<Transform scale="0.75">

Instantiate a WebAssembly module and grant it an initial and maximum number of <Anchor href="https://developer.mozilla.org/en-US/docs/WebAssembly/JavaScript_interface/Memory/" text="WebAssembly.Memory" /> pages (64 KiB each).

```js
let memory = new WebAssembly.Memory({
  initial: 2, maximum: 2
})

const importObject = { env: { memory } }

const {
  instance
} = await WebAssembly.instantiateStreaming(
  fetch('checkerboard.wasm'), importObject)
```

<p>These functions are defined in <code class="inline-code">checkerboard.zig</code> using <code class="inline-code">export fn</code>.</p>

```js
const {
  colorCheckerboard,
  getCheckerboardBufferPointer,
  getCheckerboardSize,
} = instance.exports
```

Get the canvas from the DOM, get a memory slice representing a 1D RGBA array, use this slice as image data, draw the canvas.
</Transform>

::right::

# Checkerboard (Zig)

<Transform scale="0.75">

<p>Define functions and <code class="inline-code">export</code> them.</p>

```zig
const std = @import("std");

const checkerboard_size: usize = 8;

// each pixel is 4 bytes (rgba)
var checkerboard_buffer = std.mem.zeroes(
    [checkerboard_size][checkerboard_size][4]u8,
);

// The returned pointer will be used as an offset
// integer to the wasm memory
export fn getCheckerboardBufferPointer() [*]u8 {
    return @ptrCast(&checkerboard_buffer);
}

export fn getCheckerboardSize() usize {
    return checkerboard_size;
}

export fn colorCheckerboard(
    dark_value_red: u8,
    dark_value_green: u8,
    dark_value_blue: u8,
    light_value_red: u8,
    light_value_green: u8,
    light_value_blue: u8,
) void {
    // implementation not shown
}
```
</Transform>
