local wezterm = require("wezterm")

local M = {
    -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    {
        key = "m",
        mods = "CMD",
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = "q",
        mods = "CMD",
        action = wezterm.action.DisableDefaultAssignment,
    },

    {
        key = "w",
        mods = "CMD",
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = "k",
        mods = "CMD",
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = "f",
        mods = "CMD",
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = "a",
        mods = "CMD",
        action = wezterm.action.SendKey({
            key = "a",
            mods = "ALT",
        }),
    },
}

return M
