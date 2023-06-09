---@meta

---@alias side
--- | 0 # "bottom",
--- | 1 # "top",
--- | 2 # "back",
--- | 3 # "front",
--- | 4 # "right",
--- | 5 # "left",

---@class sideslib
local sides = {
    [0] = "bottom",
    [1] = "top",
    [2] = "back",
    [3] = "front",
    [4] = "right",
    [5] = "left",
    [6] = "unknown",
    bottom = 0,
    top = 1,
    back = 2,
    front = 3,
    right = 4,
    left = 5,
    unknown = 6,
    down = 0,
    up = 1,
    north = 2,
    south = 3,
    west = 4,
    east = 5,
    negy = 0,
    posy = 1,
    negz = 2,
    posz = 3,
    negx = 4,
    posx = 5,
    forward = 3
}

return sides
