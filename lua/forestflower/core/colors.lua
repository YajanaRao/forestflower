---Core color system for Forest Flower colorscheme
---Defines the base color palette and semantic color tokens
---
---BRAND IDENTITY:
---  Nature-inspired colorscheme for mindful programming
---  For developers who code in long sessions and value eye health
---
---CORE VALUES:
---  • Mindful Focus: Conscious, relaxed, sustained attention
---  • Health-First: Warm tones reduce eye strain (8+ hour sessions)
---  • Nature-Inspired: Colors from flowers, plants, twilight skies
---  • Timeless Simplicity: Minimum noise, maximum clarity
---
---COLOR ARCHITECTURE:
---  UI Palette = Environment (sky, earth, natural light)
---  Syntax Tokens = Flora (flower-inspired, vibrant yet organic)
---
---DESIGN CONSTRAINTS:
---  ✅ Natural colors only (no neon, electric, corporate branding)
---  ✅ Warm golden undertones (twilight-range temperature)
---  ✅ Sustainable contrast (health over maximum pop)
---  ✅ Timeless over trendy (resist UI fads)

---@class ColorPalette
---@field primary string
---@field primary_container string
---@field secondary string
---@field secondary_container string
---@field tertiary string
---@field tertiary_container string
---@field error string
---@field error_container string
---@field success string
---@field success_container string
---@field warning string
---@field warning_container string
---@field info string
---@field info_container string
---@field hint string
---@field hint_container string
---@field background string
---@field on_background string
---@field surface string
---@field on_surface string
---@field surface_variant string
---@field on_surface_variant string
---@field outline string
---@field outline_variant string
---@field terminal table<string, string>
---@field none string

---@class SyntaxTokens
---@field keyword string
---@field operator string
---@field function string
---@field method string
---@field type string
---@field interface string
---@field enum string
---@field constant string
---@field number string
---@field boolean string
---@field string string
---@field variable string
---@field parameter string
---@field property string
---@field field string
---@field namespace string
---@field comment string
---@field punctuation string
---@field macro string
---@field special string
---@field todo string
---@field hint string
---@field info string
---@field warn string
---@field error string
---@field jsx_component string

local M = {}

---Night palette - Twilight tones optimized for long coding sessions
M.palettes = {
  night = {
    -- Primary: Forest greenery (living, growing)
    primary = "#b4d494",
    primary_container = "#2d4d3a",

    -- Secondary: Sky at twilight (clear, spacious)
    secondary = "#7fbbb3",
    secondary_container = "#2d4d4a",

    -- Tertiary: Sunset/flower tones (warm, delicate)
    tertiary = "#d699b6",
    tertiary_container = "#4d3d4a",

    -- Semantic colors
    error = "#f85552",
    error_container = "#4d2d3a",
    success = "#b4d494",
    success_container = "#2d4d3a",
    warning = "#d9a85f",
    warning_container = "#4d4a2d",
    info = "#7fbbb3",
    info_container = "#2d4d4a",
    hint = "#5a5f6f",
    hint_container = "#1a1e23",

    -- Surfaces: Forest floor to canopy layering
    background = "#101010", -- Deep earth with warm undertone
    on_background = "#e6e1cf", -- Warm natural light
    surface = "#1e2326", -- Forest floor
    on_surface = "#d3c6aa", -- Filtered sunlight
    surface_variant = "#252a30", -- Elevated surface (dappled light)
    on_surface_variant = "#8a8a7a", -- Muted secondary text

    -- Borders & outlines (enhanced for gentle brutalism)
    outline = "#2d3239", -- Darker, more defined
    outline_variant = "#32373d", -- Increased definition
    border_strong = "#42474f", -- New: prominent borders for brutal style

    -- Terminal colors (matches OpenCode theme)
    terminal = {
      black = "#3a3f47",
      black_bright = "#6e6a86",
      red = "#eb6f92",
      red_bright = "#f85552",
      green = "#a7c080",
      green_bright = "#b4d494",
      yellow = "#d9a85f",
      yellow_bright = "#dfa97a",
      blue = "#7fbbb3",
      blue_bright = "#8fb4b3",
      magenta = "#c4a7e7",
      magenta_bright = "#d699b6",
      cyan = "#7fbbb3",
      cyan_bright = "#9ab8b5",
      white = "#d3c6aa",
      white_bright = "#e0def4",
    },

    none = "NONE",
  },
  day = {
    -- Primary: Sunlit greenery (vibrant, alive)
    primary = "#8da101",
    primary_container = "#e8f5d5",

    -- Secondary: Warm sky blue (not corporate blue)
    secondary = "#5a9bb3",
    secondary_container = "#d5e8f5",

    -- Tertiary: Flower pink (warm, natural)
    tertiary = "#df69ba",
    tertiary_container = "#f5d5e8",

    -- Semantic colors
    error = "#f85552",
    error_container = "#f5d5d5",
    success = "#8da101",
    success_container = "#e8f5d5",
    warning = "#dfa000",
    warning_container = "#f5f0d5",
    info = "#5a9bb3",
    info_container = "#d5e8f5",
    hint = "#8a9199",
    hint_container = "#f8f5e4",

    -- Surfaces: Sunlit warm tones
    background = "#fffbef",
    on_background = "#2d3338",
    surface = "#f8f5e4",
    on_surface = "#2d3338",
    surface_variant = "#e8e5d0",
    on_surface_variant = "#5a5a5a",

    -- Borders & outlines (enhanced for gentle brutalism)
    outline = "#6b7280", -- Stronger definition
    outline_variant = "#9ca3af", -- More defined
    border_strong = "#4b5563", -- New: prominent borders for brutal style

    -- Terminal colors (matches OpenCode theme)
    terminal = {
      black = "#5a5a5a",
      black_bright = "#9ca3af",
      red = "#dc2626",
      red_bright = "#f85552",
      green = "#16a34a",
      green_bright = "#8da101",
      yellow = "#d97706",
      yellow_bright = "#dfa000",
      blue = "#5a9bb3",
      blue_bright = "#0891b2",
      magenta = "#7c3aed",
      magenta_bright = "#df69ba",
      cyan = "#0891b2",
      cyan_bright = "#0891b2",
      white = "#2d3338",
      white_bright = "#374151",
    },

    none = "NONE",
  },
}

