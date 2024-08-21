local wezterm = require("wezterm")
local config = wezterm.config_builder()
local keys = require("keybinds")

config.enable_tab_bar = false
config.window_background_opacity = 0.95
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
config.cursor_blink_rate = 500
-- config.cursor_blink_rate = 460
-- config.cursor_blink_rate = 100
config.visual_bell = {
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 100,
}
config.keys = keys

return config
