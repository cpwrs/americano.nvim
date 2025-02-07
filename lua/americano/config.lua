local config = {
  defaults = {
    terminal = true,
    commentStyle = { italic = true },
    overrides = {},
  },
}

setmetatable(config, { __index = config.defaults })

return config
