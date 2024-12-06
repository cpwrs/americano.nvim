local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.colors = {
  foreground = '#f7f7f7',
  background = '#1c1714',

  cursor_bg = '#f7f7f7',
  cursor_fg = '#1c1714',
  cursor_border = "#f7f7f7",

  selection_fg = '#f7f7f7',
  selection_bg = '#3b3531',

  ansi = {
    '1c1714',
    '#ff909d',
    '#d3ffdb',
    '#fdffd1',
    '#aec1ff',
    '#d19cff',
    '#c9fafa',
    '#f7f7f7',
  },

  brights = {
    "#12100e",
    "#ff5766",
    "#89ffcb",
    "#ffb699",
    "#aec1ff",
    "#ffb1f5",
    "#c9fafa",
    "#ffffff",
  },
}
