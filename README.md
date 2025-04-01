# 🎴 Forest Flower

A fork of [everforest](https://github.com/neanias/everforest-nvim) colour
scheme with customization.

### 🌇 Day

![forestflower color scheme day](https://github.com/user-attachments/assets/574421f6-99fc-4a60-8e46-d98b0cfa5ba4)

### 🌆 Night

![forestflower color scheme night](https://github.com/user-attachments/assets/cd286988-be8c-4566-b69d-da824afdb6fb)


_All screenshots taken from [my personal config](https://github.com/YajanaRao/kickstart.nvim)_

## ✨ Features

- 100% Lua, supports Treesitter & LSP
- Vim terminal colours
- **Lualine** theme

## 📦 Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
require("lazy").setup({
  "YajanaRao/forestflower",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require('forestflower').setup {
        flavour = 'night',
        italics = true,
    }
    vim.cmd.colorscheme 'forestflower'
  end,
})
```

## 🛸 Usage

```viml
" In VimL

" This has both light & dark modes to match your background setting.
colorscheme forestflower
```

```lua
-- In Lua
vim.cmd([[colorscheme forestflower]])

-- Alternatively
require("forestflower").load()
```

To enable the everforest theme for LuaLine, you can specify it as such:

```lua
require("lualine").setup({
  options = {
    -- ... other configuration
    theme = "forestflower", -- Can also be "auto" to detect automatically.
  }
})
```


## Plugin support

- [ALE](https://github.com/dense-analysis/ale)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [Coc.nvim](https://github.com/neoclide/coc.nvim)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [Git Gutter](https://github.com/airblade/vim-gitgutter)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Hop](https://github.com/phaazon/hop.nvim)
- [Incline.nvim](https://github.com/b0o/incline.nvim)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
- [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
- [Leap](https://github.com/ggandor/leap.nvim)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [Mini](https://github.com/echasnovski/mini.nvim)
- [Neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Neogit](https://github.com/TimUntersberger/neogit)
- [Neomake](https://github.com/neomake/neomake)
- [Neotest](https://github.com/nvim-neotest/neotest)
- [Noice](https://github.com/folke/noice.nvim)
- [NvimTree](https://github.com/nvim-tree/nvim-tree.lua)
- [Octo.nvim](https://github.com/pwntester/octo.nvim)
- [Scrollbar](https://github.com/petertriho/nvim-scrollbar)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Trouble](https://github.com/folke/trouble.nvim)
- [WhichKey](https://github.com/folke/which-key.nvim)
- [aerial.nvim](https://github.com/stevearc/aerial.nvim)
- [blamer.nvim](https://github.com/APZelos/blamer.nvim)
- [fzf.vim](https://github.com/junegunn/fzf.vim)
- [fsread.nvim](https://github.com/nullchilly/fsread.nvim)
- [lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)
- [nvim-ts-rainbow2](https://github.com/HiPhish/nvim-ts-rainbow2)
- [packer.nvim](https://github.com/wbthomason/packer.nvim)
- [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)
- [undotree](https://github.com/mbbill/undotree)
- [vim-floaterm](https://github.com/voldikss/vim-floaterm)
- [vim-matchup](https://github.com/andymass/vim-matchup)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [vim-sneak](https://github.com/justinmk/vim-sneak)
- [yanky.nvim](https://github.com/gbprod/yanky.nvim)

See [the wiki](https://github.com/neanias/everforest-nvim/wiki) for the full
list of plugins that have highlights.

## Still TODO

- [ ] Colour scheme configuration
  - [x] `background`
  - [x] `transparent_background`
  - [x] `dim_inactive_windows`
  - [x] `disable_italic_comments`
  - [x] `enable_italic` — this is `italic` in everforest-nvim
  - [ ] ~`cursor`~
  - [x] `sign_column_background`
  - [x] `spell_foreground`
  - [x] `ui_contrast`
  - [x] `show_eob`
  - [ ] `current_word`
  - [x] `diagnostic_text_highlight`
  - [x] `diagnostic_line_highlight`
  - [x] `diagnostic_virtual_text`
  - [ ] `disable_terminal_colours`
  - [x] `colours_override`
- [x] Transparent backgrounds
- [x] Different colour scheme "weights"

## Inspiration

- [everforest](https://github.com/sainnhe/everforest) (obviously)
- [NeoSolarized.nvim](https://github.com/Tsuzat/NeoSolarized.nvim)
- [Tokyo Night](https://github.com/folke/tokyonight.nvim)
