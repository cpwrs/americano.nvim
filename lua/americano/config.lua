local config = {
  defaults = {
    terminal = true,
    overrides = {},
  },
}

setmetatable(config, { __index = config.defaults })

return config
