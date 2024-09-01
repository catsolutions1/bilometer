export type SupportedKeys = "w" | "a" | "s" | "d" | "ArrowUp" | "ArrowDown" | "ArrowRight" | "ArrowLeft";

export type GameKeyboardMapping = {
    direction: {
        up: SupportedKeys[],
        down: SupportedKeys[],
        left: SupportedKeys[],
        right: SupportedKeys[]
    },
    buttons: {
        north: SupportedKeys[],
        south: SupportedKeys[],
        east: SupportedKeys[],
        west: SupportedKeys[],
    };
};

export type PlayerInput = {
    keyboardMapping: GameKeyboardMapping;
};

export type PlayerInputs = {
    player1: PlayerInput;
};

export type ButtonState = "pressed" | "not-pressed";

export type KeyboardState =  Record<SupportedKeys, ButtonState>;

export type InputState = {
    keyboard: KeyboardState;
};

export type DirectionState = -1 | 0 | 1;

export type StandardGameInput = {
    axis: {
        discrete: {
        x: DirectionState,
        y: DirectionState
        }
    },
    actions: {
        north: ButtonState,
        south: ButtonState,
        east: ButtonState,
        west: ButtonState
    };
};

export type StandardGameInputFourPlayer = {
    player1: StandardGameInput;
};
