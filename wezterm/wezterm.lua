local wezterm = require 'wezterm'
local act = wezterm.action

local BG = "#000"

local config = wezterm.config_builder()

config.color_scheme = 'Batman'
config.window_frame = {
  font_size = 8.0,
  active_titlebar_bg = BG,
  inactive_titlebar_bg = BG,
}
config.colors = {
  background = BG,
}
config.font = wezterm.font 'JetBrains Mono'

config.keys = {
  { key = 'f',          mods = 'ALT',   action = act.ToggleFullScreen                                 },
  { key = 'RightArrow', mods = 'ALT',   action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'DownArrow',  mods = 'ALT',   action = act.SplitVertical { domain = 'CurrentPaneDomain' }   },
  { key = 'LeftArrow',  mods = 'SHIFT', action = act.ActivatePaneDirection 'Left'                     },
  { key = 'RightArrow', mods = 'SHIFT', action = act.ActivatePaneDirection 'Right'                    },
  { key = 'UpArrow',    mods = 'SHIFT', action = act.ActivatePaneDirection 'Up'                       },
  { key = 'DownArrow',  mods = 'SHIFT', action = act.ActivatePaneDirection 'Down'                     },
}

config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true

return config
