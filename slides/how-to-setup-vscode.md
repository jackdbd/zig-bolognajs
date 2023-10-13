---
layout: default
---
# How to setup VS Code for Zig?

<Transform scale="1">

Install the VS Code extension <Anchor href="https://marketplace.visualstudio.com/items?itemName=ziglang.vscode-zig" text="ziglang.vscode-zig" /> and declare it in your <code class="inline-code">.vscode/extensions.json</code>

```json
{
    "recommendations": ["ziglang.vscode-zig"]
}
```

<code class="inline-code">ziglang.vscode-zig</code> automatically installs the <Anchor href="https://install.zigtools.org/" text="Zig Language Server (zls)" /> for autocompletion, goto definition, formatting, etc.

</Transform>

<!--
Zig Language Server (zls) implements Microsoft's Language Server Protocol for Zig in Zig.
-->
