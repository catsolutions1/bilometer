export class Player {
}
Player.getPlayerState = (gameInput, currentState) => {
    return {
        position: Player.updatePlayerPosition(currentState.position, currentState.direction),
        direction: {
            horizontal: gameInput.axis.discrete.x,
            vertical: gameInput.axis.discrete.y
        },
        top: gameInput.actions.north === "pressed",
        bottom: gameInput.actions.south === "pressed",
        right: gameInput.actions.east === "pressed",
        left: gameInput.actions.west === "pressed",
    };
};
Player.updatePlayerPosition = (position, direction) => {
    const speed = 10;
    const x = position.x + direction.horizontal * speed;
    const y = position.y + direction.vertical * speed;
    return { x, y };
};
