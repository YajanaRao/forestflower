---Forest Flower Colorscheme
---Single-flavour, role-driven. Add themes by dropping a file in themes/.

local M = {}

---@class ForestflowerConfig
M.config = {
  -- theme = "night",  -- omit to auto-detect from vim.o.background
  transparent_background = false,
  italics = true,
  sign_column_background = "grey", -- "none" | "grey"
  diagnostic_text_highlight = false,
  diagnostic_virtual_text = "coloured", -- "coloured" | "grey"
  float_style = "bright", -- "bright" | "dim"
  on_highlights = function(_hl, _palette) end,
  colours_override = function(_palette) end,
}

---@param opts? table
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  local themes = require("forestflower.themes")
  local util = require("forestflower.util")
  local terminal = require("forestflower.core.terminal")

  -- resolve() returns a deepcopy; safe to mutate from here on.
  local palette = themes.resolve(M.config, vim.o.background)
  M.config.colours_override(palette)

  local highlights = {}
  for _, group in ipairs({ "editor", "syntax", "diagnostics", "plugins", "snacks" }) do
    local generated = require("forestflower.groups." .. group)(palette, M.config)
    for k, v in pairs(generated) do
      highlights[k] = v
    end
  end

  M.config.on_highlights(highlights, palette)

  util.load(highlights)
  terminal.setup(palette)
end

return M
