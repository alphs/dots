-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

--{{ Misc
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false 
--}} Misc

--{{ Looks

-- 'Catppuccin [ Frappe, Latte, Macchiato, Mocha ]'
-- 'Catppuccin [ Frappé, Latte, Macchiato, Mocha ] (Gough)'
config.color_scheme = 'Catppuccin Macchiato'-- (Gogh)'

config.font_locator = 'ConfigDirsOnly'
config.font_dirs = { '~/git/nonicons' }
config.font = wezterm.font_with_fallback {
  'JetBrains Mono', -- included by default
  'nonicons',
}

-- default is true, has more "native" look; very round and strange
config.use_fancy_tab_bar =  false

config.enable_scroll_bar = false
config.tab_bar_at_bottom = false

-- background
-- config.window_background_opacity = 1.0
-- config.text_background_opacity = 0.3
-- config.gradient

--[[
config.window_background_image = '/path/to/wallpaper.jpg'

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.3,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}
--]]

--}} Looks

return config

