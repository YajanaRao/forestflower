---Forest Flower — Night
---
---Single source of truth for the night palette. Mirrors DESIGN.md verbatim:
---surfaces from Everforest, chrome from Cobalt 2 gold, syntax from Flexoki 300-series.
---
---Adding a new theme: copy this file, change the values, ensure every key remains
---defined. The validator in themes/init.lua will refuse to load a theme that
---drops any required role.

return {
  name = "night",
  background = "dark", -- which vim.o.background this theme serves

  -- Surface — Everforest forest tones
  canvas         = "#2D353B",
  surface        = "#232A2E",
  surface_deep   = "#1D2226",
  surface_raised = "#3D484D",

  -- Selection & focus
  selection      = "#3A5A40",
  highlight_line = "#3D484D",

  -- Text — Everforest parchment ink + Flexoki muted/subtle tones
  ink    = "#D3C6AA",
  muted  = "#7A8478",
  subtle = "#969E95",

  -- Chrome — Cobalt 2 gold. Exclusive to UI chrome; never appears in syntax.
  primary           = "#FFC600",
  primary_container = "#403319",

  -- Syntax — Flexoki 300-series, role-mapped per Flexoki spec.
  syntax_keyword     = "#A0AF54", -- gr-300: control flow, declarations
  syntax_operator    = "#878580", -- tx-2: recedes
  syntax_function    = "#EC8B49", -- or-300: function & method calls
  syntax_string      = "#5ABDAC", -- cy-300: string literals
  syntax_type        = "#66A0C8", -- bl-300: types, classes, interfaces
  syntax_tag         = "#E47DA8", -- ma-300: JSX components, language features
  syntax_regex       = "#A699D0", -- pu-300: regex & special literals
  syntax_number      = "#A699D0", -- pu-300: numbers & constants
  syntax_variable    = "#D3C6AA", -- ink: plain identifiers (resting state)
  syntax_punctuation = "#969E95", -- subtle: delimiters
  syntax_comment     = "#969E95", -- subtle: italic where supported

  -- Semantic — Flexoki 200-series, one tier brighter than syntax
  error   = "#F89A8A", -- re-200
  warning = "#F9AE77", -- or-200
  success = "#BEC97E", -- gr-200
  info    = "#92BFDB", -- bl-200
  hint    = "#969E95", -- subtle

  -- Git — semantic mapped, no chrome leak
  git_add       = "#BEC97E", -- success family
  git_change    = "#F9AE77", -- warning family
  git_delete    = "#F89A8A", -- error family
  git_untracked = "#92BFDB", -- info family
  git_ignored   = "#969E95",
  git_conflict  = "#E47DA8", -- syntax_tag — urgent

  -- Terminal ANSI — canonical Flexoki dark mapping
  ansi = {
    black          = "#1D2226",
    red            = "#D14D41", -- re-400
    green          = "#879A39", -- gr-400
    yellow         = "#D0A215", -- ye-400
    blue           = "#4385BE", -- bl-400
    magenta        = "#CE5D97", -- ma-400
    cyan           = "#3AA99F", -- cy-400
    white          = "#D3C6AA", -- ink
    bright_black   = "#575653", -- ui-3
    bright_red     = "#E8705F", -- re-300
    bright_green   = "#A0AF54", -- gr-300
    bright_yellow  = "#ECCB60", -- ye-200
    bright_blue    = "#66A0C8", -- bl-300
    bright_magenta = "#E47DA8", -- ma-300
    bright_cyan    = "#5ABDAC", -- cy-300
    bright_white   = "#ffffff",
  },

  none = "NONE",
}
