---Highlight construction utilities.
---@class HighlightStyles
---@field bold string
---@field italic string
---@field reverse string
---@field undercurl string
---@field underline string
---@field standout string
---@field strikethrough string
---@field nocombine string

---@alias Highlight vim.api.keyset.highlight
---@alias Highlights table<string,Highlight>

local M = {}

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

---@param fg string|nil
---@param bg string|nil
---@param stylings string[]|nil
---@param sp string|nil
---@return Highlight
function M.create(fg, bg, stylings, sp)
  local h = {}
  if fg then h.fg = fg end
  if bg then h.bg = bg end
  if stylings then
    for _, style in ipairs(stylings) do
      if M.styles[style] then h[M.styles[style]] = true end
    end
  end
  if sp then h.sp = sp end
  return h
end

---@param target string
---@return Highlight
function M.link(target)
  return { link = target }
end

return M
