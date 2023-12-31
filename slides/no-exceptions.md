---
layout: two-cols
---
# No exceptions

<Transform scale="0.9">

Exceptions make cleaning up resources problematic.

<Citation
  citeHref="https://google.github.io/styleguide/cppguide.html#Exceptions"
  citeText="Google C++ Style Guide">
  <template v-slot:quote>
    <p slot="quote">
    When you add a <code class="inline-code">throw</code> statement to an existing function, you must examine all of its transitive callers. Either they must make at least the basic exception safety guarantee, or they must never catch the exception and be happy with the program terminating as a result. For instance, if <code class="inline-code">f()</code> calls <code class="inline-code">g()</code> calls <code class="inline-code">h()</code>, and <code class="inline-code">h</code> throws an exception that <code class="inline-code">f</code> catches, <code class="inline-code">g</code> has to be careful or it may not clean up properly.
    </p>
  </template>
</Citation>

Exceptions hide control flow.

<Citation
  citeHref="https://google.github.io/styleguide/cppguide.html#Exceptions"
  citeText="Google C++ Style Guide">
  <template v-slot:quote>
    <p slot="quote">
    [...] exceptions make the control flow of programs difficult to evaluate by looking at code: functions may return in places you don't expect. This causes maintainability and debugging difficulties.</p>
  </template>
</Citation>

</Transform>

::right::

# Errors as values

<Transform scale="0.9">

Zig errors are <span class="color:accent">values</span>. Handle them like any other value.

```zig
fn doAThing(str: []u8) void {
    if (parseU64(str, 10)) |number| {
        doSomethingWithNumber(number);
    } else |err| switch (err) {
        error.Overflow => {
            // handle overflow...
        },
        error.InvalidChar => {
            // handle invalid char...
        },
        // Zig will not compile if we forgot to
        // handle all possible errors.
    }
}
```

We can use the same approach in our JS code by never throwing an <code class="inline-code">Error</code>, but always returning it.

For example, in [Joi](https://joi.dev/api/?v=17.9.1#anyvalidatevalue-options):

```js
const result = joi.validate(value, options)
const { error, value, warning, artifacts } = result
```

</Transform>

<!--
-->
