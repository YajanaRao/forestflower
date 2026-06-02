---Forest Flower theme for lualine.nvim
---
---DESIGN.md § Brand / Lualine:
---NORMAL   → background = success (RCB green), foreground = canvas
---INSERT   → background = primary (gold dark / navy light), foreground = canvas
---VISUAL   → background = info (blue), foreground = canvas
---REPLACE  → background = error (coral), foreground = canvas
---COMMAND  → background = warning (orange), foreground = canvas
---TERMINAL → background = syntax_tag (magenta), foreground = canvas
---The normal pill is green to signal resting state, distinct from the
---accent-filled active-mutation cluster.

local M = {}

function M.get_palette()
  local ok, themes = pcall(require, "forestflower.themes")
  if ok then
    local config = require("forestflower").config or {}
    return themes.resolve(config, vim.o.background)
  end

  -- Fallback dark palette if forestflower is not loaded yet
  return {
    canvas         = "#2D353B",
    surface        = "#232A2E",
    surface_deep   = "#1D2226",
    ink            = "#D3C6AA",
    muted          = "#7A8478",
    primary        = "#FFC600",
    success        = "#BEC97E",
    error          = "#F89A8A",
    warning        = "#F9AE77",
    info           = "#92BFDB",
    syntax_tag     = "#E47DA8",
  }
end

function M.setup()
  local p = M.get_palette()

  return {
    normal = {
      a = { bg = p.success, fg = p.canvas, gui = "bold" },
      b = { bg = p.surface, fg = p.ink },
      c = { bg = p.surface_deep, fg = p.muted },
    },
    insert = {
      a = { bg = p.primary, fg = p.canvas, gui = "bold" },
      b = { bg = p.surface, fg = p.ink },
      c = { bg = p.surface_deep, fg = p.muted },
    },
    visual = {
      a = { bg = p.info, fg = p.canvas, gui = "bold" },
      b = { bg = p.surface, fg = p.ink },
      c = { bg = p.surface_deep, fg = p.muted },
    },
    replace = {
      a = { bg = p.error, fg = p.canvas, gui = "bold" },
      b = { bg = p.surface, fg = p.ink },
      c = { bg = p.surface_deep, fg = p.muted },
    },
    command = {
      a = { bg = p.warning, fg = p.canvas, gui = "bold" },
      b = { bg = p.surface, fg = p.ink },
      c = { bg = p.surface_deep, fg = p.muted },
    },
    terminal = {
      a = { bg = p.syntax_tag, fg = p.canvas, gui = "bold" },
      b = { bg = p.surface, fg = p.ink },
      c = { bg = p.surface_deep, fg = p.muted },
    },
    inactive = {
      a = { bg = p.surface, fg = p.muted },
      b = { bg = p.surface, fg = p.muted },
      c = { bg = p.surface_deep, fg = p.muted },
    },
  }
end

return M.setup()