---Syntax highlighting - Flora-inspired tokens
---Separate palettes for night (dark) and day (light) themes
M.syntax = {
  night = {
    -- Balanced brutalism: Optimized to 45-65% saturation sweet spot
    -- All colors now vibrant without harshness, addressing "too dull" feeling
    keyword = "#caaff0",      -- Kurinji purple 68% sat (distinctive bloom)
    operator = "#7ed4cf",     -- Warm sky blue 50% sat (twilight clarity)
    ["function"] = "#e0b36e", -- Deep champak gold 65% sat (warm, rich)
    method = "#e0b36e",       -- Deep champak gold 65% sat
    type = "#80cfba",         -- Warm sage 45% sat (clear structure)
    interface = "#80cfba",    -- Warm sage 45% sat
    enum = "#80cfba",         -- Warm sage 45% sat
    constant = "#f0a5a2",     -- Hibiscus coral 72% sat (stands out)
    number = "#f0a5a2",       -- Hibiscus coral 72% sat
    boolean = "#f0a5a2",      -- Hibiscus coral 72% sat
    string = "#b4d580",       -- Forest green 50% sat (vibrant foundation)
    variable = "#e0def4",     -- Jasmine white (optimal contrast)
    parameter = "#a4dfa4",    -- Warm mint 48% sat (fresh, green-leaning)
    property = "#a2dcc6",     -- Warm morning mist 45% sat (clear, distinct)
    field = "#e0def4",        -- Jasmine white
    namespace = "#e69462",    -- Sunset orange 60% sat (vibrant, distinct)
    comment = "#6e6a86",      -- Twilight gray (unchanged for readability)
    punctuation = "#a3bfbc",  -- Warm rain 35% sat (connective, subtle)
    macro = "#e5b485",        -- Sunset orange 58% sat (between gold and coral)
    special = "#a3bfbc",      -- Warm rain 35% sat
    todo = "#e0b36e",         -- Deep champak gold 65% sat (attention)
    hint = "#a3bfbc",         -- Warm rain 35% sat
    info = "#a3bfbc",         -- Warm rain 35% sat
    warn = "#e0b36e",         -- Deep champak gold 65% sat
    error = "#eb6f92",        -- Rose red (unchanged for alerts)
    jsx_component = "#e38484", -- Coral 68% sat (React component)
  },
  day = {
    keyword = "#7c3aed",      -- Deep purple (high contrast, distinctive)
    operator = "#0891b2",     -- Cyan-700 (clear, functional)
    ["function"] = "#d97706", -- Amber-600 (warm, inviting)
    method = "#d97706",       -- Amber-600
    type = "#059669",         -- Emerald-600 (stable, structural)
    interface = "#059669",    -- Emerald-600
    enum = "#059669",         -- Emerald-600
    constant = "#dc2626",     -- Red-600 (stands out clearly)
    number = "#dc2626",       -- Red-600
    boolean = "#dc2626",      -- Red-600
    string = "#16a34a",       -- Green-600 (natural, foundational)
    variable = "#374151",     -- Gray-700 (readable, neutral)
    parameter = "#059669",    -- Emerald-600 (fresh, clear)
    property = "#0891b2",     -- Cyan-600 (distinct from variables)
    field = "#374151",        -- Gray-700
    namespace = "#ea580c",    -- Orange-600 (warm, distinct)
    comment = "#9ca3af",      -- Gray-400 (subdued but readable)
    punctuation = "#6b7280",  -- Gray-500 (present, connective)
    macro = "#f59e0b",        -- Amber-500 (attention-getting)
    special = "#0891b2",      -- Cyan-600
    todo = "#d97706",         -- Amber-600 (attention)
    hint = "#6b7280",         -- Gray-500
    info = "#0891b2",         -- Cyan-600
    warn = "#d97706",         -- Amber-600
    error = "#dc2626",        -- Red-600 (alert, clear)
    jsx_component = "#dc2626", -- Red-600 (React component, distinct)
  },
}

return M
