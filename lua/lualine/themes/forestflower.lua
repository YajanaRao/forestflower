local util = require("forestflower.util")
local config = require("forestflower").config

local palette = util.generate_palette(config, vim.o.background)

if config.transparent_background_level == 2 then
  palette.surface = palette.none
end

-- Gentle brutalism: Enhanced segment backgrounds for visual depth
local segment_bg = util.darken(palette.surface_variant, 0.08)
local segment_border = palette.outline

return {
  normal = {
    a = { bg = palette.primary, fg = palette.background, gui = "bold" }, -- Bold mode indicator
    b = { bg = segment_bg, fg = palette.on_surface, gui = "bold" }, -- Offset segment background
    c = { bg = palette.surface, fg = palette.on_surface_variant },
  },
  insert = {
    a = { bg = palette.secondary, fg = palette.background, gui = "bold" },
    b = { bg = segment_bg, fg = palette.on_surface, gui = "bold" },
    c = { bg = palette.surface, fg = palette.on_surface },
  },
  visual = {
    a = { bg = palette.tertiary, fg = palette.background, gui = "bold" },
    b = { bg = segment_bg, fg = palette.on_surface, gui = "bold" },
    c = { bg = palette.surface, fg = palette.on_surface },
  },
  replace = {
    a = { bg = palette.warning, fg = palette.background, gui = "bold" },
    b = { bg = segment_bg, fg = palette.on_surface, gui = "bold" },
    c = { bg = palette.surface, fg = palette.on_surface },
  },
  command = {
    a = { bg = palette.secondary, fg = palette.background, gui = "bold" },
    b = { bg = segment_bg, fg = palette.on_surface, gui = "bold" },
    c = { bg = palette.surface, fg = palette.on_surface },
  },
  terminal = {
    a = { bg = palette.tertiary, fg = palette.background, gui = "bold" },
    b = { bg = segment_bg, fg = palette.on_surface, gui = "bold" },
    c = { bg = palette.surface, fg = palette.on_surface },
  },
  inactive = {
    a = { bg = palette.surface, fg = palette.on_surface_variant },
    b = { bg = palette.surface, fg = palette.on_surface_variant },
    c = { bg = palette.surface, fg = palette.on_surface_variant },
  },
}
