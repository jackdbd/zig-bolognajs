<script setup lang="js">
import { onMounted } from 'vue'
import { WasmBridge } from "@thi.ng/wasm-api";
import { WasmCanvas2D } from "@thi.ng/wasm-api-canvas";
import { WasmDom } from "@thi.ng/wasm-api-dom";
import WASM_URL from "/canvas.wasm?url";

let bridge;
let canvas_in_dom = false;

onMounted(async() => {
  // create new WASM bridge with extra API modules
  bridge = new WasmBridge([new WasmCanvas2D(), new WasmDom()]);
  // instantiate WASM module & bindings
  await bridge.instantiate(fetch(WASM_URL));
})

const onClick = (() => {
  if (!canvas_in_dom) {
    canvas_in_dom = true;
    // call WASM main function to kick off
    bridge.exports.start();
    const el = document.querySelector('.imposter')
    if (el) {
      el.classList.add("imposter", "wasm-api-canvas")
    }
  }
})

const onClickRemoveCanvas = (() => {
  const el = document.querySelector('.imposter')
  if (el) {
    el.remove()
    canvas_in_dom = false;
  }
})

</script>

<style scoped>
</style>

<template>
  Click to <button class="btn" @click="onClick">create a canvas</button> and <button class="btn" @click="onClickRemoveCanvas">remove it from the DOM</button>
</template>