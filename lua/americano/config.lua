local config = {
  defaults = {
    terminal = true,
    commentStyle = { italic = true },
    overrides = {},
    soft = false,
  },
}

setmetatable(config, { __index = config.defaults })

return config
