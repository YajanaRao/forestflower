---Forest Flower theme discovery + validation
---
---Adding a theme is one file. Drop `themes/<name>.lua` returning a flat palette
---table with every key listed in REQUIRED_ROLES. The validator runs once at load
---time and refuses to mount a theme that drops any required role — so missing
---values fail loudly at startup, not at first paint.

local util = require("forestflower.util")

local M = {}

-- State-colour derivation alphas. State tokens are blended from base palette
-- values so they always sit inside the palette instead of being hand-picked.
local SELECTION_ALPHA = 0.24 -- secondary wash behind selected text
local SEARCH_ALPHA = 0.25 -- gold wash behind all search matches

local REQUIRED_ROLES = {
  "name", "background",
  "canvas", "surface", "surface_deep", "surface_raised",
  "ink", "muted", "subtle",
  "primary", "primary_container", "secondary", "secondary_container",
  "syntax_keyword", "syntax_operator", "syntax_function",
  "syntax_string", "syntax_type", "syntax_tag",
  "syntax_regex", "syntax_number", "syntax_variable",
  "syntax_punctuation", "syntax_comment",
  "error", "warning", "success", "info", "hint",
  "git_add", "git_change", "git_delete",
  "git_untracked", "git_ignored", "git_conflict",
  "ansi", "none",
}

local REQUIRED_ANSI = {
  "black", "red", "green", "yellow", "blue", "magenta", "cyan", "white",
  "bright_black", "bright_red", "bright_green", "bright_yellow",
  "bright_blue", "bright_magenta", "bright_cyan", "bright_white",
}

---@param theme table
---@param name string
local function validate(theme, name)
  for _, role in ipairs(REQUIRED_ROLES) do
    if theme[role] == nil then
      error(("forestflower: theme '%s' missing required role: %s"):format(name, role))
    end
  end
  for _, ansi in ipairs(REQUIRED_ANSI) do
    if theme.ansi[ansi] == nil then
      error(("forestflower: theme '%s' missing ansi.%s"):format(name, ansi))
    end
  end
end

---List available theme names by scanning this directory.
---@return string[]
function M.list()
  local source = debug.getinfo(1, "S").source:sub(2)
  local dir = source:match("(.*/)")
  local names = {}
  if dir then
    for name, type_ in vim.fs.dir(dir) do
      if type_ == "file" and name:match("%.lua$") and name ~= "init.lua" then
        table.insert(names, name:sub(1, -5))
      end
    end
  end
  return names
end

---Load and validate a theme by name.
---@param name string
---@return table palette
function M.load(name)
  local ok, theme = pcall(require, "forestflower.themes." .. name)
  if not ok then
    error(("forestflower: theme '%s' not found"):format(name))
  end
  validate(theme, name)
  return theme
end

---Resolve which theme to load based on config and vim background.
---Returns a deepcopy so caller mutations (colours_override, transparency) never
---leak back into the cached module table.
---@param config table { theme?: string }
---@param vim_background string "dark" | "light"
---@return table palette
function M.resolve(config, vim_background)
  if config.theme then
    return vim.deepcopy(M.load(config.theme))
  end

  for _, name in ipairs(M.list()) do
    local ok, theme = pcall(M.load, name)
    if ok and theme.background == vim_background then
      return vim.deepcopy(theme)
    end
  end

  return vim.deepcopy(M.load("night"))
end

---Compute derived "state" tokens (selection, search_match) from base palette
---values. Run after colours_override so user overrides of base tokens flow into
---the derived values; respects any state token already set so an explicit
---override of `selection`/`search_match` still wins.
---@param p table palette (mutated in place)
---@return table p
function M.derive(p)
  p.selection = p.selection or util.blend(p.secondary, SELECTION_ALPHA, p.canvas)
  p.search_match = p.search_match or util.blend(p.primary, SEARCH_ALPHA, p.canvas)
  return p
end

return M
