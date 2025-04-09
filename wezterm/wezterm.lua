local wezterm = require 'wezterm'
local act = wezterm.action

--local BG = "#000000"
local themes = {
    light = '3024 (light) (terminal.sexy)',
    dark = '3024 (dark) (terminal.sexy)'
}


local config = wezterm.config_builder()

--[[config.color_scheme = themes.dark
config.window_frame = {
    font_size = 8.0,
    active_titlebar_bg = BG,
    inactive_titlebar_bg = BG,
}--]]
--[[ config.colors = {
background = BG,
} --]]

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 14

wezterm.on('switch-theme', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if (overrides.color_scheme == themes.light)
    then
        overrides.color_scheme = themes.dark
    else
        overrides.color_scheme = themes.light
    end
    window:set_config_overrides(overrides)
end)

config.keys = {
    { key = 't',          mods = 'ALT',   action = act.EmitEvent('switch-theme') },
    { key = 'RightArrow', mods = 'ALT',   action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'DownArrow',  mods = 'ALT',   action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'LeftArrow',  mods = 'SHIFT', action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'SHIFT', action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow',    mods = 'SHIFT', action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow',  mods = 'SHIFT', action = act.ActivatePaneDirection 'Down' },
}

config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true

--[[
config.background = {
    {
      source = {
        File = "/home/smolik/Media/Wallpapers/jested.jpg",
      },
      width = "100%",  -- Adjust as needed
      height = "100%", -- Adjust as needed
      hsb = {
        brightness = 0.08,  -- Adjust this to make the background fade smoothly
        hue = 1.0, 
        saturation = 0.9,  -- Reduce saturation for a more subtle effect
      },
    },
  }
--]]

return config
