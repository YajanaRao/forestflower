# Forest Flower Starship Configuration

A clean, minimal powerline prompt for Starship using Forest Flower colors with a natural brightness gradient.

## Features

- **Clean 4-segment design:** Directory, git, jobs, and languages
- **Sunset Fade gradient:** Natural brightness descent from light to dark
- **Smart language detection:** Only shows when language files are detected (avoids empty segments)
- **Jobs indicator:** Shows background job count in a dedicated segment
- **Proper powerline arrows:** Uses Nerd Font glyphs for smooth transitions
- **Nature-inspired colors:** Warm palette flowing from bright to subtle
- **Visual hierarchy:** Light Green → Light Pink → Sunset Orange → Dark Forest

## Installation

### Night Theme (Dark)
```bash
cp extras/starship/forestflower.toml ~/.config/starship.toml
exec $SHELL
```

### Day Theme (Light)
```bash
cp extras/starship/forestflower-day.toml ~/.config/starship.toml
exec $SHELL
```

Or use the provided install script from the project root:

```bash
./install-configs.sh
```

## Requirements

- **Starship:** Install from https://starship.rs
- **Nerd Font:** Any Nerd Font (e.g., GeistMono Nerd Font, JetBrains Mono Nerd Font)
- **Ghostty/Terminal:** Configure to use a Nerd Font

## Segments

The prompt uses a **Sunset Fade** gradient - brightness descends naturally from light to dark:

1. **Directory** (`#b4d494` - light green, 80% brightness) 🌿
   - Current directory with smart path truncation
   - Icon substitutions for common folders
   - Forest Flower's primary brand color

2. **Git** (`#d699b6` - light pink/rose, 70% brightness) 🌸
   - Branch name with git icon
   - Status indicators (staged, modified, etc.)
   - Tertiary color for warm, delicate contrast

3. **Jobs** (`#d9a85f` - sunset orange, 60% brightness) 🍯
   - Background job count indicator
   - Only appears when jobs are running (threshold: 1+)
   - Warning color used functionally

4. **Languages** (`#2d4d3a` - dark forest green, 30% brightness) 🌲
   - Detected language versions (Node.js, Python, Rust, Go, Bun)
   - Only shows when relevant project files detected
   - Recedes to background, doesn't compete for attention

## Design Rationale

The **Sunset Fade** gradient creates a natural visual flow that mimics watching a sunset:

- **Brightness descent:** Light → Light → Medium → Dark (no jarring jumps)
- **Warm palette only:** All colors have warm undertones (no cool cyans interrupting)
- **Information hierarchy:** Most important (directory) is brightest, metadata (languages) recedes
- **Reading flow:** Follows left-to-right eye movement, ending in subtle darkness
- **Nature-inspired:** Like forest floor to canopy, or twilight fading to dusk

This aligns with Forest Flower's core philosophy of **mindful, health-first design** - the gradient is easy on the eyes during long coding sessions.

## Customization

### Enable/Disable Jobs Indicator

The jobs segment shows background job count:

```toml
[jobs]
symbol = "✦"
number_threshold = 1  # Show when 1+ jobs
# Set to 2 to only show when 2+ jobs
disabled = false  # Set true to hide completely
```

### Add More Language Detection

The config includes Node.js, Python, Rust, Go, and Bun. Add more:

```toml
# Add to format string (in the language segment):
$java\
$ruby\

# Add module configuration:
[java]
symbol = " "
style = "bg:#2d4d3a fg:#b4d494"
format = '[ $symbol ($version) ]($style)'
```

Supported languages: `java`, `ruby`, `php`, `elixir`, `nim`, etc.

### Change Directory Icons

Edit the `[directory.substitutions]` section:

```toml
[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Projects" = " "
```

### Adjust Truncation

Change how deep the directory path shows:

```toml
[directory]
truncation_length = 3  # Show 3 levels
truncation_symbol = "…/"
```

## Troubleshooting

**Arrows show as boxes:**
- Install a Nerd Font
- Configure your terminal to use it
- Test: `echo -e "\ue0b0 \ue0b2 \ue0b1"`

**Prompt not updating:**
- Run `exec $SHELL` to reload
- Check config location: `echo $STARSHIP_CONFIG` (should be `~/.config/starship.toml`)

**Colors look wrong:**
- Ensure terminal supports 24-bit color
- Check Ghostty theme is set: `theme = /path/to/forestflower/extras/ghostty/forestflower`
