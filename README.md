# americano.nvim :coffee:

Dark colorscheme for neovim. A smooth blend of neon nostalgia with a splash of warmth.

![americano](https://github.com/user-attachments/assets/8b86500f-281f-43ee-ae09-318e4f56fa12)

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
    palette_config = {
        soft = false, -- Use softer background colors
        dull = false, -- Use duller foreground colors (low contrast)
    },
})
```

To grab a table of americano colors for other customizations, pass a palette_config to getPalette:
```lua
require('americano').getPalette({soft = false, dull = false})
```

## Contributing

I want to support more plugins, highlight groups, and configurations! 
Open a PR and include a screenshot showing the change for review. 
