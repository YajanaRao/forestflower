---Terminal color system for Forest Flower colorscheme
---Handles ANSI terminal colors and external tool integrations

---@class TerminalModule
local M = {}

---Configure terminal ANSI colors
---@param palette ColorPalette
---@param background string
function M.setup(palette, background)
  -- Use explicit terminal colors that match OpenCode theme
  -- Base ANSI colors (0-7)
  vim.g.terminal_color_0 = palette.terminal.black
  vim.g.terminal_color_1 = palette.terminal.red
  vim.g.terminal_color_2 = palette.terminal.green
  vim.g.terminal_color_3 = palette.terminal.yellow
  vim.g.terminal_color_4 = palette.terminal.blue
  vim.g.terminal_color_5 = palette.terminal.magenta
  vim.g.terminal_color_6 = palette.terminal.cyan
  vim.g.terminal_color_7 = palette.terminal.white

  -- Bright ANSI colors (8-15)
  vim.g.terminal_color_8 = palette.terminal.black_bright
  vim.g.terminal_color_9 = palette.terminal.red_bright
  vim.g.terminal_color_10 = palette.terminal.green_bright
  vim.g.terminal_color_11 = palette.terminal.yellow_bright
  vim.g.terminal_color_12 = palette.terminal.blue_bright
  vim.g.terminal_color_13 = palette.terminal.magenta_bright
  vim.g.terminal_color_14 = palette.terminal.cyan_bright
  vim.g.terminal_color_15 = palette.terminal.white_bright       

  -- fzf.vim colors
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

  -- limelight.vim colors
  vim.g.limelight_conceal_ctermfg = palette.outline_variant
  vim.g.limelight_conceal_guifg = palette.outline_variant
end

return M

