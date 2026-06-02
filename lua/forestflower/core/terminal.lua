---Configure terminal ANSI colors and related external-tool integrations.
local M = {}

---@param palette table palette table from themes/<name>.lua
function M.setup(palette)
  local a = palette.ansi
  vim.g.terminal_color_0  = a.black
  vim.g.terminal_color_1  = a.red
  vim.g.terminal_color_2  = a.green
  vim.g.terminal_color_3  = a.yellow
  vim.g.terminal_color_4  = a.blue
  vim.g.terminal_color_5  = a.magenta
  vim.g.terminal_color_6  = a.cyan
  vim.g.terminal_color_7  = a.white
  vim.g.terminal_color_8  = a.bright_black
  vim.g.terminal_color_9  = a.bright_red
  vim.g.terminal_color_10 = a.bright_green
  vim.g.terminal_color_11 = a.bright_yellow
  vim.g.terminal_color_12 = a.bright_blue
  vim.g.terminal_color_13 = a.bright_magenta
  vim.g.terminal_color_14 = a.bright_cyan
  vim.g.terminal_color_15 = a.bright_white

  vim.g.fzf_colors = {
    fg = { "fg", "Normal" },
    bg = { "bg", "Normal" },
    hl = { "fg", "Green" },
    ["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" },
    ["bg+"] = { "bg", "CursorLine", "CursorColumn" },
    ["hl+"] = { "fg", "Aqua" },
    info = { "fg", "Aqua" },
    border = { "fg", "Grey" },
    prompt = { "fg", "Orange" },
    pointer = { "fg", "Blue" },
    marker = { "fg", "Yellow" },
    spinner = { "fg", "Yellow" },
    header = { "fg", "Grey" },
  }

  vim.g.limelight_conceal_ctermfg = palette.surface_raised
  vim.g.limelight_conceal_guifg = palette.surface_raised
end

return M
