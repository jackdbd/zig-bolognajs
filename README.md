# Zig Bologna JS

An introduction to the Zig programming language and toolchain.

I gave this talk at [Bologna JS](https://www.bolognajs.com/).

- 🌐 https://zig-bolognajs.vercel.app/
- 📺 todo
- 🗎 https://raw.githubusercontent.com/jackdbd/zig-bolognajs/main/assets/zig-bolognajs.pdf

## Installation

This presentation is a Vue.js application built with [Slidev](https://sli.dev/). You can install its dependencies with:

```sh
npm install
```

## Development

Slidev can hot-code reload this presentation thanks to Vite. Launch the Vite dev server with:

```sh
npm run dev
```

You can view the presentation either in:

- Play mode: http://localhost:3030/1
- [Presenter](https://sli.dev/guide/presenter-mode.html) mode: http://localhost:3030/presenter/1

## Deploy

The `dist` directory will be automatically deployed to Vercel on each `git push`.

## PDF export

Slidev allows [exporting the slides to a PDF](https://sli.dev/guide/exporting.html#pdf). This feature relies on [Playwright](https://playwright.dev/) and requires [playwright-chromium](https://www.npmjs.com/package/playwright-chromium) to be available. Since I did not want to install Playwright when building on Vercel (so deployments are faster), I declared `playwright-chromium` as a dev dependency and set `npm install --omit=dev` as the Vercel `installCommand` in `vercel.json`.

Run this command to export the presentation to `assets/zig-bolognajs.pdf`.

```sh
npx slidev export --with-toc --output assets/zig-bolognajs
```

Run this command to export the presentation notes.

```sh
npx slidev export-notes --output assets/zig-bolognajs-notes
```
