# Forest Flower 🌺

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Neovim](https://img.shields.io/badge/Neovim-0.9+-green.svg)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Made%20with-Lua-blueviolet.svg)](https://lua.org)

A nature-inspired Neovim colorscheme for mindful programming. Warm, eye-friendly colors optimized for long coding sessions with automatic light/dark mode detection.

<div align="center">

### Night Theme
<img width="1918" alt="Forest Flower night theme" src="https://github.com/user-attachments/assets/f4325305-5e9b-4688-aa4b-ae5995cd4b8e" />

### Day Theme
<img width="1470" alt="Forest Flower day theme" src="https://github.com/user-attachments/assets/522891f2-c358-4d1f-978b-443c8d5accca" />

</div>

## ✨ Features

- 🌓 **Auto theme detection** - Respects terminal light/dark mode, switches automatically
- 👁️ **Eye health first** - Warm tones, moderate contrast for 8+ hour sessions
- 🎨 **Nature-inspired** - Organic colors from flowers and twilight skies
- ⚛️ **Enhanced React/JSX/TSX** - Distinct colors for components, hooks, attributes
- 🎯 **Full LSP & Treesitter** - Modern syntax highlighting
- 🔧 **Highly customizable** - Override any color or highlight
- 📦 **Pure Lua** - Fast, lightweight, zero dependencies

## 🚀 Quick Start

```lua
-- Minimal (auto-detects light/dark mode)
vim.cmd.colorscheme("forestflower")
```

**With [lazy.nvim](https://github.com/folke/lazy.nvim):**

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

That's it! The theme auto-detects your terminal's light/dark mode and updates when your system appearance changes.

## ⚙️ Configuration

<details>
<summary><b>All options (click to expand)</b></summary>

```lua
require("forestflower").setup({
  flavour = "auto",              -- "auto" | "night" | "day"
  background = "medium",         -- "soft" | "medium" | "hard"
  transparent_background_level = 0, -- 0 | 1 | 2
  italics = false,
  disable_italic_comments = false,
  sign_column_background = "none", -- "none" | "grey"
  diagnostic_text_highlight = false,
  diagnostic_virtual_text = "coloured", -- "coloured" | "grey"
  diagnostic_line_highlight = false,
  show_eob = true,
  float_style = "bright",        -- "bright" | "dim"
  on_highlights = function(hl, palette) 
    -- Customize highlights
  end,
  colours_override = function(palette)
    -- Customize palette
  end,
})
vim.cmd.colorscheme("forestflower")
```

</details>

## 🎨 Theme Variants

### Automatic Detection (Default)
```lua
vim.cmd.colorscheme("forestflower")  -- Auto-detects from terminal
```
Reads `vim.o.background` from your terminal and switches automatically when system appearance changes.

### Manual Selection
```lua
-- Lock to night/day theme
require("forestflower").setup({ flavour = "night" })  -- or "day"
vim.cmd.colorscheme("forestflower")

-- Quick switching with commands
vim.cmd.colorscheme("forestflower-night")
vim.cmd.colorscheme("forestflower-day")
```

### Keybindings for Theme Switching
```lua
vim.keymap.set("n", "<leader>td", "<cmd>colorscheme forestflower-day<cr>")
vim.keymap.set("n", "<leader>tn", "<cmd>colorscheme forestflower-night<cr>")
```

## 🔧 Customization

### Color Overrides
```lua
require("forestflower").setup({
  colours_override = function(palette)
    palette.primary = "#98c379"  -- Change accent color
  end,
  on_highlights = function(highlights, palette)
    highlights.Comment = { fg = palette.primary, italic = true }
  end,
})
```

### Transparency
```lua
require("forestflower").setup({
  transparent_background_level = 1,  -- 0: none, 1: editor, 2: all UI
})
```

## ⚛️ React/JSX/TSX Support

Enhanced syntax highlighting with distinct colors:

- **Components** (PascalCase) - Coral: `<ChatWidget>`, `<Button>`
- **HTML tags** (lowercase) - Cyan: `<div>`, `<span>`
- **Attributes** - Orange: `onClick`, `className`
- **Hooks** - Purple: `useState`, `useEffect`
- **Strings** - Green: String values

Creates clear visual hierarchy for easier code scanning.

## ❓ FAQ

<details>
<summary><b>How does automatic theme detection work?</b></summary>

Forest Flower reads `vim.o.background` from your terminal and automatically switches between night/day themes. When your system appearance changes (macOS, GNOME, etc.), the theme updates automatically. To lock to a specific theme, use `flavour = "night"` or `"day"`.
</details>

<details>
<summary><b>Can I manually switch themes?</b></summary>

Yes! Use `:colorscheme forestflower-night` or `:colorscheme forestflower-day`. Or set `flavour = "night"/"day"` in your config.
</details>

<details>
<summary><b>Transparency looks washed out?</b></summary>

Try `transparent_background_level = 1` instead of 2, or use `background = "medium"` instead of `"soft"`.
</details>



## 🌿 Design Philosophy

Built for mindful programming with health-conscious design:

- **Eye Health First** - Warm tones, moderate contrast for 8+ hour sessions
- **Nature-Inspired** - Colors from flowers, twilight skies, forest canopies
- **Timeless** - Natural palette designed for years, not trends
- **WCAG AA Compliant** - Accessible contrast for critical text

### Principles
- ✅ Natural colors only (no neon or corporate branding)
- ✅ Warm over cool (golden/amber undertones)
- ✅ Sustainable contrast (health over "maximum pop")
- ✅ Timeless over trendy



## 🙏 Credits

Inspired by [everforest](https://github.com/sainnhe/everforest), [NeoSolarized](https://github.com/Tsuzat/NeoSolarized.nvim), and [Tokyo Night](https://github.com/folke/tokyonight.nvim).

## 📄 License

[MIT License](LICENSE) - See LICENSE file for details.

## 🤝 Contributing

Contributions welcome! Please open an issue or PR. For color changes, follow the [design philosophy](#-design-philosophy).

---

<div align="center">

**[⭐ Star on GitHub](https://github.com/YajanaRao/forestflower)** • **[🐛 Report Bug](https://github.com/YajanaRao/forestflower/issues)** • **[💡 Request Feature](https://github.com/YajanaRao/forestflower/issues)**

Made with 🌺 for mindful programmers

</div>
