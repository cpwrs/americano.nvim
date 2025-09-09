# americano.nvim :coffee:

Dark colorscheme for neovim. A smooth blend of neon nostalgia with a splash of warmth.

## Installation

Download americano with any package manager on neovim latest.
To apply the colorscheme, execute:
```vimscript
colorscheme americano
```
```lua
require('americano').colorscheme()
```

## Configuration

Call `require('americano').setup()` to change any of the options from the default.

```lua
-- Defaults
require('americano').setup({
    terminal = true, -- Set terminal colors
    commentStyle = { italic = true }, -- Quickly change style of comment hl group
    overrides = {}, -- Override highlight groups
})
```

To grab a table of americano colors for other customizations:
```lua
require('americano').getPalette()
```

## Contributing

I want to support more plugins, highlight groups, and configurations! 
Open a PR and include a screenshot showing the change for review. 
