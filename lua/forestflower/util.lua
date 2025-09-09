local util = {}

---@param group string
---@param hl Highlight
util.generate_highlight = function(group, hl)
  -- We can't add a highlight without a group
  if not group then
    return
  end

  vim.api.nvim_set_hl(0, group, hl)
end

---@param syntax_entries Highlights
util.generate_highlights = function(syntax_entries)
  for group, highlights in pairs(syntax_entries) do
    util.generate_highlight(group, highlights)
  end
end

---@param generated_syntax Highlights
util.load = function(generated_syntax)
  if vim.g.colors_name then
    vim.cmd([[highlight clear]])
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "forestflower"

  util.generate_highlights(generated_syntax)
end

---Resolve a semantic colour name to an actual palette hex.
---Falls back to palette.fg if mapping missing.
---@param palette table
---@param semantic table
---@param role string
---@return string
function util.semantic_colour(palette, semantic, role)
  local hue_key = semantic[role]
  if hue_key and palette[hue_key] then
    return palette[hue_key]
  end
  return palette.fg
end

return util
