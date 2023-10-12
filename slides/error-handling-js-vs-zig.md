---
layout: two-cols
---
<h1>Handling failures in JS</h1>

<Transform scale="0.85">

<span>In JavaScript, <code class="inline-code">catch</code> catches <span class="color:accent">exceptions</span>.</span><br>
<span>JS functions can <code class="inline-code">throw</code> anything → An exception can be anything.</span><br>
<span>We <span class="color:accent">do not know</span> what we caught.</span>

<!-- We don't know what we are getting.</span> -->

```js
const fn = () => {
  throw "I'm not an error object"
  // throw 42
  // throw true
  // throw { a: 1 }
  // throw undefined
}

const main = async () => {
  try {
    fn()
  } catch (ex) {
    console.trace(ex)
    console.log("message", ex.message)
    console.log("stack trace", ex.stack)
  }
}

main()
```

</Transform>

::right::

<h1>Handling failures in Zig</h1>

<Transform scale="0.85">

<span>In Zig, <code class="inline-code">catch</code> catches <span class="color:accent">errors</span>.</span><br>
<span>Zig functions can <code class="inline-code">return</code> possible error values → An error type is a set of all possible values.</span><br>
<span>We <span class="color:accent">know</span> what we caught.</span>

```text
fn isNumInRange(n: u8) NumberNotInRangeError!bool {
    if (n <= 3) {
        return NumberNotInRangeError.TooSmall;
    } else if (n >= 7) {
        return NumberNotInRangeError.TooBig;
    } else {
        return true;
    }
}

pub fn main() void {
    var b = isNumInRange(5) catch false;
    std.debug.print("5 in range? {}\n", .{ b });

    b = isNumInRange(9) catch |err| blk: {
        std.debug.print("Error: {any}\n", .{err});
        break :blk false;
    };
    std.debug.print("9 in range? {}\n", .{ b });
}
```

</Transform>

<!--
If we throw undefined, then in the catch ex.message throws a TypeError. So it's the worst.

We don't know what we caught. That's why in TypeScript we have:
- `catch(e: any)` and not
- `catch(e: Error | SomeOtherError)`

- `isNumInRange(5)` prints true
- `isNumInRange(9)` prints false

The labeled block that starts with blk: nd ends with :blk is necessary because we have to return a value to be assigned to `b` (a boolean in this case), and we can't use `return` because we are still in the same function.
-->
