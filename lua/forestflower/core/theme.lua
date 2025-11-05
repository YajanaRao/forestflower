---Theme builder for Forest Flower colorscheme
---Builds complete theme objects from color palettes and configuration

local colors = require("forestflower.core.colors")
local util = require("forestflower.util")

---@class ThemeConfig
---@field flavour "auto" | "day" | "night"
---@field background "soft" | "medium" | "hard"
---@field transparent_background_level 0 | 1 | 2
---@field italics boolean
---@field disable_italic_comments boolean
---@field sign_column_background "none" | "grey"
---@field diagnostic_text_highlight boolean
---@field diagnostic_virtual_text "coloured" | "grey"
---@field diagnostic_line_highlight boolean
---@field show_eob boolean
---@field float_style "bright" | "dim"
---@field on_highlights fun(highlight_groups: Highlights, palette: ColorPalette)
---@field colours_override fun(palette: ColorPalette)
---@field contrast_audit boolean

---@class ForestflowerTheme
---@field palette ColorPalette
---@field ui table
---@field syntax SyntaxTokens

local M = {}

---Build UI role mappings from palette
---@param palette ColorPalette
---@return table
local function build_ui_roles(palette)
  return {
    background = palette.background,
    surface = palette.surface,
    surface_variant = palette.surface_variant,
    border = palette.outline_variant,
    outline = palette.outline,
    primary = palette.primary,
    primary_container = palette.primary_container,
    success = palette.success,
    success_container = palette.success_container,
    info = palette.info,
    info_container = palette.info_container,
    warn = palette.warning,
    warn_container = palette.warning_container,
    error = palette.error,
    error_container = palette.error_container,
    hint = palette.hint,
    hint_container = palette.hint_container,
    git_add = palette.success,
    git_change = palette.warning,
    git_delete = palette.error,
    on_surface = palette.on_surface,
    on_surface_variant = palette.on_surface_variant,
    -- removed fg_faint; use outline_variant directly where needed
    float_background = palette.surface,
    float_background_dim = palette.surface_variant,
    float_border = palette.outline,
    float_title = palette.primary,
    popup_background = palette.surface_variant,
    selection = palette.primary_container,
    scrollbar_thumb = palette.surface_variant,
    statusline_fg = palette.on_surface,
    statusline_bg = palette.surface_variant,
    statusline_nc_fg = palette.on_surface_variant,
    statusline_nc_fg_alt = palette.on_surface_variant,
    statusline_nc_bg = palette.surface,
    tab_active_bg = palette.surface_variant,
    tab_inactive_bg = palette.surface,
    tab_inactive_fg = palette.on_surface,
    tab_fill_bg = palette.background,
    tab_fill_fg = palette.on_surface_variant,
  }
end

---Generate complete theme from configuration
---@param config ThemeConfig
---@param flavour string Explicit flavour ("night" or "day")
---@return ForestflowerTheme
function M.build(config, flavour)
  local palette = colors.palettes[flavour]
  
  -- Apply color overrides
  if config.colours_override then
    config.colours_override(palette)
  end
  
  local ui = build_ui_roles(palette)
  local syntax = colors.syntax[flavour]  -- Select flavour-specific syntax colors
  
  return {
    palette = palette,
    ui = ui,
    syntax = syntax,
  }
end

return M
