<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { EMOJI } from "./constants.js";
import { makeFormatZigCode } from "./webassembly-demo.js"

interface Props {
  fmt?: any
  logs?: any, // string[]
  zigCode: string
}

const props = withDefaults(defineProps<Props>(), {
    fmt: undefined,
    logs: ['Logs...'],
    zigCode: 'const std =    @import("std");'
})

const btnLabel = computed(() => {
  return `click ${EMOJI.CLICK}`
})

let fmt = ref(props.fmt)
let logs = ref(props.logs)
let zigCode = ref(props.zigCode)

onMounted(async() => {
  const importObject = {
    env: {
      foo: (int32: number, int64: number, float32: number, float64: number) => {
        console.log(
          `int32 ${int32}`,
          `int64 ${int64}`,
          `float32 ${float32}`,
          `float64 ${float64}`
        )
      },
      print: (buffer_length: number) => {
        console.log(
          `fixed buffer length (defined in zig code): ${buffer_length}`
        )
      }
    }
  }

  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/WebAssembly/instantiateStreaming
  const { instance, module } = await WebAssembly.instantiateStreaming(
    fetch('fmt.wasm'),
    importObject
  )

  // const imports = WebAssembly.Module.imports(module)

  // console.log(
  //   `the compiled WebAssembly module has these imports available`,
  //   imports
  // )

  // console.log(`created WebAssembly instance`, instance)

  // now that the WebAssembly instance is ready, we use a factory function to
  // create the JS function `formatZigCode`
  fmt.value = makeFormatZigCode(instance.exports)
})

// https://emojipedia.org/twitter/

const onClick = (_event: Event) => {
  const textarea = document.querySelector('textarea')!
  logs.value = []
  zigCode.value = ''

  const log = (msg: string) => {
    if (logs.value.length === 0) {
      logs.value = [msg]
    } else {
      logs.value.push(msg)
    }
  }

  if (fmt.value) {
    const result = fmt.value(textarea.value, log)
    if (result.error) {
      log(`${EMOJI.ERROR} ${result.error.message}`)
    } else {
      textarea.value = result.value
      log(`${EMOJI.SUCCESS} text formatted using WebAssembly`)
    }
  } else {
    alert(`fmt function not available. Did you compile the wasm module?`)
  }
}
</script>

<style scoped>
textarea {
  border-radius: 0.25em;
  font-family: monospace;
  outline: 0.15rem solid var(--color-accent);
  width: 100%;
}

.logs-wrapper {
  border-radius: 0.25em;
  outline: 0.15rem solid var(--color-alabaster);
  width: 100%;
}

.logs-wrapper > p {
  margin: 0;
}
</style>

<template>
  <div>
    <p>Paste some unformatted zig code in the <code class="inline-code">textarea</code> below and <button class="btn" @click="onClick">{{ btnLabel }}</button> to format it using <code class="inline-code">fmt.wasm</code>.</p>
    <textarea rows="6" cols="80">{{ zigCode }}</textarea>
    <div class="logs-wrapper">
      <p v-for="statement in logs">{{ statement }}</p>
    </div>
  </div>
</template>
