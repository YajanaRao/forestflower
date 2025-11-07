# Forest Flower 🌺

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Neovim](https://img.shields.io/badge/Neovim-0.9+-green.svg)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Made%20with-Lua-blueviolet.svg)](https://lua.org)

A nature-inspired Neovim colorscheme for mindful programming.

**For developers who code in long sessions and value eye health, natural aesthetics, and conscious focus.**

---

### Night Theme
<img width="1918" height="1050" alt="Forest Flower colorscheme preview" src="https://github.com/user-attachments/assets/f4325305-5e9b-4688-aa4b-ae5995cd4b8e" />

### Day Theme
<img width="1470" height="928" alt="image" src="https://github.com/user-attachments/assets/522891f2-c358-4d1f-978b-443c8d5accca" />


_Screenshot taken from [my personal config](https://github.com/YajanaRao/kickstart.nvim)_

---

## ✨ Features

- 🎨 **Nature-inspired palette** - Warm, organic colors from flowers and twilight skies
- 👁️ **Eye health optimized** - Moderate contrast for 8+ hour coding sessions
- 🌓 **Day & Night variants** - Seamless theme switching with dedicated colorschemes
- ⚛️ **Enhanced React/JSX/TSX** - Distinct colors for components, hooks, and attributes
- 🎯 **Full LSP & Treesitter** - Modern syntax highlighting for all major languages
- 🎨 **Lualine theme** - Matching statusline integration with segmented brutal styling
- 🔧 **Highly customizable** - Override colors, highlights, and behavior
- 📦 **100% Lua** - Fast, lightweight, no dependencies
- 🏛️ **Gentle Brutalism** - Structural clarity with health-conscious design (NEW!)

## 🚀 Quick Start

**Minimal setup:**

```lua
vim.cmd.colorscheme("forestflower")
```

**With lazy.nvim (recommended):**

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

That's it! For advanced configuration options, see the [Installation](#installation) section below.

## 📖 Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim) (basic):

```lua
require("lazy").setup({
  {
    "YajanaRao/forestflower",
    priority = 1000, -- load first so everything can inherit
    lazy = false,    -- force load during startup
    opts = {         -- override any default (all shown below)
      background = "medium", -- "soft" | "medium" | "hard"
      transparent_background_level = 0, -- 0 | 1 | 2
      italics = false,
      disable_italic_comments = false,
      sign_column_background = "none", -- "none" | "grey"
      diagnostic_text_highlight = false,
      diagnostic_virtual_text = "coloured", -- "coloured" | "grey"
      diagnostic_line_highlight = false,
      show_eob = true,
      float_style = "bright", -- "bright" | "dim"
      contrast_audit = false,
      on_highlights = function(hl, palette) end,
      colours_override = function(p) end,
    },
    config = function(_, opts)
      require("forestflower").setup(opts)
      vim.cmd.colorscheme("forestflower")
    end,
  },
})
```

### LazyVim specific

If you are using LazyVim and want this to be your colorscheme, create (or edit) a spec file:

```lua
-- lua/plugins/colorscheme.lua
return {
  {
    "YajanaRao/forestflower",
    priority = 1000,
    lazy = false,
    opts = { background = "medium" },
    config = function(_, opts)
      require("forestflower").setup(opts)
      vim.cmd.colorscheme("forestflower")
    end,
  },
}
```

### Minimal setup

```lua
vim.cmd.colorscheme("forestflower")
```

### Day and Night Variants

Forest Flower provides dedicated colorscheme variants for quick theme switching:

```lua
-- Switch to night theme (dark)
vim.cmd.colorscheme("forestflower-night")

-- Switch to day theme (light)
vim.cmd.colorscheme("forestflower-day")

-- Use default (respects config, defaults to night)
vim.cmd.colorscheme("forestflower")
```

These variants only override the flavour setting while preserving all other user configurations. This allows easy switching with the `:colorscheme` command or keybindings:

```lua
-- Example keybindings for theme switching
vim.keymap.set("n", "<leader>td", "<cmd>colorscheme forestflower-day<cr>", { desc = "Theme: Day" })
vim.keymap.set("n", "<leader>tn", "<cmd>colorscheme forestflower-night<cr>", { desc = "Theme: Night" })
```

### Options

| Option                       | Type     | Default    | Description                                                        |
| ---------------------------- | -------- | ---------- | ------------------------------------------------------------------ |
| background                   | string   | "medium"   | Hardness of base background: "soft", "medium", "hard"              |
| transparent_background_level | integer  | 0          | 0: normal, 1: editor bg transparent, 2: more UI chrome transparent |
| italics                      | boolean  | false      | Enable italics for keywords etc.                                   |
| disable_italic_comments      | boolean  | false      | Force comments non-italic                                          |
| sign_column_background       | string   | "none"     | "none" or "grey" background for sign column                        |
| diagnostic_text_highlight    | boolean  | false      | Fill diagnostic virtual text background                            |
| diagnostic_virtual_text      | string   | "coloured" | "coloured" or "grey" diagnostic virtual text colour                |
| diagnostic_line_highlight    | boolean  | false      | Background highlight for entire diagnostic lines                   |
| show_eob                     | boolean  | true       | Show end-of-buffer tildes                                          |
| float_style                  | string   | "bright"   | Floating win bg lighter ("bright") or darker ("dim")               |
| contrast_audit               | boolean  | false      | Run contrast audit and report via vim.notify                       |
| on_highlights                | function | noop       | (hl, palette) mutate final highlight groups                        |
| colours_override             | function | noop       | (palette) edit raw material-ish tokens before roles applied        |

### Override examples

Darken selection, tweak palette & add custom group.

```lua
require("forestflower").setup({
  colours_override = function(p)
    p.primary = "#98c379" -- change primary accent
  end,
  on_highlights = function(hl, palette)
    hl.MyTitle = { fg = palette.primary, bold = true }
    hl.MySelection = { bg = "#445566" } -- custom selection bg
  end,
})
vim.cmd.colorscheme("forestflower")
```

### Contrast audit

Enable `contrast_audit = true` to receive a summary of WCAG-ish contrast ratios for core roles. Useful while theming or adjusting roles.

### React/JSX/TSX Highlighting

Forest Flower provides enhanced syntax highlighting for React, JSX, and TSX with distinct colors for better visual differentiation:

**Visual Hierarchy:**

- 🔴 **React Components** (PascalCase): Coral `#dd7878` - Components like `<ChatWidget>`, `<Button>`
- 🔵 **HTML Tags** (lowercase): Cyan `#74c7ec` - Native elements like `<div>`, `<span>`
- 🟠 **JSX Attributes**: Orange `#f6c177` - Props like `onClick`, `className`, `css`
- 🟣 **React Hooks**: Purple `#c4a7e7` - `useState`, `useEffect`, `useCallback`
- 🟢 **Strings**: Green `#a7c080` - String values and text content

**Example:**

```tsx
import { useState } from "react"; // Hook import

const ChatWidget = ({ config }) => {
  // Component (coral)
  const [isOpen, setIsOpen] = useState(false); // Hook (purple)

  return (
    <FrameWrapper css={styles}>
      {" "}
      {/* Component (coral), Attribute (orange) */}
      <div className="container">
        {" "}
        {/* HTML tag (cyan), Attribute (orange) */}
        <ChatButton onClick={toggle}>
          {" "}
          {/* Component (coral), Attribute (orange) */}
          Open Chat {/* String (green) */}
        </ChatButton>
      </div>
    </FrameWrapper>
  );
};
```

This creates a clear visual hierarchy that makes React code easier to scan and understand at a glance.

### Gentle Brutalism Enhancement

Forest Flower now incorporates "gentle brutalism" design principles - bringing structural clarity and confident aesthetics while preserving the theme's health-conscious, nature-inspired core.

**What's Enhanced:**

- **Stronger Borders**: More defined UI boundaries with warm dark tones (not harsh black)
- **Layered Depth**: Subtle offset backgrounds for statusline segments and tabs
- **Bold Hierarchy**: Strategic emphasis on active elements (tabs, selections, titles)
- **Confident Colors**: 10-12% saturation boost while maintaining warm undertones
- **Geometric Clarity**: Sharp, well-defined boundaries between UI components
- **Segmented Statusline**: Clear visual separation between lualine sections

**What's Preserved:**

- **Warm Undertones**: Golden/amber base temperature unchanged
- **Sustainable Contrast**: Still optimized for 8+ hour sessions
- **Nature-Inspired Palette**: Organic colors from flowers and twilight
- **No Harsh Elements**: No pure black, no neon, no electric colors
- **Eye Health**: Moderate contrast levels maintained

**Philosophy:**

Gentle brutalism embraces neobrutalism's structural honesty and geometric clarity without the harsh contrast and electric colors. Think of it as "brutalism designed by nature" - clear boundaries like tree trunks, layered depth like forest canopies, bold emphasis like blooming flowers, all while maintaining the warm, organic feel that makes Forest Flower ideal for long coding sessions.

**Visual Improvements:**

- Float windows have more prominent borders and bold titles
- Active tabs are elevated with subtle background changes
- Telescope and pickers have stronger borders and bold selections
- File explorers show bold folder names and prominent current files
- Window separators are more visible yet still warm-toned
- Statusline segments have distinct backgrounds for better hierarchy

**Technical Documentation:**  
For comprehensive implementation details, saturation philosophy, and color science rationale, see [`doc/gentle-brutalism.md`](doc/gentle-brutalism.md).

### FAQ

Q: Treesitter highlight group names changed?
A: Forest Flower maps both legacy TS* groups and new *@\* captures; you can safely migrate gradually.

Q: Can I safely link to Red/Green groups?
A: Yes. These generic groups deliberately persist for plugin compatibility.

Q: Light mode?
A: Use `:colorscheme forestflower-day` for the light theme or `:colorscheme forestflower-night` for the dark theme. You can also set `flavour = "day"` in your config, or use `:set background=light` before loading.

Q: Soft background washed out with transparency?
A: Try `transparent_background_level = 1` only, or move to `medium` hardness.

---

## 🎨 Design Philosophy

### Core Values

**Mindful Focus**  
Conscious attention, relaxed intensity, sustained presence. Colors that support deep work states without artificial stimulation.

**Health-First**  
Warm tones and moderate contrast reduce eye strain. Optimized for 8+ hour sessions - because your eyes matter more than trends.

**Nature-Inspired**  
Colors drawn from flowers, plants, twilight skies. Vibrant yet organic, distinct yet harmonious. Never synthetic or mechanical.

**Timeless Simplicity**  
Minimum visual noise, maximum clarity. Natural colors don't go out of style.

### Color Architecture

**Palette Philosophy:**
- **UI elements** = Environment (sky, earth, natural light)  
- **Syntax tokens** = Flora (flower-inspired names for memorability)

**Structure:**
- Warm golden undertones throughout (twilight-range temperature)
- Distinct syntax colors for clarity (biodiversity principle)
- Layered surfaces for depth (forest floor to canopy)
- WCAG AA compliant for critical text

**Specific values:** See `lua/forestflower/core/colors.lua`

### Design Principles

**✅ Natural Colors Only**  
Forest greens, sky blues, flower purples, sunset oranges, earth tones. No neon, electric, or corporate branding colors.

**✅ Warm Over Cool**  
Golden/amber undertones. Never cold, clinical, or harsh grayscale.

**✅ Sustainable Contrast**  
Moderate contrast for 8+ hours without headaches. Health over "maximum pop."

**✅ Timeless Over Trendy**  
Resist UI fads. Nature-based palette designed for years, not months.

**✅ Structural Clarity** (Gentle Brutalism)  
Clear boundaries and honest design. UI elements show their actual structure without decoration. Geometric precision meets organic warmth.

### What This Is

A health-conscious, nature-inspired colorscheme for mindful programmers. Not for everyone - and that's intentional.

### What This Is NOT

- Maximum-contrast "productivity theater"
- Trendy corporate aesthetics  
- Chasing design fads
- For quick context-switching or short sessions

### Decision Framework

Before changing colors, ask:
1. **Natural?** Could this exist in nature?
2. **Healthy?** Does it support 8+ hour sessions?
3. **Mindful?** Calm focus or artificial stimulation?
4. **Timeless?** Will this feel dated in 2 years?

---

## 💡 Inspiration

- [everforest](https://github.com/sainnhe/everforest) (obviously)
- [NeoSolarized.nvim](https://github.com/Tsuzat/NeoSolarized.nvim)
- [Tokyo Night](https://github.com/folke/tokyonight.nvim)
