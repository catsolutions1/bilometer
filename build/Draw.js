import { playerColor, playerSize } from "./GameConstants.js";
export class Draw {
}
Draw.drawPlayer = (context, playerState) => {
    Draw.drawSquare(context, playerState.position, playerSize, playerColor);
    const miniSquareSize = 15;
    if (playerState.top) {
        Draw.drawSquare(context, { x: playerState.position.x, y: playerState.position.y - playerSize / 2 }, miniSquareSize, "yellow");
    }
    if (playerState.right) {
        Draw.drawSquare(context, { x: playerState.position.x + playerSize / 2, y: playerState.position.y }, miniSquareSize, "red");
    }
    if (playerState.bottom) {
        Draw.drawSquare(context, { x: playerState.position.x, y: playerState.position.y + playerSize / 2 }, miniSquareSize, "green");
    }
    if (playerState.left) {
        Draw.drawSquare(context, { x: playerState.position.x - playerSize / 2, y: playerState.position.y }, miniSquareSize, "blue");
    }
};
Draw.drawSquare = (context, pos, size, color) => {
    context.beginPath();
    context.strokeStyle = color;
    context.fillStyle = color;
    context.rect(pos.x - size / 2, pos.y - size / 2, size, size);
    context.stroke();
    context.fill();
};
Draw.resetCanvas = (context, canvasWidth, canvasHeight) => {
    context.font = "10px arial";
    context.fillStyle = "black";
    context.strokeStyle = "black";
    context.clearRect(0, 0, canvasWidth, canvasHeight);
};
