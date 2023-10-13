---
# https://sli.dev/custom/#frontmatter-configures
# Try CSS classes here:
# https://unocss.dev/interactive/
# class: 'text-center'
css: unocss
defaults:
  layout: center
download: 'https://raw.githubusercontent.com/jackdbd/zig-bolognajs/main/assets/zig-bolognajs.pdf'
# persist drawings in exports and build
drawings:
  persist: false
# Exporting to PDF or PNG requires Playwright for rendering.
# You will therefore need to install playwright-chromium
# https://sli.dev/guide/exporting.html
exportFilename: 'zig-bolognajs'
highlighter: shiki
htmlAttrs:
  dir: 'ltr'
  lang: 'en'
info: |
  ## Zig bolognajs

  Presentation on Zig I gave at [Bologna JS](https://www.bolognajs.com/).

  Learn more about Zig at [ziglang.org](https://ziglang.org/).
# show line numbers in code blocks
lineNumbers: true
# https://sli.dev/guide/presenter-mode.html
presenter: true
src: ./slides/intro.md
theme: default
transition: slide-left
---

---
src: ./slides/speaker.md
---

---
src: ./slides/why-zig-and-not-x.md
---

---
src: ./slides/meme-vince.md
---

---
src: ./slides/learn-zig-to-learn-how-computers-work.md
---

---
src: ./slides/what-zig-leaves-out.md
---

---
src: ./slides/neither-gc-nor-arc.md
---

---
src: ./slides/memory-allocation.md
---

---
src: ./slides/memory-allocators.md
---

---
src: ./slides/no-string-type.md
---

---
src: ./slides/no-operator-overloading.md
---

---
src: ./slides/no-exceptions.md
---

---
src: ./slides/error-handling-intro.md
---

---
src: ./slides/error-definition-js-vs-zig.md
---

---
src: ./slides/error-handling-js-vs-zig.md
---

---
src: ./slides/error-handling-try-catch-panic.md
---

---
src: ./slides/error-handling-tips.md
---

---
src: ./slides/lets-use-zig-in-frontend-js.md
---

---
src: ./slides/webassembly.md
---

---
src: ./slides/webassembly-demo.md
---

---
src: ./slides/checkerboard.md
---

---
src: ./slides/checkerboard-implementation.md
---

---
src: ./slides/checkerboard-wasm.md
---

---
src: ./slides/wasm-api.md
---

---
src: ./slides/wasm-api-implementation.md
---

---
src: ./slides/lets-use-zig-in-nodejs.md
---

---
src: ./slides/calling-zig-from-nodejs.md
---

---
src: ./slides/translate-c-1.md
---

---
src: ./slides/translate-c-2.md
---

---
src: ./slides/create-a-zig-wrapper-of-a-c-library.md
---

---
src: ./slides/nodejs-addon-with-node-api-1.md
---

---
src: ./slides/nodejs-addon-with-node-api-2.md
---

---
src: ./slides/compilation-targets.md
---

---
src: ./slides/build-modes.md
---

---
src: ./slides/lets-use-zig-in-nodejs-with-wasi.md
---

---
src: ./slides/wasi-js.md
---

---
src: ./slides/wasi-zig.md
---

---
src: ./slides/lets-use-zig-in-other-runtimes.md
---

---
src: ./slides/wasi-on-other-runtimes.md
---

---
src: ./slides/how-to-learn-zig.md
---
