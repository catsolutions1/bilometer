import {ButtonState, GameKeyboardMapping, KeyboardState, StandardGameInput, SupportedKeys} from "./types.js";

export class KeyboardTransformer {
    private static getButtonState = (keys: SupportedKeys[], keyboard: KeyboardState): ButtonState => {
        const keyStates: ButtonState[] = keys.map(key => {
        const keyState = keyboard[key]  
            return keyState;
        })

        return keyStates.find(key => key === "pressed") ? "pressed" : "not-pressed";
    }

    private static resolveAxisState = (negativeDirection: ButtonState, positiveDirection: ButtonState): 0 | -1 | 1 => {
        if (negativeDirection === "pressed" && positiveDirection === "not-pressed") {
            return -1;
        } else if (positiveDirection ==="pressed" && negativeDirection === "not-pressed") {
            return 1;
        } else {
            return 0;
        }
    }

    static transform = (keyboard: KeyboardState, playerKeyMappings: GameKeyboardMapping): StandardGameInput => {
        const upActive = KeyboardTransformer.getButtonState(playerKeyMappings.direction.up, keyboard);
        const downActive = KeyboardTransformer.getButtonState(playerKeyMappings.direction.down, keyboard);
        const leftActive = KeyboardTransformer.getButtonState(playerKeyMappings.direction.left, keyboard);
        const rightActive = KeyboardTransformer.getButtonState(playerKeyMappings.direction.right, keyboard);
        const northActive = KeyboardTransformer.getButtonState(playerKeyMappings.buttons.north, keyboard);
        const southActive = KeyboardTransformer.getButtonState(playerKeyMappings.buttons.south, keyboard);
        const eastActive = KeyboardTransformer.getButtonState(playerKeyMappings.buttons.east, keyboard);
        const westActive = KeyboardTransformer.getButtonState(playerKeyMappings.buttons.west, keyboard);

        const x = KeyboardTransformer.resolveAxisState(leftActive, rightActive);
        const y = KeyboardTransformer.resolveAxisState(upActive, downActive);

        return {
            axis: {
                discrete: {
                x: x,
                y: y
                }
            },
            actions: {
                north: northActive,
                south: southActive,
                east: eastActive,
                west: westActive
            }
        };
    }
}
