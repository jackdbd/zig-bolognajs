---
layout: two-cols
---

<h1>Why not C or C++?</h1>

<Transform scale="0.8">

**C**

- Footguns everywhere. See <Anchor href="https://github.com/git/git/blob/master/banned.h" text="banned.h" /> for a list of functions banned in the git codebase
- Preprocessor macros. The C preprocessor is <Anchor href="https://youtu.be/Gv2I7qTux7g?si=YjKtxtibE9PN9Uk5&t=356" text="another language" />
- Cleanup code can be <Anchor href="https://youtu.be/Gv2I7qTux7g?t=1752" text="really messy" />
- A lot of undefined behavior

**C++**

- Complex, too many features
- Error handling tipically done using exceptions (the [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html#Exceptions) prohibits their use)
- Why should I have written ZeroMQ in C, not C++, <Anchor href="https://250bpm.com/blog:4/" text="part 1" /> and <Anchor href="https://250bpm.com/blog:8/" text="part 2" />
- OOP cargo cult: <Anchor href="https://youtu.be/84JAO66amX4?si=NQEdgupuGG8MZTZH" text="The religion of virtual methods" />, <Anchor href="https://youtu.be/MvDUe2evkHg?si=7icSUQw2O53Djkcm&t=4773" text="RAII (Resource Acquisition Is Initialization)" />

</Transform>

::right::

<h1>Why not Rust or Go?</h1>

<Transform scale="0.8">

**Rust**

- Complex, too many features
- Ownership and lifetimes are hard to understand
- Writing unsafe Rust is hard because it has a lot of [nuanced rules about undefined behaviour](https://zackoverflow.dev/writing/unsafe-rust-vs-zig/)
- <Anchor href="https://twitter.com/rust_foundation/status/1644132378858729474" text="Questionable policies" />

**Go**

- Garbage collected
- ["Closed-world" language](https://fasterthanli.me/articles/lies-we-tell-ourselves-to-keep-using-golang)

<br/>

<Citation
  citeHref="https://ziglang.org/learn/why_zig_rust_d_cpp/"
  citeText="Why Zig When There is Already C++, D, and Rust?">
  <template v-slot:quote>
    <p slot="quote">C++, Rust, and D have such a large number of features that they can be distracting from the actual meaning of the application you are working on. One finds oneself debugging one’s knowledge of the programming language instead of debugging the application itself.</p>
  </template>
</Citation>

</Transform>

<!--
In C, preprocessor macros transform your program **before** actual compilation.

I can't say much about Go. I wrote only a few hundred lines of Go.

Linus Torvalds' quote about C++: C++ is a horrible language
The author of ZeroMQ did NOT use C++ exceptions, but in the constructor/destructur you kind of have to use them.
The Google style guide prohibits the use of C++ exceptions. https://google.github.io/styleguide/cppguide.html#Exceptions

Explain what ZeroMQ is. And why C is a better candidate than C++ for this kind of fault-tolerant software.

Consider what happens when **initialisation** of an object can fail. Constructors have no return values, so failure can be reported only by throwing an exception. However, I've decided not to use exceptions.

Moreover, even if initialisation wasn't a problem, **termination** definitely is. You can't really throw exceptions in the destructor. Not because of some self-imposed artificial restrictions but because if the destructor is invoked in the process or unwinding the stack and it happens to throw an exception, it crashes the entire process.

With regards to RAII (as in constructors/destructors, not the stuff in the issue you linked), I think it simply didn't fit within Zig's goals. A big part of Zig is readability; what you read is what you get, and RAII is very much not that. Looking at a block of C++ code, there's no way to tell what happens unless you also know what the constructors/destructors of each data type in the block does.
https://news.ycombinator.com/item?id=27401371

https://nikhilism.com/post/2021/raii-footguns-rust-cpp/

Other names for RAII include Constructor Acquires, Destructor Releases (CADRe)[10] and one particular style of use is called Scope-based Resource Management (SBRM). This latter term is for the special case of automatic variables. RAII ties resources to object lifetime, which may not coincide with entry and exit of a scope.

The Go toolchain does not use the assembly language everyone else knows about. It does not use the linkers everyone else knows about. It does not let you use the debuggers everyone knows about, the memory checkers everyone knows about, or the calling conventions everyone else has agreed to suffer, in the interest of interoperability.
-->
