# Zig Bologna JS

An introduction to the Zig programming language and toolchain.

I gave this talk at [Bologna JS](https://www.bolognajs.com/).

- 🌐 https://zig-bolognajs.vercel.app/
- 📺 todo
- 🗎 https://raw.githubusercontent.com/jackdbd/zig-bolognajs/main/assets/zig-bolognajs.pdf

## Installation

This presentation is a Vue.js application built with [Slidev](https://sli.dev/). You can install its dependencies with the following command:

```sh
npm install
```

## Development

Slidev can hot-code reload this presentation thanks to Vite. Zig [cannot yet do it](https://github.com/ziglang/zig/issues/68), but as a workaround we list all zig source files and use [entr](https://github.com/eradman/entr) to watch them for changes.

Launch the Vite dev server and re-compile all WebAssembly modules with this command:

```sh
npm run dev
```

You can view the presentation either in:

- Play mode: http://localhost:3030/1
- [Presenter](https://sli.dev/guide/presenter-mode.html) mode: http://localhost:3030/presenter/1

## Deploy

The presentation will be automatically deployed to Vercel on each `git push`.

## PDF export

Slidev allows [exporting the slides to a PDF](https://sli.dev/guide/exporting.html#pdf). This feature relies on [Playwright](https://playwright.dev/) and requires [playwright-chromium](https://www.npmjs.com/package/playwright-chromium) to be available. Since I did not want to install Playwright when building on Vercel (so deployments are faster), I declared `playwright-chromium` as a dev dependency and set `npm install --omit=dev` as the Vercel `installCommand` in `vercel.json`.

> :information_source: Since the zig compiler is not available on Vercel, and since I don't want to download it on each deployment, I rely on a pre-push git hook to build all WebAssembly modules locally. All files that end up in `public/` will be hosted as static files on Vercel. I'm not sure whether it is possible to push the `.wasm` modules to Vercel without tracking them in git. I tried to ignore them in the `.gitignore` and unignore them in the `.vercelignore`, but that didn't work.

Run this command to export the presentation to `assets/zig-bolognajs.pdf`.

```sh
npx slidev export --with-toc --output assets/zig-bolognajs
```

Run this command to export the presentation notes.

```sh
npx slidev export-notes --output assets/zig-bolognajs-notes
```
