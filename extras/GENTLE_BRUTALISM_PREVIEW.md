# Gentle Brutalism Color Preview

## What Changed in Extras

### Ghostty Terminal Theme

The Ghostty theme now reflects the gentle brutalism enhancements with **10-12% more vibrant colors** while maintaining warm undertones.

#### Night Theme Visual Changes

**Syntax Colors** (What you'll see in code):
- **Purple** (keywords): `#c4a7e7` → `#caaff0` (+10% brighter)
- **Gold** (functions): `#d9a85f` → `#e0b36e` (+12% richer)
- **Green** (strings): `#a7c080` → `#b1c88d` (+10% fresher)
- **Coral** (numbers): `#ea9a97` → `#f0a5a2` (+10% bolder)
- **Sage** (types): `#89b4a8` → `#93bcb1` (+10% clearer)

**UI Elements**:
- **Border**: `#3d4247` → `#42474f` (stronger, more defined)
- **Black/Terminal**: `#3a3f47` → `#2d3239` (darker, more prominent)

#### Day Theme Changes

**UI Elements**:
- **Border**: `#8a9199` → `#6b7280` (stronger definition)
- **Border Strong**: Added `#4b5563` (new prominent border)

### OpenCode Theme

Updated JSON definitions to match the enhanced palette:

**Enhanced Colors**:
- `purple`/`magenta`: `#c4a7e7` → `#caaff0`
- `orange`/`yellow`: `#d9a85f` → `#e0b36e`
- `green`: `#a7c080` → `#b1c88d`
- `blue1` (types): `#89b4a8` → `#93bcb1`
- `blue2` (operators): `#8fb4b3` → `#97bbb9`
- `blue5` (punctuation): `#9ab8b5` → `#a3bfbc`

**Rainbow Brackets** (Updated):
```
rainbow_1: #7fbbb3 (unchanged - blue)
rainbow_2: #d9a85f → #e0b36e (gold +12%)
rainbow_3: #a7c080 → #b1c88d (green +10%)
rainbow_4: #89b4a8 → #93bcb1 (sage +10%)
rainbow_5: #c4a7e7 → #caaff0 (purple +10%)
rainbow_6: #d699b6 (unchanged - pink)
rainbow_7: #e08856 → #e69462 (orange +10%)
rainbow_8: #ea9a97 → #f0a5a2 (coral +10%)
```

**New Border System**:
- Added `border_strong`: `#42474f` (night) / `#4b5563` (day)
- Updated `border`: `#3a3f47` → `#2d3239` (night) / `#8a9199` → `#6b7280` (day)

## How Ghostty Will Look

### Before (Original Forest Flower Night)
```
Keyword:   #c4a7e7  ████  Soft purple
Function:  #d9a85f  ████  Muted gold
String:    #a7c080  ████  Forest green
Number:    #ea9a97  ████  Soft coral
Type:      #89b4a8  ████  Warm sage
Border:    #3a3f47  ████  Subtle gray
```

### After (Gentle Brutalism Enhanced)
```
Keyword:   #caaff0  ████  Brighter purple ⬆️ +10%
Function:  #e0b36e  ████  Richer gold ⬆️ +12%
String:    #b1c88d  ████  Fresher green ⬆️ +10%
Number:    #f0a5a2  ████  Bolder coral ⬆️ +10%
Type:      #93bcb1  ████  Clearer sage ⬆️ +10%
Border:    #42474f  ████  Stronger gray ⬆️ More defined
```

## Visual Impact in Ghostty

When you use the updated Ghostty theme, you'll notice:

1. **Syntax Colors** - Code feels more vibrant and confident
   - Keywords (`local`, `function`, `if`) pop more with brighter purple
   - Function names glow with richer gold
   - Strings feel fresher with enhanced green
   - Numbers/booleans stand out with bolder coral

2. **UI Elements** - Terminal chrome is more defined
   - Borders are stronger and more visible
   - Better visual separation between panes
   - Selection backgrounds maintain warmth

3. **Rainbow Brackets** - More distinct color hierarchy
   - Each bracket level has enhanced saturation
   - Easier to track nesting depth visually

## Testing the Ghostty Theme

To see the changes in Ghostty:

1. **Copy the theme**:
   ```bash
   cp extras/ghostty/forestflower-night ~/.config/ghostty/themes/
   ```

2. **Update your Ghostty config**:
   ```toml
   theme = forestflower-night
   ```

3. **Restart Ghostty** or reload config

4. **Compare**: Open the same file side-by-side with old theme to see the difference

## Philosophy

The gentle brutalism enhancements bring:
- ✅ **10-12% more saturation** = Colors feel confident without being harsh
- ✅ **Stronger borders** = Better visual structure
- ✅ **Enhanced contrast** = Improved readability
- ✅ **Warm undertones preserved** = Still feels organic and natural
- ✅ **Eye health maintained** = Sustainable for 8+ hour sessions

Think of it as **"Forest Flower with more confidence"** - the same warm, nature-inspired palette but with slightly bolder expression, like flowers in full bloom versus early buds.
