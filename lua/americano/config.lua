local config = {
  defaults = {
    terminal = true,
    commentStyle = { italic = true },
    overrides = {},
    palette_config = {
      soft = false,
      dull = false,
    },
  },
}

setmetatable(config, { __index = config.defaults })

return config
