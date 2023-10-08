---
layout: default
---
# WebAssembly (demo)

<div>
  <p>
  Source code: <Anchor href="https://github.com/jackdbd/zigfmt-web" text="jackdbd/zigfmt-web" />
  </p>
</div>

<WebAssemblyDemo zigCode='const std = @import("std"); pub fn main() void { std.debug.warn("Hello World\n"); }' />

<small>🕵️ Debug it! Open Chrome DevTools > <code class="inline-code">Sources</code> tab > open <code class="inline-code">fmt.wasm</code> > place a breakpoint in the <code class="inline-code">$format_zig_code</code> function.</small>
