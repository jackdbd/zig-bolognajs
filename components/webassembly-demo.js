import { EMOJI } from "./constants.js";

export const makeFormatZigCode = (exportedWebAssemblyValues) => {
  const { format_zig_code, memory, wasm_alloc, wasm_dealloc } =
    exportedWebAssemblyValues;

  // https://developer.mozilla.org/en-US/docs/Web/API/TextEncoder
  const utf8_encoder = new TextEncoder();
  // https://developer.mozilla.org/en-US/docs/Web/API/TextDecoder
  const utf8_decoder = new TextDecoder("utf-8");

  return function formatZigCode(text, log = console.log) {
    // In zig, string literals are const pointers to arrays of u8, and by
    // convention parameters that are "strings" are expected to be UTF-8 encoded
    // slices of u8. This means we need to convert the `text` JS string to an
    // UTF-8 encoded byte stream (i.e. an Uint8Array).
    // https://www.youtube.com/watch?v=VgjRyaRTH6E&t=1248s
    const utf8_array = utf8_encoder.encode(text);

    // Before calling `format_zig_code` we need to allocate memory, both for
    // the function parameters and the return value.
    // In this case the function
    // parameter is just one, the Uint8Array for the UTF-8 encoded characters.

    // The function format_zig_code has just one parameter: the Uint8Array of
    // UTF-8 encoded characters. We need to allocate as many bytes as the UTF-8
    // encoded character code points.
    const params_bytes = utf8_array.length;

    // The return value of the format_zig_code function is a slice, so we need
    // to allocate one u32 for the starting memory address and one u32 for the
    // slice length. This means u32 + u32 --> 64 bits --> 8 bytes
    const return_values_bytes = 8;

    const tot_bytes = params_bytes + return_values_bytes;

    log(
      `${EMOJI.INFO} try allocating ${tot_bytes} bytes (${params_bytes} for the parameters, ${return_values_bytes} for the return value)`
    );

    const start_address = wasm_alloc(tot_bytes);

    if (start_address === 0) {
      return {
        error: new Error(
          `wasm_alloc could not allocate ${tot_bytes} bytes of memory`
        ),
      };
    }

    log(
      `${EMOJI.INFO} allocated ${tot_bytes} bytes, starting from address ${start_address}`
    );

    // copy each byte of the input utf8_array to a new Uint8Array
    var out_utf8_array = new Uint8Array(memory.buffer);
    log(
      `${EMOJI.INFO} Uint8Array has ${out_utf8_array.byteLength} bytes, offset ${out_utf8_array.byteOffset}, ${out_utf8_array.BYTES_PER_ELEMENT} bytes per element`
    );
    for (let i = 0; i < params_bytes; ++i) {
      out_utf8_array[start_address + return_values_bytes + i] = utf8_array[i];
    }

    // the function format_zig_code expects the memory location of the text (i.e.
    // the zig source code in the <textarea>) to be the first argument, and the
    // memory location of the return value to be the third argument.
    // This means the first memory address for the text in the <textarea> is
    // `start_address + return_values_bytes`
    try {
      const succeeded = format_zig_code(
        start_address + return_values_bytes,
        params_bytes,
        start_address,
        start_address + 32 / 8
      );

      if (!succeeded) {
        return {
          error: new Error(`format_zig_code was not successful`),
        };
      }
    } catch (err) {
      // The snippet of code here causes format_zig_code to throw an exception
      // https://ziglang.org/documentation/0.9.0/#Values
      return {
        error: new Error(`format_zig_code threw ${err.name}: ${err.message}`),
      };
    }

    // copy the return value into a new Uint32Array
    log(
      `${EMOJI.INFO} Uint32Array memory return_values_bytes ${return_values_bytes}`
    );
    const return_slice = new Uint32Array(
      memory.buffer.slice(start_address, start_address + return_values_bytes)
    );
    const return_val_address = return_slice[0];
    const return_val_len = return_slice[1];

    // deallocate both the function parameters and the return value. We can
    // deallocate the return value because we have just copied it. Allocations
    // might fail, while deallocations always succeed.
    wasm_dealloc(start_address, tot_bytes);

    log(
      `${EMOJI.INFO} deallocated ${tot_bytes} bytes, starting from address ${start_address}`
    );

    const addr_start = return_val_address;
    const addr_stop = return_val_address + return_val_len;

    // the value stored at the memory addresses [addr_start..addr_stop] is the
    // UTF-8 encoded text that was formatted by the format_zig_code function.
    const encoded = new Uint8Array(memory.buffer.slice(addr_start, addr_stop));
    return { value: utf8_decoder.decode(encoded) };
  };
};
