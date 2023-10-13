---
layout: default
---

<h1>Node.js addon with <span class="color:accent">Node-API</span> 1/2</h1>

<Transform scale="0.8">

Possible project structure:

```sh
.
├── build.zig
├── deps
│   └── node-v18.17.0
├── dist
│   ├── debug
│   └── release
├── download-node-headers.sh
├── examples
│   ├── bare-minimum.cjs
│   └── greet.cjs
├── package.json
├── package-lock.json
├── README.md
├── src
│   ├── addon.zig
│   ├── c.zig
│   └── napi.zig
├── test
│   └── index.cjs
├── zig-cache
└── zig-out
```

Source: <Anchor href="https://github.com/jackdbd/zig-nodeapi-example" text="jackdbd/zig-nodeapi-example" />

</Transform>
