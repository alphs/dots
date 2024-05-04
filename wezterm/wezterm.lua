-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

-- {{ Misc
if is_darwin() == true then
	config.front_end = "Software"
	config.send_composed_key_when_left_alt_is_pressed = true
	config.send_composed_key_when_right_alt_is_pressed = false
else
	config.max_fps = 240
end

config.keys = {
	-- CTRL-SHIFT-l activates the debug overlay
	{ key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
}

config.hide_mouse_cursor_when_typing = true

config.audible_bell = "Disabled"
-- }} Misc

-- {{ Looks

-- 'Catppuccin [ Frappe, Latte, Macchiato, Mocha ]'
-- 'Catppuccin [ Frappé, Latte, Macchiato, Mocha ] (Gough)'
config.color_scheme = "Catppuccin Macchiato" -- (Gogh)'

config.font_locator = "ConfigDirsOnly"
config.font_dirs = { "../installs/fonts_icons/JetBrainsMonoNerdFont", "../installs/fonts_icons/nonicons/dist" }
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	-- "JetBrains Mono", -- included by default
	"nonicons",
})

-- default is true, has more "native" look; very round and strange
config.use_fancy_tab_bar = false
config.enable_scroll_bar = false
config.tab_bar_at_bottom = false

-- }} Looks

return config
