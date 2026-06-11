# Forest Flower 🌺

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Neovim](https://img.shields.io/badge/Neovim-0.9+-green.svg)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Made%20with-Lua-blueviolet.svg)](https://lua.org)

A Neovim colorscheme combining three pedigrees:

- **Surfaces** from [Everforest](https://github.com/sainnhe/everforest) — warm grey-green forest canvas (night) or cream parchment (day).
- **Chrome** from [Cobalt 2](https://github.com/wesbos/cobalt2) — a single accent identity: gold (`#FFC600`) at night, deep navy (`#193549`) by day. Both used as outline/marker/cursor — never as broad fill.
- **Syntax** from [Flexoki](https://stephango.com/flexoki) — calm role-mapped accents. 300-series on dark canvas, 600-series on cream. Ink on paper, both ways.

> Forest Flower ships two themes: **night** (default dark) and **day** (light). See [DESIGN.md](./DESIGN.md) for the design thesis.

### Night

<img width="1918" height="1050" alt="Forest Flower night preview" src="https://github.com/user-attachments/assets/f4325305-5e9b-4688-aa4b-ae5995cd4b8e" />

---

## Quick Start

```lua
vim.cmd.colorscheme("forestflower")
```

By default, Forest Flower follows `vim.o.background` — `dark` loads night, `light` loads day. Pin a specific theme with `setup({ theme = "night" })` or `setup({ theme = "day" })`.

With lazy.nvim:

```lua
{
  "YajanaRao/forestflower",
  priority = 1000,
  lazy = false,
  config = function()
    vim.cmd.colorscheme("forestflower")
  end,
}
```

## Configuration

```lua
require("forestflower").setup({
  -- theme = "night",                 -- omit to auto-detect via vim.o.background
  transparent_background = false,
  italics = false,
  sign_column_background = "grey",    -- "none" | "grey"
  diagnostic_text_highlight = false,
  diagnostic_virtual_text = "coloured", -- "coloured" | "grey"
  float_style = "bright",             -- "bright" | "dim"

  on_highlights = function(hl, palette) end,
  colours_override = function(palette) end,
})
vim.cmd.colorscheme("forestflower")
```

| Option                    | Type     | Default    | Description                                                                                             |
| ------------------------- | -------- | ---------- | ------------------------------------------------------------------------------------------------------- |
| theme                     | string?  | nil        | Theme to load. Omit to auto-detect from `vim.o.background`. Ships `"night"` (dark) and `"day"` (light). |
| transparent_background    | boolean  | false      | Drop the canvas and sidebar backgrounds.                                                                |
| italics                   | boolean  | false      | Italicize keywords and comments.                                                                        |
| sign_column_background    | string   | "grey"     | `"grey"` (surface) or `"none"` (transparent).                                                           |
| diagnostic_text_highlight | boolean  | false      | Tint diagnostic text backgrounds.                                                                       |
| diagnostic_virtual_text   | string   | "coloured" | `"coloured"` or `"grey"`.                                                                               |
| float_style               | string   | "bright"   | `"bright"` (surface) or `"dim"` (surface_raised) floats.                                                |
| on_highlights             | function | noop       | `(highlights, palette)` mutate the final highlight table.                                               |
| colours_override          | function | noop       | `(palette)` edit role values before highlights apply.                                                   |

### Recommended `guicursor`

The DESIGN spec calls for a fat gold cursor. Neovim can't set cursor pixel width from a colorscheme; configure it in your `init.lua`:

```vim
set guicursor=n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor,o:hor50-Cursor,a:Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
```

### Override examples

```lua
require("forestflower").setup({
  colours_override = function(p)
    p.primary = "#98c379" -- repaint the chrome
  end,
  on_highlights = function(hl, palette)
    hl.MyTitle = { fg = palette.primary, bold = true }
  end,
})
```

`colours_override` operates on a per-load copy of the palette; mutations never leak between loads.

## Adding a Theme

Themes live in `lua/forestflower/themes/`. Drop a single file returning a flat palette table:

```lua
-- lua/forestflower/themes/my-theme.lua
return {
  name = "my-theme",
  background = "dark",  -- which vim.o.background this serves

  canvas = "#…", surface = "#…", surface_deep = "#…", surface_raised = "#…",
  selection = "#…", highlight_line = "#…",
  ink = "#…", muted = "#…", subtle = "#…",
  primary = "#…", primary_container = "#…",
  syntax_keyword = "#…", syntax_operator = "#…", syntax_function = "#…",
  syntax_string = "#…", syntax_type = "#…", syntax_tag = "#…",
  syntax_regex = "#…", syntax_number = "#…", syntax_variable = "#…",
  syntax_punctuation = "#…", syntax_comment = "#…",
  error = "#…", warning = "#…", success = "#…", info = "#…", hint = "#…",
  git_add = "#…", git_change = "#…", git_delete = "#…",
  git_untracked = "#…", git_ignored = "#…", git_conflict = "#…",
  ansi = { black = "#…", red = "#…", green = "#…", yellow = "#…",
           blue = "#…", magenta = "#…", cyan = "#…", white = "#…",
           bright_black = "#…", bright_red = "#…", bright_green = "#…",
           bright_yellow = "#…", bright_blue = "#…", bright_magenta = "#…",
           bright_cyan = "#…", bright_white = "#…" },
  none = "NONE",
}
```

The validator rejects any theme that drops a required role at load time — missing values fail loudly at startup, not at first paint.

Then select it via `setup({ theme = "my-theme" })` or by setting `vim.o.background` to a value matching the theme's `background` field.

## Plugin support

ALE, Barbar, BufferLine, Coc.nvim, Dashboard, Flash, gitsigns, Hop, Incline, Indent Blankline, LSP Diagnostics, LspSaga, Leap, Lualine, Mini, Neo-tree, Neogit, Noice, NvimTree, Scrollbar, Snacks (explorer, picker, indent), Telescope, Treesitter, Trouble, WhichKey, aerial, blamer, fzf, nvim-cmp, nvim-dap-ui, nvim-navic, nvim-notify, nvim-ts-rainbow, yanky, and others.

## License

MIT.
