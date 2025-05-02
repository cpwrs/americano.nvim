local config = require('americano.config')
local colors = require('americano.colors')
local americano = {}

-- Apply terminal highlighting
local function set_terminal_colors(palette)
  vim.g.terminal_color_foreground = palette.white
  vim.g.terminal_color_background = palette.black
  vim.g.terminal_color_0 = palette.black
  vim.g.terminal_color_1 = palette.melon
  vim.g.terminal_color_2 = palette.tea
  vim.g.terminal_color_3 = palette.cream
  vim.g.terminal_color_4 = palette.blue
  vim.g.terminal_color_5 = palette.purple
  vim.g.terminal_color_6 = palette.turq
  vim.g.terminal_color_7 = palette.white
  vim.g.terminal_color_8 = palette.black
  vim.g.terminal_color_9 = palette.red
  vim.g.terminal_color_10 = palette.green
  vim.g.terminal_color_11 = palette.orange
  vim.g.terminal_color_12 = palette.blue
  vim.g.terminal_color_13 = palette.pink
  vim.g.terminal_color_14 = palette.turq
  vim.g.terminal_color_15 = palette.bright
end

-- Apply group highlights
local function set_groups(palette)
  local groups = {
    Normal          = { fg = palette.white, bg = palette.black },
    NormalFloat     = { fg = palette.white, bg = palette.grey4 },
    FloatBorder     = { fg = palette.grey4, bg = palette.grey4 },
    FloatTitle      = { fg = palette.green, bold = true },
    Cursor          = { bg = palette.white, fg = palette.black },
    CursorColumn    = { bg = palette.grey6 },
    CursorLine      = { bg = palette.grey6 },
    CursorLineNr    = { fg = palette.bright },
    ColorColumn     = { link = "CursorLine" },
    LineNr          = { fg = palette.grey1 },

    Directory       = { fg = palette.bright },
    ErrorMsg        = { fg = palette.red },
    WarningMsg      = { fg = palette.orange },
    WinSeparator    = { fg = palette.grey3, bg = palette.black },
    VertSplit       = { link = "WinSeperator" },
    Folded          = { bg = palette.grey5 },
    FoldColumn      = { bg = palette.black },
    SignColumn      = { bg = palette.black },

    MatchParen      = { fg = palette.bright, bg = palette.grey1 },
    ModeMsg         = { fg = palette.pink },
    MoreMsg         = { fg = palette.orange },
    NonText         = { fg = palette.grey1 },
    Pmenu           = { fg = palette.white, bg = palette.grey5 },
    PmenuSel        = { fg = palette.bright, bg = palette.grey3, bold = true },
    PmenuKind       = { fg = palette.grey1, italic = true },
    PmenuKindSel    = { fg = palette.orange, bg = palette.grey3, italic = true },
    PmenuSbar       = { fg = palette.tea, bg = palette.grey4 },
    PmenuThumb      = { bg = palette.cream },
    QuickFixLine    = { fg = palette.turq },
    Question        = { fg = palette.tea },
    CurSearch       = { fg = palette.bright, bg = palette.grey1 },
    Search          = { fg = palette.white, bg = palette.grey4 },
    SpellBad        = { sp = palette.red, undercurl = true },
    SpellCap        = { sp = palette.cream, undercurl = true },
    SpellLocal      = { sp = palette.tea, undercurl = true },
    SpellRare       = { sp = palette.turq, undercurl = true },
    StatusLine      = { fg = palette.white, bg = palette.grey4 },
    StatusLineNC    = { fg = palette.white, bg = palette.grey4 },
    TabLine         = { fg = palette.grey1, bg = palette.grey5 },
    TabLineSel      = { fg = palette.bright, bg = palette.black },
    TabLineFill     = { fg = palette.grey1, bg = palette.grey5 },
    Visual          = { bg = palette.grey5 },
    Conceal         = { fg = palette.offwhite },
    MsgArea         = { link = "Normal" },

    -- Syntax
    Comment         = vim.tbl_extend("force", { fg = palette.grey1 }, config.commentStyle),
    Constant        = { fg = palette.orange },
    String          = { fg = palette.tea },
    Character       = { fg = palette.tea },
    Number          = { fg = palette.melon },
    Boolean         = { fg = palette.purple },
    Float           = { fg = palette.melon },
    Identifier      = { fg = palette.cream },
    Function        = { fg = palette.blue },
    Conditional     = { fg = palette.pink },
    Statement       = { fg = palette.pink },
    Repeat          = { fg = palette.turq },
    Label           = { fg = palette.purple },
    Operator        = { fg = palette.green },
    Keyword         = { fg = palette.turq },
    Exception       = { fg = palette.red },
    PreProc         = { fg = palette.purple },
    PreCondit       = { fg = palette.purple },
    Include         = { fg = palette.green },
    Ignore          = { fg = palette.white },
    Define          = { fg = palette.green },
    Type            = { fg = palette.cream },
    StorageClass    = { fg = palette.white },
    Structure       = { fg = palette.white },
    Typedef         = { fg = palette.white },
    Special         = { fg = palette.pink },
    Delimiter       = { fg = palette.offwhite },
    Underlined      = { fg = palette.white },
    Bold            = { bold = true },
    Italic          = { italic = true },
    Error           = { fg = palette.red },

    Added           = { fg = palette.green },
    Removed         = { fg = palette.red },
    Changed         = { fg = palette.blue },
    DiffAdd         = { bg = palette.green, fg = palette.black },
    DiffChange      = { bg = palette.blue, fg = palette.black },
    DiffDelete      = { bg = palette.red, fg = palette.black },
    DiffText        = { bg = palette.grey2, fg = palette.white },

    -- Diagnostics
    DiagnosticError = { fg = palette.red, bg = "none" },
    DiagnosticWarn  = { fg = palette.orange, bg = "none" },
    DiagnosticInfo  = { fg = palette.blue, bg = "none" },
    DiagnosticHint  = { fg = palette.green, bg = "none" },
    DiagnosticUnnecessary = {},
    DiagnosticUnderlineError = { underline = true, sp = palette.red },
    DiagnosticUnderlineWarn = { underline = true,  sp = palette.orange },
    DiagnosticUnderlineInfo = { underline = true, sp = palette.blue },
    DiagnosticUnderlineHint = { underline = true, sp = palette.green },

    -- Telescope
    TelescopeTitle  = { fg = palette.green, bg = palette.grey5, bold = true },
    TelescopeBorder = { fg = palette.grey5, bg = palette.grey5 },
    TelescopeNormal = { fg = palette.white, bg = palette.grey5 },
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

function americano.getPalette(palette_config)
  local soft = palette_config.soft or false
  local dull = palette_config.dull or false

  local bg_source = soft and colors.soft_bg or colors.default_bg
  local fg_source = dull and colors.dull_fg or colors.default_fg

  return vim.tbl_deep_extend("force",
    {
      white = colors.white,
      bright = colors.bright,
      offwhite = colors.offwhite,
    },
    bg_source,
    fg_source
  )
end

-- Set the colorscheme
function americano.colorscheme()
  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'americano'

  local p = americano.getPalette(config.palette_config)

  if config.terminal then
    set_terminal_colors(p)
  end
  set_groups(p)
end

return americano
