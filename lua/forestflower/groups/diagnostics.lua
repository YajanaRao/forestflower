---Diagnostic highlight groups (LSP diagnostics, signs, floats).

local highlights = require("forestflower.core.highlights")
local util = require("forestflower.util")

---@param p table palette
---@param config ForestflowerConfig
---@return Highlights
return function(p, config)
  local create = highlights.create
  local link = highlights.link
  local styles = highlights.styles

  -- Container backgrounds are derived from the foreground tinted into the canvas.
  -- Themes don't carry an explicit `*_container` slot; this keeps role surface minimal
  -- and lets the blend rule stay consistent across future themes.
  local function container(fg)
    return util.blend(fg, 0.18, p.canvas)
  end

  local error_bg = config.diagnostic_text_highlight and container(p.error) or p.none
  local warn_bg = config.diagnostic_text_highlight and container(p.warning) or p.none
  local info_bg = config.diagnostic_text_highlight and container(p.info) or p.none
  local hint_bg = config.diagnostic_text_highlight and container(p.hint) or p.none

  return {
    -- Diagnostic text
    DiagnosticError = create(p.error, error_bg),
    DiagnosticWarn = create(p.warning, warn_bg),
    DiagnosticInfo = create(p.info, info_bg),
    DiagnosticHint = create(p.hint, hint_bg),
    DiagnosticUnnecessary = create(p.subtle, p.none),

    -- Diagnostic virtual text
    DiagnosticVirtualTextError = link(config.diagnostic_virtual_text == "grey" and "Grey" or "Red"),
    DiagnosticVirtualTextWarn = link(config.diagnostic_virtual_text == "grey" and "Grey" or "Yellow"),
    DiagnosticVirtualTextInfo = link(config.diagnostic_virtual_text == "grey" and "Grey" or "Blue"),
    DiagnosticVirtualTextHint = link(config.diagnostic_virtual_text == "grey" and "Grey" or "Green"),

    -- Diagnostic underlines
    DiagnosticUnderlineError = create(p.error, error_bg, { styles.undercurl }, p.error),
    DiagnosticUnderlineWarn = create(p.warning, warn_bg, { styles.undercurl }, p.warning),
    DiagnosticUnderlineInfo = create(p.info, info_bg, { styles.undercurl }, p.info),
    DiagnosticUnderlineHint = create(p.hint, hint_bg, { styles.undercurl }, p.hint),

    -- Diagnostic signs
    DiagnosticSignError = link("RedSign"),
    DiagnosticSignWarn = link("YellowSign"),
    DiagnosticSignInfo = link("BlueSign"),
    DiagnosticSignHint = link("GreenSign"),

    -- Diagnostic floats
    DiagnosticFloatingError = link("ErrorFloat"),
    DiagnosticFloatingWarn = link("WarningFloat"),
    DiagnosticFloatingInfo = link("InfoFloat"),
    DiagnosticFloatingHint = link("HintFloat"),

    -- LSP
    LspInlayHint = link("InlayHints"),
    LspReferenceText = link("CurrentWord"),
    LspReferenceRead = link("CurrentWord"),
    LspReferenceWrite = link("CurrentWord"),
    LspCodeLens = link("VirtualTextInfo"),
    LspCodeLensSeparator = link("VirtualTextHint"),
    LspSignatureActiveParameter = link("Search"),

    -- Health check
    healthError = link("Red"),
    healthSuccess = link("Green"),
    healthWarning = link("Yellow"),
  }
end
