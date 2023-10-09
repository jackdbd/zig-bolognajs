---
layout: two-cols
---
# Checkerboard

<!-- Number of initial and maximum WebAssembly memory pages reserved on the heap memory. These numbers must match the number of pages used in build.zig. -->
<Checkerboard initialMemoryPages=2 maxMemoryPages=2 />

Adapted from: <Anchor href="https://github.com/daneelsan/minimal-zig-wasm-canvas" text="minimal-zig-wasm-canvas" />

::right::

# Debug it!

- Open Chrome DevTools.
- Go to the <code class="inline-code">Sources</code> tab.
- Open the <code class="inline-code">checkerboard.wasm</code> file.
- Place a breakpoint in the <code class="inline-code">$colorCheckerboard</code> function, right after the local variables.
- Press F8 a few times to resume script execution when it pauses on the breakpoint.
