---
layout: two-cols
---
# zig translate-c 3/4

<Transform scale="0.9">

The C function [napi_create_string_utf8](https://nodejs.org/api/n-api.html#napi_create_string_utf8)...

```c
NAPI_EXTERN napi_status NAPI_CDECL
  napi_create_string_utf8(
    napi_env env,
    const char* str,
    size_t length,
    napi_value* result
);
```

...becomes this Zig function:

```zig
pub extern fn napi_create_string_utf8(
    env: napi_env,
    str: [*c]const u8,
    length: usize,
    result: [*c]napi_value
) napi_status;
```

</Transform>

::right::

# zig translate-c 4/4

<Transform scale="0.9">

The translation might not be complete, so check:

```sh
cat napi_api.zig  | grep 'unable to translate'
```

We can use <code class="inline-code">zig translate-c</code> to:

- <Anchor href="https://zig.news/sobeston/using-zig-and-translate-c-to-understand-weird-c-code-4f8" text="understand weird C code" />
- learn about the symbols exported by a C library
- produce Zig code before editing it into more idiomatic code (e.g. when we want to create a Zig wrapper for a C library)

</Transform>
