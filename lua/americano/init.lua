local config = require('americano.config')
local colors = require('americano.colors')
local americano = {}


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
    Normal          = { fg = colors.white, bg = colors.black },
    NormalFloat     = { fg = colors.white, bg = colors.grey4 },
    FloatBorder     = { fg = colors.grey4, bg = colors.grey4 },
    FloatTitle      = { fg = colors.green, bold = true },
    Cursor          = { bg = colors.white, fg = colors.black },
    CursorColumn    = { bg = colors.grey6 },
    CursorLine      = { bg = colors.grey6 },
    CursorLineNr    = { fg = colors.bright },
    ColorColumn     = { link = "CursorLine" },
    LineNr          = { fg = colors.grey1 },

    Directory       = { fg = colors.bright },
    ErrorMsg        = { fg = colors.red },
    WarningMsg      = { fg = colors.orange },
    WinSeparator    = { fg = colors.grey3, bg = colors.black },
    VertSplit       = { link = "WinSeperator" },
    Folded          = { fg = colors.grey1 },
    FoldColumn      = { bg = colors.black },
    SignColumn      = { bg = colors.bg },

    MatchParen      = { fg = colors.bright, bg = colors.grey1 },
    ModeMsg         = { fg = colors.pink },
    MoreMsg         = { fg = colors.orange },
    NonText         = { fg = colors.grey1 },
    Pmenu           = { fg = colors.white, bg = colors.grey5 },
    PmenuSel        = { fg = colors.bright, bg = colors.grey3, bold = true },
    PmenuKind       = { fg = colors.grey1, bg = colors.grey5, italic = true },
    PmenuKindSel    = { fg = colors.orange, bg = colors.grey3, italic = true },
    PmenuSbar       = { fg = colors.tea, bg = colors.grey4 },
    PmenuThumb      = { bg = colors.cream },
    QuickFixLine    = { fg = colors.turq },
    Question        = { fg = colors.tea },
    IncSearch       = { fg = colors.bright, bg = colors.grey1 },
    CurSearch       = { fg = colors.bright, bg = colors.grey1 },
    Search          = { fg = colors.white, bg = colors.grey2 },
    SpellBad        = { sp = colors.red, undercurl = true },
    SpellCap        = { sp = colors.cream, undercurl = true },
    SpellLocal      = { sp = colors.tea, undercurl = true },
    SpellRare       = { sp = colors.turq, undercurl = true },
    StatusLine      = { fg = colors.white, bg = colors.dark },
    StatusLineNC    = { fg = colors.white, bg = colors.dark },
    TabLine         = { fg = colors.grey1, bg = colors.grey6 },
    TabLineSel      = { fg = colors.bright, bg = colors.black },
    TabLineFill     = { fg = colors.grey1, bg = colors.grey6 },
    Visual          = { bg = colors.grey5 },
    Conceal         = { fg = colors.offwhite }, 
    MsgArea         = { link = "Normal" },

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
    Ignore          = { fg = colors.white },
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

    Added           = { fg = colors.green },
    Removed         = { fg = colors.red },
    Changed         = { fg = colors.blue },
    DiffAdd         = { bg = colors.green, fg = colors.black },
    DiffChange      = { bg = colors.blue, fg = colors.black },
    DiffDelete      = { bg = colors.red, fg = colors.black },
    DiffText        = { bg = colors.grey2, fg = colors.white },

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

return americano
