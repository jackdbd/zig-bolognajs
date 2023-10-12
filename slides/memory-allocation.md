---
# layout: default
layout: two-cols
---
# Explicit allocations

<Transform scale="0.85">

Explicit memory management is hard, right? Not necessarily.

- <Anchor 
  href="https://youtu.be/c0g3S_2QxWM" 
  text="Code for Game Developers - Anatomy of a Memory Allocation (Jorge Rodriguez)" />
- <Anchor 
  href="https://youtu.be/MvDUe2evkHg" 
  text="Introduction to General Purpose Allocation (Casey Muratori)" />

Understanding a generational garbage collector like Orinoco is much harder.

- <Anchor href="https://youtu.be/Scxz6jVS4Ls" text="Orinoco: The new V8 Garbage Collector (Peter Marshall)" />
- <Anchor 
  href="https://dmitrysoshnikov.teachable.com/p/essentials-of-garbage-collectors" 
  text="Garbage Collection Algorithms — Dmitry Soshnikov" 
  alt="course on garbage collection algorithms by Dmitry Soshnikov" />

</Transform>

::right::

# Allocator interface

<Transform scale="0.85">

In Zig, functions which need to allocate accept an <code class="inline-code">Allocator</code> parameter.

<p>
  The memory allocator interface is defined in <Anchor 
  href="https://github.com/ziglang/zig/blob/master/lib/std/mem/Allocator.zig" 
  text="std/mem/Allocator.zig" 
  alt="Zig std.mem module" /> and <Anchor 
  href="https://github.com/ziglang/zig/blob/master/lib/std/mem.zig" 
  text="std/mem.zig" 
  alt="Zig std.mem module" />.
</p>

- <Anchor 
  href="https://youtu.be/vHWiDx_l4V0" 
  text="What's a Memory Allocator Anyway? - Benjamin Feng" 
  alt="Benjamin Feng explains what a memory allocator is, and showcases various memory allocators in Zig" />
- <Anchor 
  href="https://www.lagerdata.com/articles/testing-memory-allocation-failures-with-zig" 
  text="Testing memory allocation failures with Zig" />
- <Anchor 
  href="https://ziglang.org/documentation/master/#Choosing-an-Allocator" 
  text="Choosing an Allocator" />

This is a good idea. In fact, others are taking notes:

- <Anchor href="https://github.com/fitzgen/bumpalo" text="fitzgen/bumpalo" />
- <Anchor href="https://doc.rust-lang.org/std/alloc/trait.Allocator.html" text="Trait std::alloc::Allocator" />

</Transform>

<!--
At 27:45 Casey Muratori starts implementing an arena allocator.
-->
