---
layout: two-cols
---
<h1>Defining errors in JS</h1>

<Transform scale="0.85">

<p>Don't. Or do it only once.</p>

<Citation
  author="nodebestpractices"
  citeHref="https://github.com/goldbergyoni/nodebestpractices/tree/master/sections/errorhandling"
  citeText="Use only the built-in Error object">
  <template v-slot:quote>
    <p slot="quote">Consider extending the <code class="inline-code">Error</code> object with additional properties, but be careful not to overdo it. It's generally a good idea to extend the built-in <code class="inline-code">Error</code> object <span class="color:accent">only once</span>.</p>
  </template>
</Citation>

Example: Hapi web apps/APIs use <Anchor href="https://hapi.dev/module/boom/" text="Boom" />.

</Transform>

::right::

<h1>Defining errors in Zig</h1>

<Transform scale="0.85">

<p>Use an <Anchor href="https://ziglang.org/documentation/0.10.1/#Error-Set-Type" text="Error Set"/>.</p>

```text
const NumberNotInRangeError = error{
    TooSmall,
    TooBig,
};
```

The return type of a Zig function that might fail is:

```text
<error set>!<expected type>
```

Zig errors cannot have a payload.

- <Anchor href="https://github.com/ziglang/zig/issues/2647" text="Some people would want it" />
- <Anchor href="https://www.reddit.com/r/Zig/comments/wqnd04/my_reasoning_for_why_zig_errors_shouldnt_have_a/" text="Some others would not" />

</Transform>

<!--
Boom errors contain additional payload and methods for returning HTTP status codes in a consistent way.

Zig errors are basically like C return codes.
-->
