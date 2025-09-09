local M = {}

---@class PaletteBackground
---@field bg_dim string
---@field bg0 string
---@field bg1 string
---@field bg2 string
---@field bg3 string
---@field bg4 string
---@field bg5 string
---@field bg_visual string
---@field bg_red string
---@field bg_green string
---@field bg_blue string
---@field bg_yellow string
---@field bg_purple string

---@class PaletteBase
---@field fg string
---@field red string
---@field orange string
---@field yellow string
---@field green string
---@field aqua string
---@field blue string
---@field purple string
---@field grey0 string
---@field grey1 string
---@field grey2 string
---@field statusline1 string
---@field statusline2 string
---@field statusline3 string
---@field none string

---@class Palette: PaletteBase,PaletteBackground

---@alias Backgrounds "light" | "dark"
---@alias PaletteBackgrounds table<Backgrounds, PaletteBackground>

---@type PaletteBackgrounds
local hard_background = {
  night = {
    bg_visual = "#45475a",
    bg_red = "#493b40",
    bg_green = "#3c4841",
    bg_blue = "#384b55",
    bg_yellow = "#45443c",
    bg_purple = "#463f48",
    bg_dim = "#000000",
    bg0 = "#0a0a0a",
    bg1 = "#111111",
    bg2 = "#151515",
    bg3 = "#1a1a1a",
    bg4 = "#1f1f1f",
    bg5 = "#242424",
  },
  day = {
    bg_dim = "#f2efdf",
    bg0 = "#fffbef",
    bg1 = "#f8f5e4",
    bg2 = "#f2efdf",
    bg3 = "#edeada",
    bg4 = "#e8e5d5",
    bg5 = "#bec5b2",
    bg_visual = "#dde5b6",
    bg_red = "#ffe7de",
    bg_green = "#f3f5d9",
    bg_blue = "#ecf5ed",
    bg_yellow = "#fef2d5",
    bg_purple = "#fceced",
  },
}

---@type table<Backgrounds, PaletteBase>
local base_palette = {
  day = {
    fg = "#5c6a72",
    red = "#f85552",
    orange = "#f57d26",
    yellow = "#dfa000",
    green = "#8da101",
    aqua = "#35a77c",
    blue = "#3a94c5",
    purple = "#df69ba",
    grey0 = "#a6b0a0",
    grey1 = "#939f91",
    grey2 = "#829181",
    statusline1 = "#93b259",
    statusline2 = "#708089",
    statusline3 = "#e66868",
    none = "NONE",
  },
  night = {
    -- Modern night palette (JOYFUL modern variant)
    fg = "#d6d6d6",
    red = "#e06464",      -- error / critical
    orange = "#d9894d",   -- numbers / attrs
    yellow = "#e1b86c",   -- constants / params
    green = "#65b585",    -- functions / additions
    aqua = "#5fc8ce",     -- types
    blue = "#6fa4f6",     -- keywords / control
    purple = "#c68ad5",   -- decorators / special
    grey0 = "#707070",
    grey1 = "#8a8a8a",
    grey2 = "#b2b2b2",
    statusline1 = "#65b585", -- ui accent 1
    statusline2 = "#6fa4f6", -- ui accent 2
    statusline3 = "#c68ad5", -- ui accent 3
    none = "NONE",
  },
}

---Generates the colour palette based on the user's config
---@param options Config The package configuration table
---@param theme "light" | "dark" The user's background preference
---@return Palette
M.generate_palette = function(options, theme)
  local flavour = options.flavour or "night"
  local base = base_palette[flavour]
  ---@type PaletteBackground
  local background_palette = hard_background[flavour]

  ---@type Palette
  local combined_palette = vim.tbl_extend("force", base, background_palette)
  options.colours_override(combined_palette)

  return combined_palette
end

-- Semantic mapping (Option B): map syntax roles to palette hue keys
-- This enables quick remapping without changing highlight definitions everywhere.
M.semantic = {
  keyword = "blue",
  type = "aqua",
  func = "aqua",   -- functions now aqua (was green)
  string = "green", -- strings green (classic)
  number = "orange",
  constant = "yellow",
  decorator = "purple",
  parameter = "yellow",
  operator = "orange",
  error = "red",
  warning = "yellow",
  info = "blue",
  hint = "purple",
}

return M
