# americano.nvim :coffee:

Dark colorscheme for neovim. A smooth blend of neon nostalgia with a splash of warmth.

![image](https://github.com/user-attachments/assets/c939f718-e683-4872-81a8-ebb2ee7f1042)

## Usage

Download americano with any package manager on neovim latest.
Add `colorscheme americano` (vimscript) or `require('americano').colorscheme()` (lua) to apply the colorscheme.

## Configuration

Call `require('americano').setup()` to change any of the options from the default.

```lua
-- Defaults
require('americano').setup({
    terminal = true, -- Set terminal colors
    commentStyle = { italic = true },
    overrides = {}, -- Override highlight groups
    soft = false, -- Use softer background colors
    dull = false, -- Use duller foreground colors (low contrast)
})
```

The color palette function is exposed to use the palette table in your config:
```lua
---@param soft boolean? Whether to use soft background colors
---@param dull boolean? Whether to use dull foreground colors
---@return table 
local function getColors(soft, dull)
```

## Contributing

Americano is minimal and unlikely to add many colors, but I want to support more plugins, highlight groups, and configurations! 
Open a PR and include a screenshot showing the change for review. 
