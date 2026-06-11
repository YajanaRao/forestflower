# Forest Flower Lazygit Theme

[lazygit](https://github.com/jesseduffield/lazygit) UI chrome (panel borders,
selected line, options text, cherry-picked commits) for Forest Flower.

- **Night:** gold (`#FFC600`) active borders, forest-green selection.
- **Day:** deep forest-green (`#044123`) active borders, pale-navy selection.

> Lazygit's **diff panel is rendered by [delta](../delta/)**, not by lazygit.
> Install the delta theme too for diffs that match Neovim.

## A note on how lazygit themes work

Lazygit's `gui.theme` block only accepts inline color values — there is **no
"theme file path" field**. Instead, lazygit can layer multiple config files via
`-ucf` (or the `LG_CONFIG_FILE` env var), where later files merge over earlier
ones. These theme files contain **only** the `gui.theme` block, so they compose
on top of your existing `config.yml` without replacing your keybindings or other
settings.

## Requirements

- **lazygit:** install from https://github.com/jesseduffield/lazygit
- **delta** (for matching diffs): see `../delta/`

## Installation

The unified installer copies both variants to `~/.config/lazygit/`:

```bash
./install.sh           # installs forestflower-{day,night}.yml
./install.sh --dry-run # preview
```

### Manual install

```bash
cp extras/lazygit/forestflower-night.yml ~/.config/lazygit/   # or -day
```

## Usage

Launch lazygit with your base config plus the theme layer. Pick **one**:

**Per-launch flag** (e.g. a shell alias):

```sh
alias lg='lazygit -ucf ~/.config/lazygit/config.yml,~/.config/lazygit/forestflower-night.yml'
```

Fish abbreviation:

```fish
abbr -a lg 'lazygit -ucf ~/.config/lazygit/config.yml,~/.config/lazygit/forestflower-night.yml'
```

**Environment variable** (applies to bare `lazygit` too):

```sh
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/forestflower-night.yml"
```

Swap `forestflower-night.yml` for `forestflower-day.yml` to use the light variant.

## Notes

- No automatic light/dark switching — pick the variant in your alias/env var.
- Your `config.yml` is never modified; the theme is a separate, composable layer.
- The order matters: list your base `config.yml` first, the theme file last so
  the theme wins on any overlap.
