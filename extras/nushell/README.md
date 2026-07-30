# Forest Flower Nushell Theme

[Nushell](https://www.nushell.sh/) color configuration for Forest Flower, using the semantic tokens from `DESIGN.md`.

- **Night:** warm forest surfaces with bright gold accents.
- **Day:** parchment surfaces with deep gold accents.

Both variants share the same token roles, so switching is one command change.

## Requirements

- [Nushell](https://www.nushell.sh/book/installation.html) 0.114+
- A terminal that supports 24-bit truecolor

## Installation

### Unified installer

```bash
./install.sh           # installs forestflower.nu to ~/.config/nushell/
./install.sh --dry-run # preview
```

### Manual install

```bash
cp extras/nushell/forestflower.nu ~/.config/nushell/
```

## Usage

Add one of the following to your `config.nu` (usually at `~/.config/nushell/config.nu`):

**Night:**

```nu
use ~/.config/nushell/forestflower.nu *
$env.config.color_config = (forestflower-night)
```

**Day:**

```nu
use ~/.config/nushell/forestflower.nu *
$env.config.color_config = (forestflower-day)
```

Reload Nushell (`exec nu`) or start a new session.

## Token mapping

Nushell primitives and syntax shapes are mapped to Forest Flower semantic roles:

| Nushell | Forest Flower role | Night | Day |
|---|---|---|---|
| `separator` | `surface.raised` | `#3D484D` | `#E6E2CC` |
| `header` | `accent.resting` | `#BEC97E` | `#4D6B0E` |
| `row_index` | `ink.faint` | `#7A8478` | `#A6B0A0` |
| `hints` | `ink.comment` | `#969E95` | `#829181` |
| `int` / `float` | `code.number` | `#A699D0` | `#5E409D` |
| `string` | `code.string` | `#5ABDAC` | `#24837B` |
| `duration` / `range` | `code.function` | `#EC8B49` | `#BC5215` |
| `datetime` / `filesize` | `code.type` | `#66A0C8` | `#205EA6` |
| `binary` / `bool=false` | `status.danger` | `#F89A8A` | `#942822` |
| `bool=true` | `status.success` | `#BEC97E` | `#4D6B0E` |
| `shape_operator` | `code.operator` | `#878580` | `#878580` |
| `shape_variable` | `code.tag` | `#E47DA8` | `#A02F6F` |
| `shape_garbage` | parse error | white on red | white on red |

`bool` uses a closure so `true` renders as success and `false` as danger.

## Notes

- Table borders are controlled by `$env.config.table.mode`; this theme does not change it. Pick whichever mode you prefer (`rounded`, `single`, `heavy`, etc.).
- `LS_COLORS` is separate from Nushell's `color_config`. For matching `ls` colors, install a `vivid` theme or export a custom `LS_COLORS` that uses the Forest Flower ANSI palette.
- The theme file is a Nushell module. Export the commands with `use ... *` or import them by name: `use ~/.config/nushell/forestflower.nu [forestflower-night forestflower-day]`.

## License

MIT — see the project root.
