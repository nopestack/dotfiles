local wezterm = require 'wezterm'
local act = wezterm.action

local function macCMDtoControl()
    local keys = "abdefghijklmnopqrstuwxyz" -- no c,v
    local keymappings = {}

    for i = 1, #keys do
        local c = keys:sub(i, i)
        table.insert(keymappings, {
            key = c,
            mods = "CMD|CTRL",
            action = act.SendKey({
                key = c,
                mods = "CTRL",
            }),
        })

        -- table.insert(keymappings, {
        --     key = c,
        --     mods = "CMD|CTRL",
        --     action = act.SendKey({
        --         key = c,
        --         mods = "META|CTRL",
        --     }),
        -- })
    end
    return keymappings
end

return {
    automatically_reload_config = true,
    font = wezterm.font 'JetBrains Mono',
    enable_tab_bar = false,
    disable_default_mouse_bindings = true,
    window_decorations = "RESIZE",
    font_size = 15.0,
    default_cursor_style = 'BlinkingBlock',
    animation_fps = 1,
    cursor_blink_ease_in = 'Constant',
    cursor_blink_ease_out = 'Constant',
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    use_dead_keys = false,
    keys = macCMDtoControl(),
}
