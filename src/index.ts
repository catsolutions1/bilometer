import GameRuntime from "./GameRuntime.js";

const canvas: HTMLCanvasElement  = document.getElementById("gameCanvas") as HTMLCanvasElement;
const context = canvas.getContext("2d");
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

window.onload = function() {
    if (context) {
        GameRuntime.setup(canvas, context);
        const loopTimeout = 1000 / 60;
        setInterval(GameRuntime.loop, loopTimeout, context, canvas.width, canvas.height);
    }
}