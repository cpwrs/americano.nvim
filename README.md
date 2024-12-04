# americano.nvim

Dark colorscheme for neovim. A smooth blend of neon nostalgia with a spalsh of warmth.

## Usage

Download americano with any neovim package manager.
Add `colorscheme americano` (vimscript) or `require('americano').colorscheme()` (lua) to apply the colorscheme.

## Configuration

Call `require('americano').setup()` to change any of the options from the default.

```lua
-- Defaults
require('americano').setup({
    terminal = true, -- Set terminal colors
    overrides = {}, -- Override americano highlight groups
})
```

`require('americano.colors')` returns a table of americano color hex values to use in your configuration.

## Contributing

Americano is minimal and unlikely to add many colors, but I wants to support more plugins and groups! 
Open a PR and include a screenshot showing the change for review. 
