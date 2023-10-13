---
layout: default
---
# How to get zig?

<Transform scale="1">

Download and manage zig compilers with <Anchor href="https://github.com/marler8997/zigup" text="zigup" alt="zigup repo on GitHub" />

**Installation**

```sh
wget https://github.com/marler8997/zigup/releases/download/v2023_07_27/zigup.ubuntu-latest-x86_64.zip
unzip zigup.ubuntu-latest-x86_64.zip
chmod u+x zigup
mv zigup ~/bin/zigup
```

**Usage**

```sh
zigup fetch master
zigup fetch 0.11.0

zigup list

zigup default 0.12.0-dev.881+42998e637
zigup default 0.11.0
```

Double-check with <code class="inline-code">zig version</code>.

</Transform>

<!--
Similar to nvm, volta or asdf
https://asdf-vm.com/
-->
