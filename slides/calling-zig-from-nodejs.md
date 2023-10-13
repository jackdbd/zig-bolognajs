---
layout: default
---
# Calling Zig from Node.js

<Transform scale="1">

Possible approaches:

1. Direct use of internal V8, libuv, and Node.js libraries
1. Native Abstractions for Node.js (nan)
1. Node-API (formerly known as N-API)

Node-API versions are additive and versioned independently from Node.js. See <Anchor href="https://nodejs.org/api/n-api.html#node-api-version-matrix" text="Node-API version matrix" />

Version 9 is an extension to version 8 in that it has all of the APIs from version 8 with some additions.

<Citation
  citeHref="https://nodejs.org/api/addons.html#c-addons"
  citeText='Node.js documentation'>
  <template v-slot:quote>
    <p slot="quote">Unless there is a need for direct access to functionality which is not exposed by Node-API, use <b class="color:accent">Node-API</b>.</p>
  </template>
</Citation>

</Transform>

<!--
Although Node-API provides an ABI stability guarantee, other parts of Node.js
do not, and any external libraries used from the addon may not.

Node-API is backward and forward compatible.

Node-API versions are additive, no semantic versioning => no breaking changes.

A native addon author can take advantage of the Node-API forward compatibility
guarantee by ensuring that the addon makes use only of APIs defined in
node_api.h and data structures and constants defined in node_api_types.h.
-->
