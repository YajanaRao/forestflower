---Plugin highlight groups (third-party integrations).

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

  return {
    -- Telescope — fuzzy substring matches are find-match family (chrome gold).
    TelescopeMatching = create(p.primary, p.none, { styles.bold }),
    TelescopeBorder = link("Grey"),
    TelescopePromptPrefix = link("Orange"),
    TelescopeSelection = link("Visual"),

    -- Which-key
    WhichKey = link("Red"),
    WhichKeyDesc = link("Blue"),
    WhichKeyFloat = create(p.none, p.surface),
    WhichKeyGroup = link("Yellow"),
    WhichKeySeparator = link("Green"),
    WhichKeyValue = create(p.ink, p.none),

    -- Flash — labels/matches are chrome navigation aids → gold.
    FlashBackdrop = create(p.subtle, p.none),
    FlashLabel = create(p.primary, p.none, { styles.bold, styles.italic }),
    FlashMatch = create(p.primary, p.none, { styles.bold }),
    FlashCurrent = create(p.primary, p.none, { styles.bold }),

    -- Leap
    LeapMatch = create(p.ink, p.syntax_regex, { styles.bold }),
    LeapLabel = create(p.syntax_regex, p.none, { styles.bold }),
    LeapBackdrop = create(p.subtle, p.none),

    -- Indent guides — DESIGN: default at surface_raised, active scope at primary (gold).
    IblScope = create(p.primary, p.none, { styles.nocombine }),
    IblIndent = create(p.surface_raised, p.none, { styles.nocombine }),
    IndentBlanklineContextChar = link("IblScope"),
    IndentBlanklineChar = link("IblIndent"),
    IndentBlanklineSpaceChar = link("IndentBlanklineChar"),
    IndentBlanklineSpaceCharBlankline = link("IndentBlanklineChar"),

    MiniDiffSignAdd = create(p.git_add, sign_bg),
    MiniDiffSignChange = create(p.git_change, sign_bg),
    MiniDiffSignDelete = create(p.git_delete, sign_bg),
    MiniDiffOverChangeBuf = create(p.none, util.blend(p.git_add, 0.30, p.canvas)),

    -- mini.indentscope
    MiniIndentscopeSymbol = create(p.primary, p.none, { styles.nocombine }),
    MiniIndentscopeSymbolOff = create(p.surface_raised, p.none, { styles.nocombine }),

    -- snacks.indent
    SnacksIndent = create(p.surface_raised, p.none, { styles.nocombine }),
    SnacksIndentScope = create(p.primary, p.none, { styles.nocombine }),
    SnacksIndentChunk = create(p.primary, p.none, { styles.nocombine }),

    -- Navic
    NavicText = create(p.ink, p.none),
    NavicSeparator = create(p.ink, p.none),

    -- Notify
    NotifyBackground = create(p.none, p.canvas),
    NotifyDEBUGBorder = link("Grey"),
    NotifyERRORBorder = link("Red"),
    NotifyINFOBorder = link("Green"),
    NotifyTRACEBorder = link("Purple"),
    NotifyWARNBorder = link("Yellow"),
    NotifyDEBUGIcon = link("Grey"),
    NotifyERRORIcon = link("Red"),
    NotifyINFOIcon = link("Green"),
    NotifyTRACEIcon = link("Purple"),
    NotifyWARNIcon = link("Yellow"),
    NotifyDEBUGTitle = link("Grey"),
    NotifyERRORTitle = link("Red"),
    NotifyINFOTitle = link("Green"),
    NotifyTRACETitle = link("Purple"),
    NotifyWARNTitle = link("Yellow"),

    -- Incline
    InclineNormalNC = create(p.subtle, p.surface_raised),

    -- Bufferline
    BufferLineIndicatorSelected = link("GreenSign"),

    -- Scrollbar
    ScrollbarHandle = create(p.none, p.surface),
    ScrollbarSearchHandle = create(p.primary, p.surface),
    ScrollbarSearch = link("Yellow"),
    ScrollbarErrorHandle = create(p.error, p.surface),
    ScrollbarError = link("Red"),
    ScrollbarWarnHandle = create(p.warning, p.surface),
    ScrollbarWarn = link("Yellow"),
    ScrollbarInfoHandle = create(p.info, p.surface),
    ScrollbarInfo = link("Green"),
    ScrollbarHintHandle = create(p.info, p.surface),
    ScrollbarHint = link("Blue"),
    ScrollbarMiscHandle = create(p.syntax_regex, p.surface),
    ScrollbarMisc = link("Purple"),

    -- Yanky
    YankyPut = link("IncSearch"),
    YankyYanked = link("IncSearch"),

    -- Highlighted yank
    HighlightedyankRegion = link("Visual"),

    -- Current word
    CurrentWord = create(p.none, p.none, { styles.bold }),
    CurrentWordTwins = link("CurrentWord"),

    -- Illuminate
    IlluminatedWordText = link("CurrentWord"),
    IlluminatedWordRead = link("CurrentWord"),
    IlluminatedWordWrite = link("CurrentWord"),

    -- Quick scope
    QuickScopePrimary = create(p.syntax_string, p.none, { styles.underline }),
    QuickScopeSecondary = create(p.info, p.none, { styles.underline }),
  }
end
