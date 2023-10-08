<script setup lang="ts">
import { ref, onMounted } from 'vue'

interface WasmExports {
    colorCheckerboard: (
        dark_red: number,
        dark_green: number,
        dark_blue: number,
        light_red: number,
        light_green: number,
        light_blue: number
    ) => void
    getCheckerboardBufferPointer: () => any
    getCheckerboardSize: () => number
}

interface Props {
  intervalMs?: number
  initialMemoryPages?: number
  maxMemoryPages?: number
}

const props = withDefaults(defineProps<Props>(), {
  intervalMs: 500,
  initialMemoryPages: 2,
  maxMemoryPages: 2,
})

let intervalMs = ref(props.intervalMs)
let initialMemoryPages = ref(props.initialMemoryPages)
let maxMemoryPages = ref(props.maxMemoryPages)

onMounted(async() => {
  let memory = new WebAssembly.Memory({
    initial: initialMemoryPages.value,
    maximum: maxMemoryPages.value,
  });

  const importObject = {
    env: {
      print: (buffer_length: number) => {
        console.log(
          `fixed buffer length (defined in zig code): ${buffer_length}`
        )
      },
      memory
    }
  }

  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/WebAssembly/instantiateStreaming
  const { instance } = await WebAssembly.instantiateStreaming(
    fetch('checkerboard.wasm'),
    importObject
  )

  const wasmMemoryArray = new Uint8Array(memory.buffer)

  const wasm_exports = instance.exports as unknown as WasmExports

  // Automatically set canvas size as defined in `checkerboard.zig`
  const checkerboardSize = wasm_exports.getCheckerboardSize()
  const canvas = document.getElementById("checkerboard")! as HTMLCanvasElement
  canvas.width = checkerboardSize
  canvas.height = checkerboardSize

  const ctx = canvas.getContext("2d")!
  const imageData = ctx.createImageData(canvas.width, canvas.height)
  ctx.clearRect(0, 0, canvas.width, canvas.height)

  const getDarkValue = () => {
    return Math.floor(Math.random() * 100)
  }

  const getLightValue = () => {
    return Math.floor(Math.random() * 127) + 127
  }

  const drawCheckerboard = () => {
    wasm_exports.colorCheckerboard(
      getDarkValue(),
      getDarkValue(),
      getDarkValue(),
      getLightValue(),
      getLightValue(),
      getLightValue()
    )

    const bufferOffset = wasm_exports.getCheckerboardBufferPointer()

    const imageDataArray = wasmMemoryArray.slice(
      bufferOffset,
      bufferOffset + checkerboardSize * checkerboardSize * 4
    )

    imageData.data.set(imageDataArray)

    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.putImageData(imageData, 0, 0)
    }

    drawCheckerboard()

    setInterval(() => {
        drawCheckerboard()
    }, intervalMs.value)
})

</script>

<style scoped>
canvas {
  /* border-radius: 0.25em; */
  image-rendering: pixelated;
  /* outline: 0.15rem solid var(--color-accent); */
  width: 90%;
}
</style>

<template>
  <div class="flex flex-row gap-2xl">
    <canvas id="checkerboard"></canvas>
    <div>
      <p><strong>Debug it!</strong></p>
      <ol>
        <li>Open Chrome DevTools.</li>
        <li>Go to the <code class="inline-code">Sources</code> tab.</li>
        <li>Open the <code class="inline-code">checkerboard.wasm</code> file.</li>
        <li>Place a breakpoint in the <code class="inline-code">$colorCheckerboard</code> function, right after the local variables.</li>
        <li>Press F8 a few times to resume script execution when it pauses on the breakpoint.</li>
      </ol>
    </div>
  </div>
</template>
