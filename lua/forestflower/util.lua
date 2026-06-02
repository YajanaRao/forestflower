---Color manipulation utilities + highlight loader.
---@class UtilModule
local M = {}

---@enum HighlightStyles
M.styles = {
  bold = "bold",
  italic = "italic",
  reverse = "reverse",
  undercurl = "undercurl",
  underline = "underline",
  standout = "standout",
  strikethrough = "strikethrough",
  nocombine = "nocombine",
}

---@param c string Hex color string (e.g., "#ff0000")
---@return number[]
local function rgb(c)
  if not c or type(c) ~= "string" or not c:match("^#%x%x%x%x%x%x$") then
    return { 0, 255, 0 } -- bright green default surfaces palette typos at runtime
  end
  c = string.lower(c)
  return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---Blend two colors with alpha. 0 returns bg, 1 returns fg.
---@param foreground string
---@param alpha number|string
---@param background string
---@return string
function M.blend(foreground, alpha, background)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = rgb(background)
  local fg = rgb(foreground)

  local channel = function(i)
    local v = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, v), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", channel(1), channel(2), channel(3))
end

---@param hex string
---@param amount number 0..1
---@param bg? string defaults to white
---@return string
function M.lighten(hex, amount, bg)
  return M.blend(hex, amount, bg or "#ffffff")
end

---@param hex string
---@param amount number 0..1
---@param fg? string defaults to black
---@return string
function M.darken(hex, amount, fg)
  return M.blend(hex, amount, fg or "#000000")
end

---Apply all highlight groups and register the colorscheme.
---@param highlights table<string, vim.api.keyset.highlight>
function M.load(highlights)
  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "forestflower"

  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

return M
