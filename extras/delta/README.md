# Forest Flower Delta Theme

[delta](https://github.com/dandavison/delta) diff colors for Forest Flower,
matched to the Neovim `DiffAdd` / `DiffDelete` / `DiffChange` highlight groups so
git diffs in the terminal (and in lazygit) read identically to the editor.

- **Night:** muted forest backgrounds over canvas `#2D353B`, gold hunk headers.
- **Day:** soft parchment backgrounds over canvas `#FDF6E3`, forest-green hunk headers.

Git foreground colors come from the Flexoki semantic accents in `DESIGN.md`
(`git-add`, `git-delete`, `git-change`); the chrome accent (`primary`) carries
the hunk header.

## Requirements

- **delta:** install from https://github.com/dandavison/delta
- Configure git to page through delta (`core.pager = delta`).

## Installation

Both variants ship in a single file, `forestflower.gitconfig`, as the named
delta features `forestflower-day` and `forestflower-night`. The installer copies
it to `~/.config/delta/`:

```bash
./install.sh           # installs forestflower.gitconfig
./install.sh --dry-run # preview
```

Then add the include to `~/.gitconfig`:

```ini
[include]
    path = ~/.config/delta/forestflower.gitconfig
```

Using `[include]` keeps the theme isolated from your main git config — your
existing `[delta]` settings (e.g. `navigate = true`) stay untouched, and the
included file only defines the two features.

### Manual install

```bash
cp extras/delta/forestflower.gitconfig ~/.config/delta/
```

## Selecting a variant

Pick one of two approaches:

**1. Static** — set the feature in your `[delta]` block:

```ini
[delta]
    features = forestflower-day   # or forestflower-night
```

**2. Auto day/night** — set the `DELTA_FEATURES` env var from your shell. delta
reads it fresh on every invocation, so toggling system light/dark updates the
next `git diff` live (no new shell needed). Example (fish), driven by macOS
appearance:

```fish
if test (defaults read -g AppleInterfaceStyle 2>/dev/null) = Dark
    set -gx DELTA_FEATURES forestflower-night
else
    set -gx DELTA_FEATURES forestflower-day
end
```

Hook that into `fish_preexec` (or zsh `preexec` / bash `PROMPT_COMMAND`) to
re-evaluate before each command.

## Notes

- **lazygit diffs are rendered by delta**, not by lazygit. Installing this theme
  themes lazygit's diff panel too. See `../lazygit/` for the lazygit UI chrome.
- `syntax-theme = base16-256` renders diff bodies via the terminal's ANSI
  palette (which Ghostty maps to Forest Flower), so they match the editor.
