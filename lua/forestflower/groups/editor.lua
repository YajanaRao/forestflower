---Editor highlight groups + base color aliases.
---
---Base color groups (Red/Green/Blue/...) are defined here because other group
---files link to them. Keeping them in one place avoids ordering hazards.

local highlights = require("forestflower.core.highlights")
local util = require("forestflower.util")

---@param p table palette
---@param config ForestflowerConfig
---@return Highlights
return function(p, config)
    local create = highlights.create
    local link = highlights.link
    local styles = highlights.styles

    local sign_bg = config.sign_column_background == "none" and p.none or p.surface
    local statusline_bg = config.transparent_background and p.none or p.surface_deep
    local tab_fill_bg = config.transparent_background and p.none or p.canvas

    return {
        -- Core editor
        Normal = create(p.ink, config.transparent_background and p.none or p.canvas),
        NormalFloat = create(p.ink, config.float_style == "bright" and p.surface or p.surface_raised),
        NormalNC = create(p.ink, config.transparent_background and p.none or p.canvas),

        -- Cursor — spec: gold cursor (5px width set via guicursor in user config).
        Cursor = create(p.canvas, p.primary),
        lCursor = link("Cursor"),
        CursorIM = link("Cursor"),
        TermCursor = link("Cursor"),
        TermCursorNC = link("Cursor"),

        -- Selection
        Visual = create(p.none, p.selection),
        VisualNOS = link("Visual"),

        -- Line numbers — gutter sits on surface tier
        LineNr = create(p.muted, sign_bg),
        LineNrAbove = link("LineNr"),
        LineNrBelow = link("LineNr"),
        CursorLineNr = create(p.primary, sign_bg, { styles.bold }),

        -- Cursor line
        CursorLine = create(p.none, p.surface_raised),
        CursorColumn = create(p.none, p.surface),

        -- Search — all matches get a faint gold wash (pre-blended search_match,
        -- realising the find-match-bg @25% spec); the current/active match stays
        -- solid gold so the one you're on pops. Text keeps its syntax colour.
        Search = create(p.none, p.search_match),
        IncSearch = create(p.canvas, p.primary),
        CurSearch = link("IncSearch"),
        Substitute = create(p.canvas, p.primary),

        -- Status line — sits on surface_deep
        StatusLine = create(p.ink, statusline_bg),
        StatusLineNC = create(p.subtle, config.transparent_background and p.none or p.surface),

        -- Tabs
        TabLine = create(p.subtle, p.surface),
        TabLineFill = create(p.subtle, tab_fill_bg),
        -- TabLineSel — spec: 2px gold underline. Neovim renders underline as 1px sp; closest faithful approximation.
        TabLineSel = create(p.ink, p.surface_raised, { styles.bold, styles.underline }, p.primary),
        TabLineModified = create(p.primary, p.surface),
        TabLineSelModified = create(p.primary, p.surface_raised, { styles.bold }),
        TabLineClose = create(p.subtle, p.surface),
        TabLineSelClose = create(p.ink, p.surface_raised, { styles.bold }),

        -- Mini.tabline
        MiniTablineCurrent = create(p.ink, p.surface_raised, { styles.bold }),
        MiniTablineVisible = create(p.subtle, p.surface),
        MiniTablineHidden = create(p.subtle, p.surface),
        MiniTablineModifiedCurrent = create(p.primary, p.surface_raised, { styles.bold }),
        MiniTablineModifiedVisible = create(p.primary, p.surface),
        MiniTablineModifiedHidden = create(p.primary, p.surface),
        MiniTablineFill = create(p.subtle, tab_fill_bg),
        MiniTablineTabpagesection = create(p.subtle, p.surface),
        MiniTablineTrunc = create(p.subtle, p.surface),

        -- Windows
        WinBar = create(p.subtle, config.transparent_background and p.none or p.surface, { styles.bold }),
        WinBarNC = create(p.subtle, config.transparent_background and p.none or p.surface_raised),
        -- WinSeparator — spec: divide by darkness, not stroke color.
        WinSeparator = create(p.surface_deep, p.surface_deep),
        VertSplit = link("WinSeparator"),

        -- Borders
        FloatBorder = create(p.muted, config.float_style == "bright" and p.surface or p.surface_raised),
        FloatTitle = create(p.primary, config.float_style == "bright" and p.surface or p.surface_raised, { styles.bold }),

        -- End of buffer — render tilde column matching canvas
        EndOfBuffer = create(p.canvas, p.none),

        -- Messages
        ErrorMsg = create(p.error, p.none, { styles.bold, styles.underline }),
        WarningMsg = create(p.warning, p.none, { styles.bold }),
        ModeMsg = create(p.ink, p.none, { styles.bold }),
        MoreMsg = create(p.warning, p.none, { styles.bold }),
        Question = create(p.warning, p.none),

        -- Special
        SpecialKey = create(p.warning, p.none),
        NonText = create(p.subtle, p.none),
        Whitespace = create(p.subtle, p.none),

        -- Inline hints — container computed once via blend so themes don't carry it
        InlayHints = create(p.hint, p.surface),

        Directory = create(p.success, p.none),
        -- Title — DESIGN: gold is chrome-only. Headings route to syntax_keyword.
        Title = create(p.syntax_keyword, p.none, { styles.bold }),

        -- Folding
        Folded = create(p.subtle, config.transparent_background and p.none or p.surface),
        FoldColumn = create(p.muted, sign_bg),

        -- Signs
        SignColumn = create(p.ink, sign_bg),

        -- Popup menu
        Pmenu = create(p.ink, p.surface_raised),
        PmenuSel = create(p.selection, p.canvas, { styles.reverse }),
        PmenuKind = link("Pmenu"),
        PmenuKindSel = create(p.selection, p.canvas, { styles.reverse }),
        PmenuExtra = link("Pmenu"),
        PmenuExtraSel = create(p.selection, p.canvas, { styles.reverse }),
        -- PmenuMatch — substring match is find-match family (chrome gold).
        PmenuMatch = create(p.primary, p.surface_raised, { styles.bold }),
        PmenuMatchSel = create(p.primary, p.canvas, { styles.bold, styles.reverse }),
        PmenuSbar = create(p.none, p.surface_raised),
        PmenuThumb = create(p.none, p.surface_raised),
        WildMenu = link("PmenuSel"),

        -- Quick fix
        QuickFixLine = create(p.syntax_regex, p.none, { styles.bold }),

        -- Match paren — spec: gold border at rounded.sm, outline only.
        -- Neovim has no per-character border; bold+underline gold is the closest.
        MatchParen = create(p.primary, p.none, { styles.bold, styles.underline }),

        -- Conceal
        Conceal = create(p.subtle, p.none),

        -- Color column
        ColorColumn = create(p.none, p.surface_raised),

        -------------------------------------------------------------------------
        -- Base color aliases — referenced by every other groups/ file.
        -- These names are historical (Red/Green/Blue/...). Mapping uses semantic
        -- palette roles, not literal hue names.
        -------------------------------------------------------------------------
        Red = create(p.error, p.none),
        Orange = create(p.warning, p.none),
        Yellow = create(p.warning, p.none),
        Green = create(p.success, p.none),
        Aqua = create(p.syntax_string, p.none),
        Blue = create(p.info, p.none),
        Purple = create(p.syntax_regex, p.none),
        Grey = create(p.subtle, p.none),

        RedBold = create(p.error, p.none, { styles.bold }),
        OrangeBold = create(p.warning, p.none, { styles.bold }),
        YellowBold = create(p.warning, p.none, { styles.bold }),
        GreenBold = create(p.success, p.none, { styles.bold }),
        AquaBold = create(p.syntax_string, p.none, { styles.bold }),
        BlueBold = create(p.info, p.none, { styles.bold }),
        PurpleBold = create(p.syntax_regex, p.none, { styles.bold }),

        RedItalic = create(p.error, p.none, { styles.italic }),
        OrangeItalic = create(p.warning, p.none, { styles.italic }),
        YellowItalic = create(p.warning, p.none, { styles.italic }),
        GreenItalic = create(p.success, p.none, { styles.italic }),
        AquaItalic = create(p.syntax_string, p.none, { styles.italic }),
        BlueItalic = create(p.info, p.none, { styles.italic }),
        PurpleItalic = create(p.syntax_regex, p.none, { styles.italic }),

        -- Sign variants — used by gitsigns / diagnostic signs
        RedSign = create(p.error, sign_bg),
        OrangeSign = create(p.warning, sign_bg),
        YellowSign = create(p.warning, sign_bg),
        GreenSign = create(p.success, sign_bg),
        AquaSign = create(p.syntax_string, sign_bg),
        BlueSign = create(p.info, sign_bg),
        PurpleSign = create(p.syntax_regex, sign_bg),

        -- Float variants — diagnostic floats
        ErrorFloat = create(p.error, config.float_style == "bright" and p.surface or p.surface_raised),
        WarningFloat = create(p.warning, config.float_style == "bright" and p.surface or p.surface_raised),
        InfoFloat = create(p.info, config.float_style == "bright" and p.surface or p.surface_raised),
        HintFloat = create(p.hint, config.float_style == "bright" and p.surface or p.surface_raised),

        -- Virtual text variants — code lens / inline annotations
        VirtualTextInfo = create(p.info, p.none),
        VirtualTextHint = create(p.hint, p.none),

        -- Diff base groups — sign-glyph fg sources + full-line/word backgrounds.
        -- Tints derive from semantic git_* hues blended into canvas so day/night
        -- adapt automatically. DiffDelete carries a real bg (core default omits it,
        -- which left mini.diff deleted lines unfilled).
        Added = create(p.git_add, p.none),
        Changed = create(p.git_change, p.none),
        Removed = create(p.git_delete, p.none),
        DiffAdd = create(p.none, util.blend(p.git_add, 0.22, p.canvas)),
        DiffDelete = create(p.none, util.blend(p.git_delete, 0.22, p.canvas)),
        DiffChange = create(p.none, util.blend(p.git_change, 0.14, p.canvas)),
        DiffText = create(p.none, util.blend(p.git_change, 0.30, p.canvas)),
    }
end
