export const KeyboardMappingNeutral = {
    direction: {
        up: ["w"],
        down: ["s"],
        right: ["d"],
        left: ["a"]
    },
    buttons: {
        north: ["ArrowUp"],
        south: ["ArrowDown"],
        east: ["ArrowRight"],
        west: ["ArrowLeft"]
    }
};
export const KeyboardStateNeutral = {
    w: "not-pressed",
    a: "not-pressed",
    s: "not-pressed",
    d: "not-pressed",
    ArrowUp: "not-pressed",
    ArrowDown: "not-pressed",
    ArrowRight: "not-pressed",
    ArrowLeft: "not-pressed"
};
export const StandardGameInputStateNeutral = {
    axis: {
        discrete: {
            x: 0,
            y: 0
        },
    },
    actions: {
        north: "not-pressed",
        south: "not-pressed",
        east: "not-pressed",
        west: "not-pressed"
    }
};
