import {StandardGameInput} from "./input/types.js";
import {DirectionsState, PlayerState, Vector2DType} from "./types/types.js";

export class Player {
    static getPlayerState = (gameInput: StandardGameInput, currentState: PlayerState): PlayerState => {

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
        }
    }

  static updatePlayerPosition = (position: Vector2DType, direction: DirectionsState): Vector2DType => {
        const speed = 10;
        const x = position.x + direction.horizontal * speed;
        const y = position.y + direction.vertical * speed;

        return {x, y};
    }
}