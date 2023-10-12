---
layout: default
---
# <code class="inline-code">try</code> / <code class="inline-code">catch</code> / <code class="inline-code">@panic</code>

<Transform scale="0.85">

The keyword <code class="inline-code">try</code> is a shortcut for <code class="inline-code">catch |err| return err</code>. That <code class="inline-code">|err|</code> is called <span class="color:accent">capture</span>.

Often you don't <code class="inline-code">catch</code>. You simply <code class="inline-code">try</code>. You <code class="inline-code">catch</code> only <span class="color:accent">when you can handle</span> the error.

If you have <span class="color:accent">no idea how to handle</span> a runtime error and/or <span class="color:accent">want to crash</span> the program, use <code class="inline-code">@panic</code>.

You should (ideally) never use <code class="inline-code">@panic</code> in a library.

You can <Anchor href="https://github.com/ziglang/zig/issues/578#issuecomment-349811885" text="override the behavior" /> of <code class="inline-code">@panic</code>. I'm not sure it's a good idea though.

If you know already at <span class="color:accent">compile time</span> that something is wrong, use <code class="inline-code">@compileError</code>.

See also <Anchor 
  href="https://youtu.be/TOIYyTacInM" 
  text="Error, panic or unreachable? - Loris Cro" /> and <Anchor 
  href="https://www.huy.rocks/everyday/01-10-2022-zig-handling-errors" 
  text="Zig / Handling errors" />.

## error return trace $\neq$ stack trace

When an error is returned, you get an <span class="color:accent">error return trace</span>.

When <code class="inline-code">@panic</code> is called, you get a <span class="color:accent">stack trace</span>.

<Anchor href="https://ziglang.org/documentation/master/#Error-Return-Traces" text="This comparison" /> illustrates how an error return trace offers better debuggability.

</Transform>

<!--
The nodebestpractices repo is clear on the distinction between operational errors and programmer errors.
https://github.com/goldbergyoni/nodebestpractices/blob/master/sections/errorhandling/operationalvsprogrammererror.md

**Operational errors** refer to situations where you understand what happened and the impact of it – for example, a query to some HTTP service failed due to connection problem. Operational errors are relatively easy to handle.

**Programmer errors (aka bugs)** refer to cases where you have no idea why and sometimes where an error came from. With a programmer error there’s nothing better you can do than to restart gracefully.
-->
