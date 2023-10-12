const canvas2d = @import("wasm-api-canvas");
const wasm = @import("wasm-api");
const dom = @import("wasm-api-dom");

// expose thi.ng/wasm-api core API (incl. panic handler & allocation fns)
pub usingnamespace wasm;

fn initApp() !void {
    // UnoCSS classes
    // https://unocss.dev/interactive/
    const div = dom.createElement(&.{
        .tag = "div",
        .class = "imposter",
        .id = "canvas-container",
        .parent = dom.body,
    });

    var window: dom.WindowInfo = undefined;
    dom.getWindowInfo(&window);

    const canvas = dom.createCanvas(&.{
        .width = 640,
        .height = 480,
        // .parent = dom.getElementByID("canvas-container"),
        .parent = div,
        // .parent = dom.body,
        // can be customized for HDPI screens (aka window.devicePixelRatio)
        // .dpr = 1,
        .dpr = window.dpr,
        .index = 0,
    });

    canvas2d.beginCtx(canvas);

    canvas2d.setFill("#f0f");

    // draw a triangle
    canvas2d.beginPath();
    canvas2d.moveTo(250, 50);
    canvas2d.lineTo(150, 250);
    canvas2d.lineTo(50, 100);
    canvas2d.fill();

    // (could also be shortened via this helper:)
    // canvas2d.polyline(&.{ .{ 250, 50 }, .{ 150, 250 }, .{ 50, 100 } }, true);

    const gradient1 = canvas2d.createLinearGradient(0, 0, 0, 100, &.{
        .{ .pos = 0.0, .color = "#ff0" },
        // .{ .pos = 0.0, .color = "rgb(255, 255, 0)" },
        .{ .pos = 1.0, .color = "#0ff" },
        // .{ .pos = 0.0, .color = "rgb(0, 255, 255)" },
    });
    canvas2d.setGradientFill(gradient1);

    // configure & draw text
    canvas2d.setFont("100px Menlo");
    canvas2d.setTextBaseline(.top);
    canvas2d.fillText("Ciao", 10, 10, 0);

    // https://www.gradientmagic.com/collection/standard
    const gradient2 = canvas2d.createLinearGradient(0, 120, 0, 220, &.{
        .{ .pos = 0.0, .color = "rgb(249, 66, 6)" },
        .{ .pos = 0.5, .color = "rgb(250, 134, 22)" },
        .{ .pos = 1.0, .color = "rgb(251, 202, 37)" },
    });
    canvas2d.setGradientFill(gradient2);

    // create a bitmap pattern (ABGR pixel format)
    // const pixels = [4]u32{ 0xff000000, 0, 0, 0xff000000 };
    // const pattern = canvas2d.createPattern(&pixels, 2, 2, .repeat);
    // use pattern as fill color
    // canvas2d.setPatternFill(pattern);
    canvas2d.fillText("Bologna JS", 10, 120, 0);
}

export fn start() void {
    wasm.printStr("started canvas-wasm");
    initApp() catch |e| @panic(@errorName(e));
}
