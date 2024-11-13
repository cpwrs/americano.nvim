local config = require('americano.config')
local americano = {}

-- Color palette
local colors = {
  black = "#1c1714",
  dark = "#12100e",

  white = "#f7f7f7",
  bright = "#ffffff",
  offwhite = "#adabab",

  -- Lightest (grey1) -> darkest (grey5)
  grey1 = "#625f5f",
  grey2 = "#544f4d",
  grey3 = "#45403d",
  grey4 = "#3b3531",
  grey5 = "#322c27",
  grey6 = "#25201b",

  orange = "#ffb699",
  cream = "#fdffd1",
  red = "#ff5766",
  melon = "#ff909d",
  green = "#89ffcb",
  tea = "#d3ffdb",
  pink = "#ffb1f5",
  purple = "#d19cff",
  blue = "#aec1ff",
  turq = "#c9fafa",
}


-- Apply terminal highlighting
local function set_terminal_colors()
  vim.g.terminal_color_foreground = colors.white
  vim.g.terminal_color_background = colors.black
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_1 = colors.melon
  vim.g.terminal_color_2 = colors.tea
  vim.g.terminal_color_3 = colors.cream
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_6 = colors.turq
  vim.g.terminal_color_7 = colors.white
  vim.g.terminal_color_8 = colors.dark
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_11 = colors.orange
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_13 = colors.pink
  vim.g.terminal_color_14 = colors.turq
  vim.g.terminal_color_15 = colors.bright
end

-- Apply group highlights
local function set_groups()
  local groups = {
    -- Syntax
    Comment         = { fg = colors.grey1, italic = true },
    Constant        = { fg = colors.orange },
    String          = { fg = colors.tea },
    Character       = { fg = colors.tea },
    Number          = { fg = colors.melon },
    Boolean         = { fg = colors.purple },
    Float           = { fg = colors.melon },
    Identifier      = { fg = colors.cream },
    Function        = { fg = colors.blue },
    Conditional     = { fg = colors.pink },
    Statement       = { fg = colors.pink },
    Repeat          = { fg = colors.turq },
    Label           = { fg = colors.purple },
    Operator        = { fg = colors.green },
    Keyword         = { fg = colors.turq },
    Exception       = { fg = colors.red },
    PreProc         = { fg = colors.purple },
    PreCondit       = { fg = colors.purple },
    Include         = { fg = colors.green },
    Define          = { fg = colors.green },
    Type            = { fg = colors.cream },
    StorageClass    = { fg = colors.white },
    Structure       = { fg = colors.white },
    Typedef         = { fg = colors.white },
    Special         = { fg = colors.pink },
    Delimiter       = { fg = colors.offwhite },
    Underlined      = { fg = colors.white },
    Bold            = { bold = true },
    Italic          = { italic = true },
    Error           = { fg = colors.red },

    -- Editor
    LineNr          = { fg = colors.grey1 },
    CursorLineNr    = { fg = colors.bright },
    CursorLine      = { bg = colors.grey6 },
    Cursor          = { bg = colors.white, fg = colors.black },
    lCursor         = { link = "Cursor" },
    CursorIM        = { link = "Cursor" },
    Directory       = { fg = colors.white },
    DiffAdd         = { bg = colors.green, fg = colors.white },
    DiffChange      = { bg = colors.blue, fg = colors.white },
    DiffDelete      = { bg = colors.red, fg = colors.white },
    EndOfBuffer     = { fg = colors.grey1, bg = colors.black },
    ErrorMsg        = { fg = colors.red },
    WinSeparator    = { fg = colors.grey3, bg = colors.black },
    VertSplit       = { link = "WinSeperator" },
    MatchParen      = { fg = colors.white, bg = colors.grey1 },
    Normal          = { fg = colors.white, bg = colors.black },
    NormalFloat     = { fg = colors.white, bg = colors.grey4 },
    NvimFloat       = { link = "NormalFloat" },
    FloatBorder     = { fg = colors.grey4, bg = colors.grey4 },
    FloatTitle      = { fg = colors.green, bold = true },
    FloatFooter     = { link = "NormalFloat" },
    MsgArea         = { link = "Normal" },
    NormalNC        = { link = "Normal" },
    Pmenu           = { fg = colors.white, bg = colors.grey5 },
    PmenuSel        = { fg = colors.bright, bg = colors.grey3 },
    PmenuSbar       = { fg = colors.grey3, bg = colors.grey5 },
    PmenuThumb      = { bg = colors.cream},
    Visual          = { bg = colors.grey5 },
    VisualNOS       = { link = "Visual" },
    TabLine         = { fg = colors.grey1, bg = colors.grey6 },
    TabLineSel      = { fg = colors.bright, bg = colors.black },
    TabLineFill     = { fg = colors.grey1, bg = colors.grey6 },
    IncSearch       = { fg = colors.cream, bg = colors.grey1 },
    CurSearch       = { fg = colors.cream, bg = colors.grey1 },
    Search          = { fg = colors.cream, bg = colors.grey5 },

    -- Diagnostics
    DiagnosticError = { fg = colors.red, bg = "none" },
    DiagnosticWarn  = { fg = colors.orange, bg = "none" },
    DiagnosticInfo  = { fg = colors.blue, bg = "none" },
    DiagnosticHint  = { fg = colors.green, bg = "none" },
    DiagnosticUnnecessary = {},
    DiagnosticUnderlineError = { underline = true, sp = colors.red },
    DiagnosticUnderlineWarn = { underline = true,  sp = colors.orange },
    DiagnosticUnderlineInfo = { underline = true, sp = colors.blue },
    DiagnosticUnderlineHint = { underline = true, sp = colors.green },

    -- For my custom status line
    StatusError = { fg = colors.red, bg = colors.dark },
    StatusWarn  = { fg = colors.orange, bg = colors.dark },
    StatusInfo  = { fg = colors.blue, bg = colors.dark },
    StatusHint  = { fg = colors.green, bg = colors.dark },
    StatusLine      = { fg = colors.white, bg = colors.dark },
    StatusOther     = { fg = colors.grey2, bg = colors.dark },
    StatusImportant = { fg = colors.bright, bg = colors.dark, bold = true },

    -- Telescope
    TelescopeTitle  = { fg = colors.green, bg = colors.grey5, bold = true },
    TelescopeBorder = { fg = colors.grey5, bg = colors.grey5 },
    TelescopeNormal = { fg = colors.white, bg = colors.grey5 },
  }

  groups = vim.tbl_extend('force', groups, type(config.overrides) == 'function' and config.overrides() or config.overrides)

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

-- Apply user settings
---@param values table
function americano.setup(values)
  setmetatable(config, { __index = vim.tbl_extend('force', config.defautls, values) })
end

-- Set the colorscheme
function americano.colorscheme()
  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'americano'

  if config.terminal then
    set_terminal_colors()
  end
  set_groups()
end

return americano
