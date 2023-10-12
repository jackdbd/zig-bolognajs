---
layout: two-cols
---
<h1>
<Anchor 
  href="https://github.com/ziglang/zig/blob/master/lib/std/heap.zig" 
  text="std.heap" />
</h1>

<Transform scale="0.85">

<div>
  <p>Memory allocators in <code class="inline-code">std/heap.zig</code>:</p>
</div>

- <code class="inline-code">std.heap.ArenaAllocator</code>
- <code class="inline-code">std.heap.FixedBufferAllocator</code>
- <code class="inline-code">std.heap.GeneralPurposeAllocator</code>
- <code class="inline-code">std.heap.LoggingAllocator</code>
- <code class="inline-code">std.heap.LogToWriterAllocator</code>
- <code class="inline-code">std.heap.PageAllocator</code>
- <code class="inline-code">std.heap.ScopedLoggingAllocator</code>
- <code class="inline-code">std.heap.ThreadSafeAllocator</code>
- <code class="inline-code">std.heap.WasmAllocator</code>
- <code class="inline-code">std.heap.WasmPageAllocator</code>

</Transform>

::right::

<h1>
<Anchor 
  href="https://github.com/ziglang/zig/blob/master/lib/std/testing.zig" 
  text="std.testing" />
</h1>

<Transform scale="0.85">

<div>
  <p>Memory allocators in <code class="inline-code">std/testing.zig</code>:</p>
</div>

- <code class="inline-code">std.testing.allocator</code>
- <code class="inline-code">std.testing.FailingAllocator</code>

</Transform>

<!--
Tip: read a few tests of the memory allocators (and the memory pools) in std.heap.
-->
