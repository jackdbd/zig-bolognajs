---
layout: default
---

<h1>Why not C / C++ / Rust? <RustLogo /></h1>

<Transform scale="0.85">

<Anchor 
href="https://ziglang.org/learn/why_zig_rust_d_cpp/" 
text="Why Zig When There is Already C++, D, and Rust?" />

**C**

- Footguns everywhere
- Preprocessor macros
- Cleanup code can be <Anchor href="https://youtu.be/Gv2I7qTux7g?t=1752" text="really messy" />

**C++**

- Complex, too many features
- Error handling tipically done using exceptions
- Why should I have written ZeroMQ in C, not C++, <Anchor href="https://250bpm.com/blog:4/" text="part 1" /> and <Anchor href="https://250bpm.com/blog:8/" text="part 2" />

**Rust**

- <Anchor href="https://twitter.com/rust_foundation/status/1644132378858729474" text="Questionable policies" />
- Complex, ownership and lifetimes are hard to understand
- Writing unsafe Rust is hard because it has a lot of [nuanced rules about undefined behaviour](https://zackoverflow.dev/writing/unsafe-rust-vs-zig/)

</Transform>

<!--
I can't say much about Go. I wrote only a few hundred lines of Go.

Linus Torvalds' quote about C++: C++ is a horrible language
The author of ZeroMQ did NOT use C++ exceptions, but in the constructor/destructur you kind of have to use them.

Explain what ZeroMQ is. And why C is a better candidate than C++ for this kind of fault-tolerant software.

Consider what happens when **initialisation** of an object can fail. Constructors have no return values, so failure can be reported only by throwing an exception. However, I've decided not to use exceptions.

Moreover, even if initialisation wasn't a problem, **termination** definitely is. You can't really throw exceptions in the destructor. Not because of some self-imposed artificial restrictions but because if the destructor is invoked in the process or unwinding the stack and it happens to throw an exception, it crashes the entire process.

In C, preprocessor macros transform your program **before** actual compilation.
-->
