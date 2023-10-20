# Zig talk @ Bologna JS

Slides and code for [my talk on Zig at Bologna JS](https://www.meetup.com/it-IT/bologna-js-meetup/events/296655951/).

I gave a [similar presentation at pisa.dev](https://github.com/jackdbd/zig-tour). That presentation was more focused on the Zig C-interop, this presentation focuses on how to use Zig in a JS project. Moe precisely, in this presentation I talked about:

1. Why Zig might be interesting for a JS developer. And why it could more interesting than other compiled languages (e.g. C, C++, Rust).
2. Features that Zig decides to leave out of the language, and why.
3. Building a project: JS vs Zig.
4. Error handling: JS vs Zig.
5. How to develop hybrid JS/Zig projects (for the browser, Node.js, and for other runtimes).
6. How to use Zig libraries, and the Zig package manager.

The presentation is available online: https://zig-bolognajs.vercel.app/

In alternative, you can download the slides as a PDF: https://raw.githubusercontent.com/jackdbd/zig-bolognajs/main/assets/zig-bolognajs.pdf

If you want to run the presentation locally or modify it, follow the instructions below.

## Installation

This presentation is a Vue.js application built with [Slidev](https://sli.dev/). You can install its dependencies with the following command:

```sh
npm install
```

## Development

Slidev can hot-code reload this presentation thanks to Vite. Zig [cannot yet do it](https://github.com/ziglang/zig/issues/68), but as a workaround we can list all zig source files and use [entr](https://github.com/eradman/entr) to watch them for changes.

Launch the Vite dev server and re-compile all WebAssembly modules with this command:

```sh
npm run dev
```

You can now view the presentation on localhost:

- Play mode: http://localhost:3030/1
- [Presenter](https://sli.dev/guide/presenter-mode.html) mode: http://localhost:3030/presenter/1

## Deploy

The presentation will be automatically deployed to Vercel on each `git push`.

> :information_source: Since the zig compiler is not available on Vercel, and since I don't want to download it on each deployment, I rely on a pre-push git hook to build all WebAssembly modules locally. All files that end up in `public/` will be hosted as static files on Vercel. I'm not sure whether it is possible to push the `.wasm` modules to Vercel without tracking them in git. I tried to ignore them in the `.gitignore` and unignore them in the `.vercelignore`, but that didn't work.

## PDF export

Slidev allows [exporting the slides to a PDF](https://sli.dev/guide/exporting.html#pdf). This feature relies on [Playwright](https://playwright.dev/) and requires [playwright-chromium](https://www.npmjs.com/package/playwright-chromium) to be available.

> :information_source: Since I don't want to install Playwright when building on Vercel (so deployments are faster), I declare `playwright-chromium` as a dev dependency and set `npm install --omit=dev` as the Vercel `installCommand` in `vercel.json`.

Run this command to export the presentation to `assets/zig-bolognajs.pdf` and the notes to `assets/zig-bolognajs-notes.pdf`.

```sh
npm run build:pdf
```
