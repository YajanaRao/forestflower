---Forest Flower Colorscheme
---A nature-inspired colorscheme for mindful programming

local M = {}

---@class ForestflowerConfig
M.config = {
  flavour = "auto", -- "auto" | "night" | "day"
  background = "medium", -- "soft" | "medium" | "hard"
  transparent_background_level = 0, -- 0 | 1 | 2
  italics = false,
  disable_italic_comments = false,
  sign_column_background = "none", -- "none" | "grey"
  diagnostic_text_highlight = false,
  diagnostic_virtual_text = "coloured", -- "coloured" | "grey"
  diagnostic_line_highlight = false,
  show_eob = true,
  float_style = "bright", -- "bright" | "dim"
  on_highlights = function() end,
  colours_override = function() end,
  contrast_audit = false,
}

---Setup configuration
---@param opts? table
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

---Resolve the actual flavour from config
---@param config ForestflowerConfig
---@return string
local function resolve_flavour(config)
  if config.flavour == "auto" then
    -- Map vim.o.background to our flavour names
    return vim.o.background == "light" and "day" or "night"
  else
    return config.flavour
  end
end

---Load the colorscheme
function M.load()
  -- Import required modules
  local theme_builder = require("forestflower.core.theme")
  local terminal = require("forestflower.core.terminal")
  local util = require("forestflower.util")
  
  -- Resolve actual flavour from config
  local actual_flavour = resolve_flavour(M.config)
  
  -- Build theme based on resolved flavour
  local theme = theme_builder.build(M.config, actual_flavour)
  
  -- Generate highlight groups
  local editor = require("forestflower.groups.editor")(theme, M.config)
  local syntax = require("forestflower.groups.syntax")(theme, M.config)
  local diagnostics = require("forestflower.groups.diagnostics")(theme, M.config)
  local plugins = require("forestflower.groups.plugins")(theme, M.config)
  local snacks = require("forestflower.groups.snacks")(theme, M.config)
  
  -- Merge all highlight groups
  local highlights = vim.tbl_extend("force", {}, editor, syntax, diagnostics, plugins, snacks)
  
  -- Apply user overrides
  if M.config.on_highlights then
    M.config.on_highlights(highlights, theme.palette)
  end
  
  -- Load the colorscheme
  util.load(highlights)
  
  -- Setup terminal colors
  terminal.setup(theme.palette)
  
  -- Run contrast audit if enabled
  if M.config.contrast_audit then
    util.contrast_audit(theme)
  end
  
  -- Set up dynamic switching for auto mode
  if M.config.flavour == "auto" then
    vim.api.nvim_create_autocmd("OptionSet", {
      pattern = "background",
      callback = function()
        -- Only reload if we're still in auto mode
        if M.config.flavour == "auto" then
          M.load()
        end
      end,
      group = vim.api.nvim_create_augroup("ForestFlowerAutoSwitch", { clear = true })
    })
  end
end

return M
