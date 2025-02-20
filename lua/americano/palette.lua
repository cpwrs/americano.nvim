-- Color palette
local colors = {
  default_bg = { -- Default background colors
    black = "#1c1714", 
    -- Lightest (grey1) -> darkest (grey6)
    grey1 = "#625f5f",
    grey2 = "#585151",
    grey3 = "#4d4544",
    grey4 = "#423937",
    grey5 = "#362d2b",
    grey6 = "#29221f",
  },

  soft_bg = {
    black = "#29221f",
    -- Lightest (grey1) -> darkest (grey6)
    grey1 = "#757373",
    grey2 = "#625f5f",
    grey3 = "#585151",
    grey4 = "#4d4544",
    grey5 = "#423937",
    grey6 = "#362d2b",
  },

  default_fg = {
    white = "#f7f7f7",
    bright = "#ffffff",
    offwhite = "#adabab",

    orange = "#ffb699",
    cream = "#fbf1c7",
    red = "#ff5766",
    melon = "#ff909d",
    green = "#89ffcb",
    tea = "#d3ffdb",
    pink = "#ffb1f5",
    purple = "#d19cff",
    blue = "#aec1ff",
    turq = "#c9fafa",
  },

  dull_fg = {
    white = "#f7f7f7",
    bright = "#ffffff",
    offwhite = "#adabab",

    orange = "#fbd7c8",
    cream = "#f9f4df",
    red = "#fba7af",
    melon = "#fbc4ca",
    green = "#c0fbe1",
    tea = "#e5fbe9",
    pink = "#fbd4f6",
    purple = "#e4cafb",
    blue = "#d3dcfb",
    turq = "#e0f9f9",
  },
}

local function palette(soft, dull)
  soft = soft or false
  dull = dull or false

  local final = {}

  local bg = soft and colors.soft_bg or colors.default_bg
  local fg = dull and colors.dull_fg or colors.default_fg
  
  return vim.tbl_extend("force", bg, fg)
end

return palette
