local config = {
  defaults = {
    terminal = true,
    minimal = false,
    overrides = {},
  },
}

setmetatable(config, { __index = config.defaults })

return config
