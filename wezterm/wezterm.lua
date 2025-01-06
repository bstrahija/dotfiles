local wezterm = require("wezterm")
local config = wezterm.config_builder()

--- Font settings
config.font_size = 14
config.line_height = 1.2
config.font = wezterm.font("DankMono Nerd Font")

--- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

--- Misc
config.prefer_egl = true

return config