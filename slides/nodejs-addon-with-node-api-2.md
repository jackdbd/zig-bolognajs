---
layout: default
---

<h1>Addon with <span class="color:accent">Node-API</span> 2/2</h1>

<Transform scale="0.8">

In <code class="inline-code">c.zig</code>, import the C header file/s.

```zig
pub usingnamespace @cImport({
    @cInclude("node_api.h");
});
```

In <code class="inline-code">napi.zig</code>, import <code class="inline-code">c.zig</code> and implement all Zig data types / functions you want.

```zig
pub const c = @import("c.zig");

// implement Zig wrappers in this file.
```

In <code class="inline-code">addon.zig</code>, implement your addon functions and register them.

```zig
const std = @import("std");
const c = @import("c.zig");
const napi = @import("napi.zig");

fn foo(env: c.napi_env, cbinfo: c.napi_callback_info) callconv(.C) c.napi_value {
    _ = cbinfo;
    return napi.create_string(env, "Hi from the native addon!") catch return null;
}

export fn napi_register_module_v1(env: c.napi_env, exports: c.napi_value) c.napi_value {
    napi.register_function(env, exports, "foo", foo) catch return null;
    return exports;
}
```

</Transform>
