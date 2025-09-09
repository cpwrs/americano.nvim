local config = require('americano.config')
local palette = require('americano.palette')
local americano = {}

-- Apply terminal highlighting
local function set_terminal_colors()
  vim.g.terminal_color_foreground = palette.white
  vim.g.terminal_color_background = palette.black
  vim.g.terminal_color_0 = palette.black
  vim.g.terminal_color_1 = palette.red
  vim.g.terminal_color_2 = palette.green
  vim.g.terminal_color_3 = palette.yellow
  vim.g.terminal_color_4 = palette.blue
  vim.g.terminal_color_5 = palette.magenta
  vim.g.terminal_color_6 = palette.cyan
  vim.g.terminal_color_7 = palette.white
  vim.g.terminal_color_8 = palette.intense_black
  vim.g.terminal_color_9 = palette.intense_red
  vim.g.terminal_color_10 = palette.intense_green
  vim.g.terminal_color_11 = palette.intense_yellow
  vim.g.terminal_color_12 = palette.intense_blue
  vim.g.terminal_color_13 = palette.intense_magenta
  vim.g.terminal_color_14 = palette.intense_cyan
  vim.g.terminal_color_15 = palette.intense_white
end



-- Apply group highlights
local function set_groups()
  local groups = {
    Normal          = { fg = palette.white, bg = palette.black },
    NormalFloat     = { fg = palette.white, bg = palette.grey4 },
    FloatBorder     = { fg = palette.grey4, bg = palette.grey4 },
    FloatTitle      = { fg = palette.intense_green, bold = true },
    Cursor          = { bg = palette.white, fg = palette.black },
    CursorColumn    = { bg = palette.grey6 },
    CursorLine      = { bg = palette.grey6 },
    CursorLineNr    = { fg = palette.intense_white },
    ColorColumn     = { link = "CursorLine" },
    LineNr          = { fg = palette.grey1 },

    Directory       = { fg = palette.intense_white },
    ErrorMsg        = { fg = palette.intense_red },
    WarningMsg      = { fg = palette.orange },
    WinSeparator    = { fg = palette.grey3, bg = palette.black },
    VertSplit       = { link = "WinSeparator" },
    Folded          = { bg = palette.grey5 },
    FoldColumn      = { bg = palette.black },
    SignColumn      = { bg = palette.black },

    MatchParen      = { fg = palette.intense_white, bg = palette.grey1 },
    ModeMsg         = { fg = palette.pink },
    MoreMsg         = { fg = palette.orange },
    NonText         = { fg = palette.grey1 },
    Pmenu           = { fg = palette.white, bg = palette.grey5 },
    PmenuSel        = { fg = palette.intense_white, bg = palette.grey3, bold = true },
    PmenuKind       = { fg = palette.grey1, italic = true },
    PmenuKindSel    = { fg = palette.orange, bg = palette.grey3, italic = true },
    PmenuSbar       = { fg = palette.green, bg = palette.grey4 },
    PmenuThumb      = { bg = palette.yellow },
    QuickFixLine    = { fg = palette.cyan },
    Question        = { fg = palette.green },
    CurSearch       = { fg = palette.intense_white, bg = palette.grey1 },
    Search          = { fg = palette.white, bg = palette.grey4 },
    SpellBad        = { sp = palette.intense_red, undercurl = true },
    SpellCap        = { sp = palette.yellow, undercurl = true },
    SpellLocal      = { sp = palette.green, undercurl = true },
    SpellRare       = { sp = palette.cyan, undercurl = true },
    StatusLine      = { fg = palette.white, bg = palette.grey5 },
    StatusLineNC    = { fg = palette.white, bg = palette.grey6 },
    TabLine         = { fg = palette.grey1, bg = palette.grey5 },
    TabLineSel      = { fg = palette.intense_white, bg = palette.black },
    TabLineFill     = { fg = palette.grey1, bg = palette.grey5 },
    Visual          = { bg = palette.grey5 },
    Conceal         = { fg = palette.offwhite },
    MsgArea         = { link = "Normal" },

    -- Syntax
    Comment         = vim.tbl_extend("force", { fg = palette.grey1 }, config.commentStyle),
    Constant        = { fg = palette.orange },
    String          = { fg = palette.green },
    Character       = { fg = palette.green },
    Number          = { fg = palette.red },
    Boolean         = { fg = palette.magenta },
    Float           = { fg = palette.red },
    Identifier      = { fg = palette.yellow },
    Function        = { fg = palette.blue },
    Conditional     = { fg = palette.pink },
    Statement       = { fg = palette.pink },
    Repeat          = { fg = palette.cyan },
    Label           = { fg = palette.intense_magenta },
    Operator        = { fg = palette.intense_green },
    Keyword         = { fg = palette.cyan },
    Exception       = { fg = palette.intense_red },
    PreProc         = { fg = palette.intense_magenta },
    PreCondit       = { fg = palette.intense_magenta },
    Include         = { fg = palette.intense_green },
    Ignore          = { fg = palette.white },
    Define          = { fg = palette.intense_green },
    Type            = { fg = palette.yellow },
    StorageClass    = { fg = palette.intense_magenta },
    Structure       = { fg = palette.white },
    Typedef         = { fg = palette.white },
    Special         = { fg = palette.pink },
    Delimiter       = { fg = palette.offwhite },
    Underlined      = { fg = palette.white },
    Bold            = { bold = true },
    Italic          = { italic = true },
    Error           = { fg = palette.intense_red },

    Added           = { fg = palette.intense_green },
    Removed         = { fg = palette.intense_red },
    Changed         = { fg = palette.blue },
    DiffAdd         = { bg = palette.intense_green, fg = palette.black },
    DiffChange      = { bg = palette.blue, fg = palette.black },
    DiffDelete      = { bg = palette.intense_red, fg = palette.black },
    DiffText        = { bg = palette.grey2, fg = palette.white },

    -- Diagnostics
    DiagnosticError = { fg = palette.intense_red, bg = "none" },
    DiagnosticWarn  = { fg = palette.orange, bg = "none" },
    DiagnosticInfo  = { fg = palette.blue, bg = "none" },
    DiagnosticHint  = { fg = palette.intense_green, bg = "none" },
    DiagnosticUnnecessary = {},
    DiagnosticUnderlineError = { underline = true, sp = palette.intense_red },
    DiagnosticUnderlineWarn = { underline = true,  sp = palette.orange },
    DiagnosticUnderlineInfo = { underline = true, sp = palette.blue },
    DiagnosticUnderlineHint = { underline = true, sp = palette.intense_green },

    -- Telescope
    TelescopeTitle  = { fg = palette.white, bg = palette.black, bold = true },
    TelescopeBorder = { fg = palette.grey5, bg = palette.black },
    TelescopeNormal = { fg = palette.white, bg = palette.black },
  }

  groups = vim.tbl_extend('force', groups, type(config.overrides) == 'function' and config.overrides() or config.overrides)

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

-- Apply user settings
function americano.setup(values)
  setmetatable(config, { __index = vim.tbl_extend('force', config.defaults, values) })
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

function americano.getPalette()
  return palette
end

return americano
