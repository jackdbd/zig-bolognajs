---
layout: two-cols
---
# No garbage collection

<Transform scale="0.85">

Modern garbage collectors (G1, Orinoco, etc) are really complex and they are basically a black box.

<Citation
  citeHref="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/FinalizationRegistry"
  citeText="FinalizationRegistry on mdn web docs">
  <template v-slot:quote>
    <p slot="quote">
    When, how, and whether garbage collection occurs is down to the implementation of any given JavaScript engine. Any behavior you observe in one engine may be different in another engine, in another version of the same engine, or <span class="color:accent">even in a slightly different situation with the same version of the same engine</span>.
    </p>
  </template>
</Citation>

<br>

<Citation
  citeHref="https://docs.python.org/3/reference/datamodel.html#object.__del__"
  citeText="__del__ on docs.python.org">
  <template v-slot:quote>
    <p slot="quote">
    It is <span class="color:accent">not guaranteed</span> that <code class="inline-code">__del__()</code> methods are called for objects that still exist when the interpreter exits.
    </p>
  </template>
</Citation>

</Transform>

::right::

# No reference counting

<Transform scale="0.85">

Several C libraries (GTK, Cairo) use <code class="inline-code">GObject</code> (GLib Object System). GObjects are reference counted. As long as their reference count is nonzero, they are "alive", and when their reference count drops to zero, they are deleted from memory.

GObject's use of GLib's <code class="inline-code">g_malloc()</code> memory allocation function will cause the program to <span class="color:accent">exit unconditionally upon memory exhaustion</span>.

<Citation
  citeHref="https://ziglang.org/documentation/master/#Heap-Allocation-Failure"
  citeText="Heap Allocation Failure on ziglang.org">
  <template v-slot:quote>
    <p slot="quote">
    Many programming languages choose to handle the possibility of heap allocation failure by unconditionally crashing. By convention, Zig programmers do not consider this to be a satisfactory solution.
    </p>
  </template>
</Citation>

</Transform>

<!--
Allocation might fail, so you have to handle failure.
Deallocation must always succeed.

C has manual memory management, right? Sure, but many libraries do reference counting, so you don't really have to manage memory.

C has a default allocator - malloc, realloc, and free.
-->
