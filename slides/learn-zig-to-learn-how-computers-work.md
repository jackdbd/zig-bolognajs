---
layout: default
---
<h1>Learn <span class="color:zig">Zig</span> to learn how computers work</h1>

<Citation
  author="A lot of people on the internet"
  citeText="Reddit, Twitter, etc">
  <template v-slot:quote>
    <p slot="quote">Learn C to learn about how computers work.</p>
  </template>
</Citation>

<br>

<Citation
  author="Steve Klabnik"
  citeHref="https://steveklabnik.com/writing/should-you-learn-c-to-learn-how-the-computer-works"
  citeText='Should you learn C to "learn how the computer works"?"'>
  <template v-slot:quote>
    <p slot="quote">Learn C to learn <b class="color:accent">more</b> about how computers work.</p>
  </template>
</Citation>

<br>

<v-click>

<Citation
  author="Me"
  citeText="This slide">
  <template v-slot:quote>
    <p slot="quote">Learn Zig to learn <b class="color:accent">even more</b> about how computers work*.</p>
  </template>
</Citation>

<p>* Because you have to pick your own memory allocator, your own libc, etc.</p>

</v-click>

<!--
Ok, jokes aside, here is why Zig is worth learning.

C does not describe **how the computer works**, it describes how the **C abstract machine** works.

**Runtime**, **virtual machine**, and **abstract machine** are different words for the same fundamental thing. But they've since gained different connotations, due to non-essential variance in different implementations of these ideas.

C is fundamentally an abstraction of hardware, and abstractions are leaky.

Maybe cite this:
https://github.com/cryptocode/bithacks
-->
