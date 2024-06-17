local wezterm = require("wezterm")
local config = wezterm.config_builder()
local keys = require("keybinds")

config.enable_tab_bar = false
config.window_background_opacity = 0.9
config.font = wezterm.font("Fira Code")
config.font_size = 15.0

config.color_scheme = "Default Dark (base16)"
-- config.color_scheme = "Kanagawa Dragon (Gogh)"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "kanagawabones"

config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.8,
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 10,
	-- top = 20, -- 20 for when decorations = "RESIZE"
	bottom = 0,
}

-- config.window_decorations = "RESIZE"

config.cursor_blink_ease_in = "EaseOut"
config.cursor_blink_rate = 460
config.keys = keys

return config
