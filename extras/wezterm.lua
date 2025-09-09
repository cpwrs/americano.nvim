local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.colors = {
  foreground = '#f7f7f7',
  background = '#0e0c0a',

  cursor_bg = '#fdffd1',
  cursor_fg = '#0e0c0a',
  cursor_border = "#fdffd1",

  selection_fg = '#191613',
  selection_bg = '#f7f7f7',

  ansi = {
    "#0e0c0a",
    "#ff909d",
    "#d3ffdb",
    "#fdffd1",
    "#aec1ff",
    "#ddb6ff",
    "#c9fafa",
    "#f7f7f7",
  },

  brights = {
    "#000000",
    "#ff6571",
    "#89ffcb",
    "#ffff99",
    "#7d9eff",
    "#aa93ff",
    "#95fbfb",
    "#ffffff",
  },
}
