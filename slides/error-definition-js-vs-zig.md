---
layout: two-cols
---
<h1>Defining errors in <NodejsLogo /></h1>

<Transform scale="0.85">

<Citation
  author="nodebestpractices"
  citeHref="https://github.com/goldbergyoni/nodebestpractices/tree/master/sections/errorhandling"
  citeText="Use only the built-in Error object">
  <template v-slot:quote>
    <p slot="quote">Consider extending the <code class="inline-code">Error</code> object with additional properties, but be careful not to overdo it. It's generally a good idea to extend the built-in <code class="inline-code">Error</code> object <span class="color:accent">only once</span>.</p>
  </template>
</Citation>

<p><Anchor href="https://hapi.dev/module/boom/api/" text="Boom (Hapi.js)" /> represents all HTTP errors with a <span class="color:accent">single</span> class that extends <code class="inline-code">Error</code>.</p>

```js
exports.Boom = class extends Error {
  constructor(messageOrError, options = {}) {
    // ...
  }
}
```

<p><Anchor href="https://github.com/fastify/fastify-error/tree/master" text="@fastify/error" /> defines this factory function.</p>

```js
function createError (
  code, message, statusCode = 500, Base = Error
) {
  // ...
}
```

</Transform>

::right::

<h1>Defining errors in <ZigLogo /></h1>

<Transform scale="0.85">

<p>Define an <Anchor href="https://ziglang.org/documentation/0.10.1/#Error-Set-Type" text="error set type"/></p>

```zig
const NumberNotInRangeError = error{
    TooSmall,
    TooBig,
};
```

The return type of a Zig function that might fail is:

```text
<error set type>!<expected type>
```

Zig errors cannot have a payload.

- <Anchor href="https://github.com/ziglang/zig/issues/2647" text="Some people would want it" />
- <Anchor href="https://www.reddit.com/r/Zig/comments/wqnd04/my_reasoning_for_why_zig_errors_shouldnt_have_a/" text="Some others would not" />

</Transform>

<!--
Boom errors contain additional payload and methods for returning HTTP status codes in a consistent way.

I don't like the Fastify approach. It does not enforce a single error type, so in theory I could create many subclasses of Error. This approach would be typical in Python (where it's standard practice to define many exceptions), but it's not a good idea in JS.

Zig errors are basically like C return codes.
-->
