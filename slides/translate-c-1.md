---
layout: two-cols
---
# zig translate-c 1/4

<Transform scale="0.9">

Let's say we have downloaded the Node.js <code class="inline-code">18.17.0</code> header files to <code class="inline-code">deps/node-v18.17.0</code>.

```sh
.
└── include
    └── node
        ├── common.gypi
        ├── config.gypi
        ├── cppgc
        ├── js_native_api.h
        ├── js_native_api_types.h
        ├── ...
        ├── node_api.h
        ├── node_api_types.h
        ├── ...
        ├── uv.h
        ├── v8.h
        ├── ...
        └── zlib.h
```

We can try translating them from C to Zig:

```sh
zig translate-c \
  deps/node-v18.17.0/include/node/node_api.h \
  > node_api.zig
```

</Transform>

::right::

# zig translate-c 2/4

<Transform scale="0.9">

The C enum [napi_status](https://nodejs.org/api/n-api.html#napi_status)...

```c
typedef enum {
  napi_ok,
  napi_invalid_arg,
  napi_object_expected,
  napi_string_expected,
  // etc...
} napi_status; 
```

...becomes a bunch of Zig constants:

```zig
pub const napi_ok: c_int = 0;
pub const napi_invalid_arg: c_int = 1;
pub const napi_object_expected: c_int = 2;
pub const napi_string_expected: c_int = 3;
// etc...
pub const napi_status = c_uint;
```

</Transform>
