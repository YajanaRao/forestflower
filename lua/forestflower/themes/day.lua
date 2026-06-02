---Forest Flower — Day (Light variant)

return {
  name = "day",
  background = "light",

  -- Surface — Everforest Light (soft) parchment tones
  canvas = "#FDF6E3",
  surface = "#F4F0D9",
  surface_deep = "#EFEBD4",
  surface_raised = "#E6E2CC",

  -- Selection & focus
  selection = "#CAD8E2", -- pale Cobalt navy wash
  highlight_line = "#E6E2CC",

  -- Text — Everforest Light slate-green ink + Flexoki muted/subtle tones
  ink = "#5C6A72",
  muted = "#A6B0A0",
  subtle = "#829181",

  -- Chrome — Cobalt 2 deep navy. Exclusive to UI chrome; never appears in syntax.
  primary = "#193549",
  primary_container = "#D4DEE5",

  -- Syntax — Flexoki 600-series, role-mapped per Flexoki spec (light tier).
  syntax_keyword = "#66800B", -- gr-600
  syntax_operator = "#878580", -- tx-2 (works both modes)
  syntax_function = "#BC5215", -- or-600
  syntax_string = "#24837B", -- cy-600
  syntax_type = "#205EA6", -- bl-600
  syntax_tag = "#A02F6F", -- ma-600
  syntax_regex = "#5E409D", -- pu-600
  syntax_number = "#5E409D", -- pu-600
  syntax_variable = "#5C6A72", -- ink: resting state
  syntax_punctuation = "#829181", -- subtle
  syntax_comment = "#829181", -- subtle, italic where supported

  -- Semantic — Flexoki 700-series. Pattern inverts on light: darker = louder.
  error = "#942822", -- re-700
  warning = "#9B4A0F", -- or-700
  success = "#4D6B0E", -- gr-700
  info = "#1A4F8C", -- bl-700
  hint = "#829181", -- subtle

  -- Git — semantic mapped, no chrome leak
  git_add = "#4D6B0E", -- success family
  git_change = "#9B4A0F", -- warning family
  git_delete = "#942822", -- error family
  git_untracked = "#1A4F8C", -- info family
  git_ignored = "#829181",
  git_conflict = "#A02F6F", -- syntax_tag — urgent

  -- Terminal ANSI — canonical Flexoki light mapping
  ansi = {
    black = "#1C1B1A",
    red = "#AF3029", -- re-500
    green = "#66800B", -- gr-500
    yellow = "#AD8301", -- ye-500
    blue = "#205EA6", -- bl-500
    magenta = "#A02F6F", -- ma-500
    cyan = "#24837B", -- cy-500
    white = "#5C6A72", -- ink
    bright_black = "#6F6E69", -- tx-3 light
    bright_red = "#C03E1D", -- re-400
    bright_green = "#879A39", -- gr-400
    bright_yellow = "#D0A215", -- ye-400
    bright_blue = "#4385BE", -- bl-400
    bright_magenta = "#CE5D97", -- ma-400
    bright_cyan = "#3AA99F", -- cy-400
    bright_white = "#FDF6E3", -- canvas
  },

  none = "NONE",
}
