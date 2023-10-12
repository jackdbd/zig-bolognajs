import path from "node:path";
import { readFile } from "node:fs/promises";
import { fileURLToPath } from "node:url";
import { WASI } from "node:wasi";

const __filename = fileURLToPath(import.meta.url);
const repo_root = path.join(__filename, "..", "..");
const assets = path.join(repo_root, "assets");

// argv[0] is the node binary
// argv[1] is the fullpath to this script
// argv[2] is the first parameter to pass to the WASI program
const args = process.argv.slice(1);

const wasi = new WASI({
  version: "preview1",
  args,
  env: process.env,
  preopens: {
    "/docs": "/home/jack/repos/zig-bolognajs/assets",
    "/generated": "/home/jack/repos/zig-bolognajs/dist",
  },
});

const wasm = await WebAssembly.compile(
  await readFile(
    new URL(path.join(repo_root, "wasi-example", "main.wasm"), import.meta.url)
  )
);
const instance = await WebAssembly.instantiate(wasm, wasi.getImportObject());

wasi.start(instance);
