---Snacks, Trouble, and Noice highlight groups.

local highlights = require("forestflower.core.highlights")

---@param p table palette
---@param config ForestflowerConfig
---@return Highlights
return function(p, config)
  local create = highlights.create
  local link = highlights.link
  local styles = highlights.styles

  local float_bg = config.float_style == "bright" and p.surface or p.surface_raised
  local sidebar_bg = config.transparent_background and p.none or p.surface

  return {
    -------------------------------------------------------------------------
    -- Snacks Explorer
    -------------------------------------------------------------------------
    SnacksExplorerNormal = create(p.ink, sidebar_bg),
    SnacksExplorerBorder = create(p.surface, sidebar_bg),
    SnacksExplorerTitle = create(p.primary, sidebar_bg, { styles.bold }),
    SnacksExplorerFile = create(p.ink, sidebar_bg),
    SnacksExplorerDirectory = link("Directory"),
    SnacksExplorerSymlink = create(p.syntax_string, sidebar_bg),
    SnacksExplorerHidden = create(p.ink, sidebar_bg),
    SnacksExplorerDim = create(p.subtle, sidebar_bg),
    SnacksExplorerGitIgnored = create(p.git_ignored, sidebar_bg),
    SnacksExplorerGitUntracked = create(p.success, sidebar_bg, { styles.bold }),
    SnacksExplorerGitModified = create(p.warning, sidebar_bg),
    SnacksExplorerGitDeleted = create(p.error, sidebar_bg),
    SnacksExplorerGitRenamed = create(p.info, sidebar_bg),
    SnacksExplorerGitStaged = create(p.syntax_string, sidebar_bg),
    SnacksExplorerGitConflict = create(p.git_conflict, sidebar_bg, { styles.bold }),
    SnacksExplorerSelection = create(p.primary, p.none, { styles.bold }),
    SnacksExplorerCursorLine = create(p.none, p.surface_raised),
    SnacksExplorerSearch = link("Search"),
    SnacksExplorerMatch = link("IncSearch"),
    SnacksExplorerEndOfBuffer = link("EndOfBuffer"),
    SnacksExplorerIcon = create(p.subtle, sidebar_bg),

    -------------------------------------------------------------------------
    -- Snacks Picker
    -------------------------------------------------------------------------
    SnacksPickerNormal = create(p.ink, float_bg),
    SnacksPickerBorder = create(p.muted, float_bg),
    SnacksPickerTitle = create(p.primary, float_bg, { styles.bold }),
    SnacksPickerPrompt = create(p.ink, float_bg),
    SnacksPickerPromptPrefix = link("TelescopePromptPrefix"),
    SnacksPickerQuery = create(p.primary, float_bg),
    SnacksPickerFilter = create(p.syntax_string, float_bg),
    SnacksPickerSelection = create(p.canvas, p.selection),
    -- Substring matches are find-match family (chrome gold).
    SnacksPickerMatch = create(p.primary, p.none, { styles.bold }),
    SnacksPickerList = create(p.ink, float_bg),
    SnacksPickerCurrent = create(p.primary, float_bg),
    SnacksPickerIndex = create(p.ink, float_bg),
    SnacksPickerFooter = create(p.ink, float_bg),
    SnacksPickerScrollbar = create(p.none, float_bg),
    SnacksPickerScrollbarThumb = create(p.none, p.surface_raised),

    -------------------------------------------------------------------------
    -- trouble.nvim
    -------------------------------------------------------------------------
    TroubleNormal = create(p.ink, sidebar_bg),
    TroubleText = create(p.ink, sidebar_bg),
    TroubleFile = create(p.syntax_string, sidebar_bg),
    TroubleCount = create(p.canvas, p.syntax_regex, { styles.bold }),
    TroubleIndent = create(p.subtle, config.transparent_background and p.none or p.surface_raised),
    TroubleLocation = create(p.subtle, config.transparent_background and p.none or p.surface_raised),
    TroubleLineNumber = create(p.primary, config.transparent_background and p.none or p.surface_raised),
    TroubleFoldIcon = create(p.subtle, config.transparent_background and p.none or p.surface_raised),
    TroubleCode = create(p.subtle, p.surface_raised),
    TroublePreview = create(p.ink, p.surface_raised, { styles.bold }),
    TroubleSource = create(p.subtle, config.transparent_background and p.none or p.surface_raised),
    TroubleError = link("Red"),
    TroubleWarning = link("Yellow"),
    TroubleHint = link("Blue"),
    TroubleInformation = link("Green"),
    TroubleSignError = link("RedSign"),
    TroubleSignWarning = link("YellowSign"),
    TroubleSignHint = link("BlueSign"),
    TroubleSignInformation = link("GreenSign"),

    -------------------------------------------------------------------------
    -- noice.nvim
    -------------------------------------------------------------------------
    NoiceConfirm = create(p.ink, float_bg),
    NoiceConfirmBorder = create(p.muted, float_bg),
    NoiceConfirmTitle = create(p.primary, float_bg, { styles.bold }),
    NoiceCmdline = create(p.ink, float_bg),
    NoiceCmdlineIcon = create(p.syntax_string, float_bg),
    NoiceCmdlinePopup = create(p.ink, float_bg),
    NoiceCmdlinePopupBorder = create(p.muted, float_bg),
    NoiceCmdlinePrompt = create(p.warning, float_bg),
    NoiceMini = create(p.ink, float_bg),
    NoicePopup = create(p.ink, float_bg),
    NoicePopupBorder = create(p.muted, float_bg),
    NoicePopupmenu = create(p.ink, p.surface_raised),
    NoicePopupmenuBorder = create(p.muted, p.surface_raised),
    NoicePopupmenuSelected = create(p.canvas, p.selection),
    NoiceScrollbar = create(p.none, float_bg),
    NoiceScrollbarThumb = create(p.none, p.surface_raised),
    NoiceVirtualText = create(p.subtle, float_bg),
    NoiceFormatProgressDone = create(p.success, float_bg),
    NoiceFormatProgressTodo = create(p.subtle, float_bg),
    NoiceFormatProgressBar = create(p.primary, float_bg),
    NoiceLspProgressSpinner = create(p.warning, float_bg),
    NoiceLspProgressClient = create(p.syntax_string, float_bg),
    NoiceLspProgressTitle = create(p.primary, float_bg, { styles.bold }),
  }
end
