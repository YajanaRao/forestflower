---
version: alpha
name: Forest Flower

schemes:
  dark:
    surface:
      recessed2: "#1D2226" # title/status bar; also the 1px divider (border)
      recessed1: "#232A2E" # sidebar, gutter, tab bar
      base: "#2D353B" # the content plane (editor)
      raised: "#3D484D" # current line, hover, floats
      overlay: "#475258" # popups, dialogs, toasts (+2)
    ink:
      primary: "#D3C6AA" # body / default fg                          (AA)
      secondary: "#A6B0A0" # filenames, headings — read                 (AA)
      comment: "#969E95" # comments, inactive labels — read           (AA)
      faint: "#7A8478" # line numbers, operators — locate     (AA-exempt)
      on_action: "#1D2226" # text/icon on an accent.action fill
    accent:
      action: "#FFC600" # scarce "act here / you are here"
      action_container: "#403319"
      resting: "#BEC97E" # passive identity (normal mode, branch)
      resting_container: "#3A5A40"
    # Status — outcome / condition
    status:
      danger: "#F89A8A"
      warning: "#F9AE77"
      success: "{accent.resting}" # = #BEC97E
      info: "#92BFDB"
    state:
      selection: "#50594B" # blend(accent.resting, 0.24, surface.base)
      match_all: "#62592C" # blend(accent.action,  0.25, surface.base)
      active: "{accent.action}" # the current match among many
      hover: "{surface.raised}"
      disabled: "{ink.faint}"
    code:
      keyword: "#A0AF54"
      operator: "#878580" # constant — recedes on every line
      function: "#EC8B49"
      string: "#5ABDAC"
      type: "#66A0C8"
      tag: "#E47DA8"
      regex: "#A699D0"
      number: "{code.regex}"
      variable: "{ink.primary}"
      punctuation: "{ink.comment}"
      comment: "{ink.comment}"
    # Domain — diff (git) = the status family
    diff:
      add: "{status.success}"
      change: "{status.warning}"
      delete: "{status.danger}"
      untracked: "{status.info}"
      ignored: "{ink.comment}"
      conflict: "{code.tag}"
      add_bg: "#4D564A"
      change_bg: "#5A5048"
      delete_bg: "#5A4B4C"
    # Domain — terminal ANSI (Flexoki dark)
    terminal:
      ansi:
        black: "#1D2226"
        red: "#D14D41"
        green: "#879A39"
        yellow: "#D0A215"
        blue: "#4385BE"
        magenta: "#CE5D97"
        cyan: "#3AA99F"
        white: "#D3C6AA"
        bright_black: "#575653"
        bright_red: "#E8705F"
        bright_green: "#A0AF54"
        bright_yellow: "#ECCB60"
        bright_blue: "#66A0C8"
        bright_magenta: "#E47DA8"
        bright_cyan: "#5ABDAC"
        bright_white: "#FFFFFF"
  light:
    surface:
      recessed2: "#EFEBD4"
      recessed1: "#F4F0D9"
      base: "#FDF6E3"
      raised: "#E6E2CC"
      overlay: "#DEDAC2"
    ink:
      primary: "#5C6A72"
      secondary: "#606D5C"
      comment: "#829181"
      faint: "#A6B0A0"
      on_action: "#FDF6E3"
    accent:
      action: "#6F5800"
      action_container: "#FBE8D3"
      resting: "#4D6B0E"
      resting_container: "#E1E0C1"
    status:
      danger: "#942822"
      warning: "#9B4A0F"
      success: "{accent.resting}" # = #4D6B0E
      info: "#1A4F8C"
    state:
      selection: "#D3D5B0"
      match_all: "#DACFAA"
      active: "{accent.action}"
      hover: "{surface.raised}"
      disabled: "{ink.faint}"
    code:
      keyword: "#66800B"
      operator: "#878580"
      function: "#BC5215"
      string: "#24837B"
      type: "#205EA6"
      tag: "#A02F6F"
      regex: "#5E409D"
      number: "{code.regex}"
      variable: "{ink.primary}"
      punctuation: "{ink.comment}"
      comment: "{ink.comment}"
    diff:
      add: "{status.success}"
      change: "{status.warning}"
      delete: "{status.danger}"
      untracked: "{status.info}"
      ignored: "{ink.comment}"
      conflict: "{code.tag}"
      add_bg: "#D6D7B4"
      change_bg: "#E7D0B4"
      delete_bg: "#E6C9B9"
    terminal:
      ansi:
        black: "#1C1B1A"
        red: "#AF3029"
        green: "#66800B"
        yellow: "#AD8301"
        blue: "#205EA6"
        magenta: "#A02F6F"
        cyan: "#24837B"
        white: "#5C6A72"
        bright_black: "#6F6E69"
        bright_red: "#C03E1D"
        bright_green: "#879A39"
        bright_yellow: "#D0A215"
        bright_blue: "#4385BE"
        bright_magenta: "#CE5D97"
        bright_cyan: "#3AA99F"
        bright_white: "#FDF6E3"

constant:
  - code.operator # "#878580" in both schemes
  - none # "NONE" (Neovim "no colour")

typography:
  editor:
    fontFamily: "JetBrains Mono, Operator Mono, Menlo, Monaco, Courier New, monospace"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.65
    letterSpacing: 0.5px
  ui:
    fontFamily: "-apple-system, BlinkMacSystemFont, Inter, IBM Plex Sans, Segoe UI, Helvetica, Arial, sans-serif"
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.5
  content:
    fontFamily: "Fraunces, Newsreader, Source Serif 4, Georgia, Cambria, Times New Roman, serif"
    fontSize: 18px
    fontWeight: 400
    lineHeight: 1.7
  heading:
    fontFamily: "Fraunces, Newsreader, Georgia, serif"
    fontWeight: 800
    fontStyle: italic

rounded:
  none: 0px
  sm: 3px
  md: 6px
  lg: 10px
  full: 9999px

spacing:
  xs: 4px
  sm: 8px
  md: 12px
  lg: 16px
  xl: 24px
  xxl: 32px

components:
  editor:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"

  titlebar:
    backgroundColor: "{colors.surface-deep}"
    textColor: "{colors.subtle}"

  sidebar:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.muted-strong}"

  sidebar-file-active:
    backgroundColor: "{colors.surface-raised}"
    textColor: "{colors.ink}"

  sidebar-file-modified:
    textColor: "{colors.primary}"

  sidebar-file-new:
    textColor: "{colors.success}"

  sidebar-file-deleted:
    textColor: "{colors.error}"

  tab-bar:
    backgroundColor: "{colors.surface}"

  tab-active:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    borderBottomColor: "{colors.primary}"
    borderBottomWidth: 2px

  tab-inactive:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.subtle}"

  gutter:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.muted}"

  cursor:
    color: "{colors.primary}"
    width: 5px
    style: line
    blink: solid

  line-highlight:
    backgroundColor: "{colors.highlight-line}"

  selection:
    backgroundColor: "{colors.selection}"

  indent-guide:
    color: "{colors.surface-raised}"
    activeColor: "{colors.primary}"

  status-bar:
    backgroundColor: "{colors.surface-deep}"
    textColor: "{colors.subtle}"

  status-bar-branch:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.primary}"
    rounded: "{rounded.sm}"
    padding: "2px 8px"

  status-bar-branch-feature:
    textColor: "{colors.success}"

  bracket-match:
    borderColor: "{colors.primary}"
    rounded: "{rounded.sm}"

  find-match:
    backgroundColor: "{colors.find-match-bg}"
    borderColor: "{colors.primary}"

  find-match-highlight:
    backgroundColor: "{colors.find-match-hl-bg}"

  panel:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"

  terminal:
    backgroundColor: "{colors.surface-deep}"
    textColor: "{colors.ink}"
    cursorColor: "{colors.primary}"

  scrollbar-thumb:
    backgroundColor: "{colors.surface-raised}"

  scrollbar-thumb-hover:
    backgroundColor: "{colors.muted}"

  minimap:
    backgroundColor: "{colors.surface}"

  diagnostic-error:
    color: "{colors.error}"

  diagnostic-warning:
    color: "{colors.warning}"

  diagnostic-info:
    color: "{colors.info}"

  diagnostic-hint:
    color: "{colors.hint}"
---

## Overview

Forest Flower is a code editor theme built on a single contrast philosophy:
warm surfaces underneath, calm inky tokens on top. It ships **light and dark
modes from one semantic token layer** — the tokens are defined once by role,
and only their resolved values flip between modes. Nothing else changes: the
same component tokens, the same typography, the same shapes, and the same
design principles drive both modes. The mode is a value swap, not a second
system.

The two modes mirror each other across the substrate:

- **Dark** — warm grey-green forest surfaces, brighter-tier syntax inks, and a
  single **warm gold** (`{colors.primary}` — #FFC600) chrome accent. The result
  feels like a forest at night lit by bioluminescence: the shell recedes, the
  code glows.
- **Light** — warm cream parchment surfaces, deeper-tier syntax inks, and a
  single **deep forest green** (#044123) chrome accent. The result feels like
  ink on aged paper: the shell recedes, the code reads.

Both modes obey the same chrome rule: the accent (`{colors.primary}`) carries
the cursor, active tab underline, branch name in the status bar, active indent
guide, lualine non-normal mode segments, modified file marker, bracket match
border, and find-match outline. The accent works as an outline, marker, or
cursor color — almost never as a broad background fill. The lualine normal
segment uses the success green (`{colors.success}`) as background with a
recessive foreground, signaling resting state and distinguishing NORMAL from
the accent-filled active-mutation cluster. The
accent appears exclusively in chrome, never in syntax. Its power comes from
that exclusivity.

The cursor is the accent (`{colors.primary}`), fat at 5px, and solid-blinking.
This is the single most visible element in the editor and the clearest
expression of the theme's identity — deliberate and immediately recognizable in
either mode.

**Key characteristics:**

- Single chrome identity per mode: gold (dark) / forest green (light) for every
  chrome accent. The lualine normal pill uses the success green `{colors.success}`
  to signal resting state, distinct from the accent-filled active-mutation cluster.
- Inky syntax — calm, perceptually-calibrated accents role-mapped to syntax
  tokens. Dark runs a brighter tier (for the darker canvas); light runs a deeper
  tier (for the cream canvas). Both land at WCAG AA against their canvas.
- Warm canvas in both modes: forest grey-green (dark) / parchment cream
  (light) — never cold, never pure neutral, never harsh white.
- Single cursor identity: accent cursor at 5px width. The fat cursor is
  intentional — it anchors the eye and feels confident.
- Comments fade, not disappear: `{colors.subtle}` keeps comments readable
  without competing with code, in both modes.

## Colors

Colors are defined once as **semantic tokens** (by role, not by value). Each
token resolves to a different value per mode, but the token _name_ — and every
component that references it — is mode-independent. The front matter `colors:`
block holds the **dark** values; the **Dark** column below repeats them and the
**Light** column gives the light-mode value for the same token.

> The intensity pattern inverts by substrate: dark mode needs _brighter_
> tokens to read against the forest canvas; light mode needs _deeper_ tokens to
> read against the cream canvas. Syntax flips 300→600; semantic flips 200→700.

### Token value table

| Token                | Role                                          | Light       | Dark        |
| -------------------- | --------------------------------------------- | ----------- | ----------- |
| `canvas`             | primary editor background                     | `#FDF6E3`   | `#2D353B`   |
| `surface`            | sidebar, tab bar, gutter, panels              | `#F4F0D9`   | `#232A2E`   |
| `surface-deep`       | title bar, status bar                         | `#EFEBD4`   | `#1D2226`   |
| `surface-raised`     | current line, hover, active rows              | `#E6E2CC`   | `#3D484D`   |
| `selection`          | text selection background                     | `#CAD8E2`   | `#3A5A40`   |
| `highlight-line`     | active line marker                            | `#E6E2CC`   | `#3D484D`   |
| `ink`                | default foreground / UI text                  | `#5C6A72`   | `#D3C6AA`   |
| `muted-strong`       | sidebar filenames & headings (readable, AA)   | `#606D5C`   | `#A6B0A0`   |
| `muted`              | line numbers, operators (decorative)          | `#A6B0A0`   | `#7A8478`   |
| `subtle`             | comments, inactive labels                     | `#829181`   | `#969E95`   |
| `syntax-keyword`     | control flow, imports, declarations           | `#66800B`   | `#A0AF54`   |
| `syntax-operator`    | `=` `=>` `?` `:` `+` `&&`                     | `#878580`   | `#878580`   |
| `syntax-function`    | function defs, method calls                   | `#BC5215`   | `#EC8B49`   |
| `syntax-string`      | string & template literals                    | `#24837B`   | `#5ABDAC`   |
| `syntax-type`        | type/class/interface names                    | `#205EA6`   | `#66A0C8`   |
| `syntax-tag`         | HTML/JSX tags, language features              | `#A02F6F`   | `#E47DA8`   |
| `syntax-regex`       | regular expressions                           | `#5E409D`   | `#A699D0`   |
| `syntax-number`      | numeric & boolean literals                    | `#5E409D`   | `#A699D0`   |
| `syntax-variable`    | plain identifiers, properties (= `ink`)       | `#5C6A72`   | `#D3C6AA`   |
| `syntax-punctuation` | delimiters, brackets, semicolons (= `subtle`) | `#829181`   | `#969E95`   |
| `syntax-comment`     | comments (= `subtle`, italic)                 | `#829181`   | `#969E95`   |
| `primary`            | chrome accent (cursor, tab, branch…)          | `#044123`   | `#FFC600`   |
| `primary-container`  | chrome bg fill                                | `#FBE8D3`   | `#403319`   |
| `find-match-bg`      | find-match fill (accent @ 25%)                | `#04412340` | `#FFC60040` |
| `find-match-hl-bg`   | find-match-highlight fill (accent @ 12%)      | `#04412320` | `#FFC60020` |
| `error`              | error diagnostics, git delete                 | `#942822`   | `#F89A8A`   |
| `warning`            | warning diagnostics, git change               | `#9B4A0F`   | `#F9AE77`   |
| `success`            | passing tests, git add, lualine normal        | `#4D6B0E`   | `#BEC97E`   |
| `info`               | info diagnostics, inline hints                | `#1A4F8C`   | `#92BFDB`   |
| `hint`               | lowest-priority hints (= `subtle`)            | `#829181`   | `#969E95`   |
| `git-add`            | additions (= `success`)                       | `#4D6B0E`   | `#BEC97E`   |
| `git-change`         | modifications (= `warning`)                   | `#9B4A0F`   | `#F9AE77`   |
| `git-delete`         | deletions (= `error`)                         | `#942822`   | `#F89A8A`   |
| `git-untracked`      | untracked (= `info`)                          | `#1A4F8C`   | `#92BFDB`   |
| `git-ignored`        | ignored (= `subtle`)                          | `#829181`   | `#969E95`   |
| `git-conflict`       | conflicts (= `syntax-tag`)                    | `#A02F6F`   | `#E47DA8`   |

ANSI terminal slots also flip per mode (Flexoki dark vs light ANSI mapping);
the front matter holds the dark ANSI palette. Light-mode ANSI uses the Flexoki
light mapping — `ansi-black: #1C1B1A`, `ansi-red: #AF3029`, `ansi-green:
#66800B`, `ansi-yellow: #AD8301`, `ansi-blue: #205EA6`, `ansi-magenta:
#A02F6F`, `ansi-cyan: #24837B`, `ansi-white: #5C6A72`, with bright variants
from the 400-series and `ansi-bright-white: #FDF6E3` (canvas).

### Surface

Four background steps create hierarchy through tone, never shadow. In **dark**
they descend into the forest (`canvas` is mid, `surface-deep` is darkest,
`surface-raised` is _lighter_ for hover/current-line). In **light** the concept
inverts: `canvas` is the _brightest_ layer and `surface-raised` reads as
slightly _darker_ than canvas — the same tonal-depth idea, mirrored. The
current line and hover use a touch of warm shadow (light) or a touch of light
(dark).

### Selection & Focus

- **Selection**: a wash that echoes the chrome identity and feels native to the
  canvas — a forest-green tint in dark, a pale navy wash in light.
- **Highlight Line**: matches `surface-raised` so the current line reads as
  "active surface," not "spotlight."

### Text

- **Ink** (`{colors.ink}`): the default foreground — Everforest parchment
  (dark) / Everforest Light slate-green (light). Not white/black, not grey;
  sits comfortably against the canvas without harsh contrast.
- **Muted-strong** (`{colors.muted-strong}`): quiet _text_ you still read —
  sidebar filenames and section headings. A step below `ink` so the file tree
  recedes under the code, but it meets WCAG AA (4.5:1) against `{colors.surface}`
  in both modes because these are content you scan, not decoration.
- **Muted** (`{colors.muted}`): line numbers and operators only. Decorative and
  positional — intentionally below WCAG AA text contrast because these are
  visual landmarks, not prose. The split from `muted-strong` is by _job_, not
  shade: anything you read meets AA; anything you merely locate need not.
- **Subtle** (`{colors.subtle}`): comments, inactive tab labels, status bar
  labels. The quietest readable tone that still meets WCAG AA (4.5:1). Comments
  render italic (with supporting fonts) and recede without disappearing.

### Syntax

The syntax palette is inky and perceptually-calibrated: every accent sits at
the same perceptual tier, so no single color shouts over its neighbours. The
mode runs a **brighter tier** in dark (the canvas is lighter than true black,
so syntax must lift to read) and a **deeper tier** in light (to read against
cream). Same hue vocabulary (red is red, green is green) in both modes; only the
value tier flips.

Calibrated accents were chosen over electric, high-chroma tokens deliberately.
Neon tokens only hold hierarchy against a deep, cold background; on a warm
canvas (either mode) they lose hierarchy and read as shouting. Calmer accents
preserve the "ink on paper" reading state and leave the chrome accent free to
be the single loud signal.

> The syntax palette's hue calibration and role mapping are adapted from Flexoki
> by Steph Ango (stephango.com/flexoki).

- **Keyword** (`{colors.syntax-keyword}`): control flow, imports, `const`,
  `return`, arrow functions, declarations. Green — keywords are the skeleton.
- **Operator** (`{colors.syntax-operator}` — #878580, same both modes): `=`,
  `=>`, `?`, `:`, `+`, `&&`. Muted on purpose. Recedes so keywords carry the
  structural emphasis; operators appear on nearly every line.
- **Function** (`{colors.syntax-function}`): definitions, method calls,
  callables. Orange — warm enough to read as "active," calm enough not to burn
  over a long session.
- **String** (`{colors.syntax-string}`): string and template literals. Cyan —
  cool enough to recede slightly while clearly marked.
- **Type** (`{colors.syntax-type}`): type/class/interface names. Blue — reads as
  "external/structural" without competing with green keywords.
- **Tag** (`{colors.syntax-tag}`): HTML/JSX tags, language features, thrown
  exceptions. Magenta.
- **Regex** (`{colors.syntax-regex}`): regular expressions and special
  literals. Purple — the rarest syntax color; draws the eye to something unusual
  without screaming.
- **Number** (`{colors.syntax-number}`): numeric and boolean literals. Shares
  purple with regex (they rarely share a line).
- **Variable** (`{colors.syntax-variable}` = `{colors.ink}`): plain
  identifiers, object properties, parameters. Intentionally equal to ink — the
  default reading state must not demand attention. It is the resting point the
  eye returns to between bright token moments.
- **Comment** (`{colors.syntax-comment}` = `{colors.subtle}`): italic where the
  font supports it (Operator Mono, Dank Mono, Victor Mono). Subordinate at all
  times. The comment color is raised to subtle because a quieter tone fails WCAG
  AA at these canvas brightnesses.
- **Punctuation** (`{colors.syntax-punctuation}` = `{colors.subtle}`):
  delimiters, brackets, semicolons. The visual distinction from comments comes
  from glyph shape (single characters vs. words), not color.

### Brand

The chrome identity is a single chrome accent per mode: **Cobalt 2 gold**
(#FFC600) in dark, **deep forest green** (#044123) in light — chosen to
harmonize with the cream canvas. One identity color, one rule: the accent is
chrome. Chrome means "things you operate on" — the cursor, the active tab, the
branch name, the active indent guide, the lualine modes, the modified file
marker, the bracket match border, the find-match outline. Cobalt 2's own theme
uses its accent this way — outline/marker/cursor, almost never a broad
background fill. The light forest green is the direct port of the dark gold
principle: same exclusivity, mirrored substrate.

- **Primary** (`{colors.primary}`): the single chrome accent. Used everywhere
  chrome calls attention to itself. Never used in syntax. Never a broad fill.
- **Primary Container** (`{colors.primary-container}`): an accent-adjacent
  surface available for chrome background fills when needed. Not used for
  lualine normal mode (that uses RCB green).

Earlier iterations used a two-tone green-and-gold "RCB chrome" system. The
green chrome was retired because Flexoki uses green for keyword syntax —
keeping green in chrome would create a constant chrome-vs-syntax collision. The
single-accent chrome (gold dark / forest green light) eliminates the ambiguity
in both modes.

### Semantic

Semantic colors come from Flexoki accents one tier louder than syntax so git
markers and diagnostics read as "signal, not text." The tier inverts by
substrate: **dark uses the 200-series** (brighter than the 300 syntax) and
**light uses the 700-series** (darker than the 600 syntax). Same hue vocabulary
as syntax; only intensity changes.

- **Error** (`{colors.error}`): Flexoki re. Error squiggles, error text, git
  deletions, deleted file markers. Never the chrome accent.
- **Warning** (`{colors.warning}`): Flexoki or. Warning diagnostics — shouts a
  step louder than the orange function syntax.
- **Success** (`{colors.success}`): Flexoki gr. Passing tests, resolved
  diagnostics, git additions, new file marker, lualine normal pill.
- **Info** (`{colors.info}`): Flexoki bl. Informational diagnostics and inline
  hints.
- **Hint** (`{colors.hint}` = `{colors.subtle}`): lowest-priority hints.

## Typography

The theme is designed for monospace code fonts with ligature support. The
recommended primary font is JetBrains Mono or Operator Mono. For Operator Mono
users, the italic variant activates on comments and certain keyword scopes —
the most visually rich configuration of the theme. Typography is identical in
both modes.

- **Editor font size:** 14px baseline; 15–17px for HiDPI displays.
- **Line height:** 1.65. Generous for long sessions without loosening the
  vertical rhythm of code blocks.
- **Letter spacing:** 0.5px. Cobalt 2's original recommendation — breathing
  room without pushing long lines off the visible width.
- **UI font:** Inter or system-ui at 13px. The shell should recede and not
  compete with the code.

If JetBrains Mono and Operator Mono are unavailable, **Fira Code** is the
closest open-source substitute with full ligature support. The proportions
transfer cleanly at the same size and weight settings.

## Layout

Layout is not prescribed — Forest Flower is a color and typography token set,
not a layout system. Identical in both modes. For any derived UI:

- **Base spacing unit:** 8px. Use multiples for all margins, paddings, gaps.
- **Sidebar width:** 200–240px.
- **Status bar height:** 24px.
- **Tab bar height:** 36px.
- **Gutter width:** auto-sized to line-number character count, minimum 40px.
- **Panel minimum height:** 120px.

## Elevation & Depth

The theme uses tonal depth rather than shadows, in both modes. Visual hierarchy
is communicated entirely through the four background steps:

1. `{colors.surface-deep}` — deepest/most-settled layer (title bar, status bar)
2. `{colors.surface}` — secondary surfaces (sidebar, gutter, tab bar)
3. `{colors.canvas}` — primary editor surface
4. `{colors.surface-raised}` — foreground surface element (current line, hover)

The tonal direction mirrors per mode: in **dark**, `surface-raised` is
_lighter_ than canvas; in **light**, it reads slightly _darker_ than canvas.
Same tonal-depth concept, inverted — the current line and hover use a touch of
light (dark mode) or a touch of warm shadow (light mode).

No drop shadows. No blur. No decorative borders. Region separation uses a 1px
rule at `{colors.surface-deep}` — dividing by tone rather than a distinct
stroke color. The one exception is the bracket match border and find-match
overlay, both using the accent (`{colors.primary}`) as an outline. These are
functional highlights, not elevation.

## Shapes

Sharp and minimal, identical in both modes. The theme is for code — decorative
rounding is noise.

- **Interactive chrome** (status bar pills, sidebar badges, bracket match
  borders): `{rounded.sm}` (3px).
- **Popups, autocomplete panels, tooltips:** `{rounded.md}` (6px).
- **Input fields inside settings UI:** `{rounded.sm}` (3px).
- Fully round (`{rounded.full}`) is never used in the editor chrome.

## Components

See the YAML front matter for full component token definitions. Every component
references color tokens by name, so the same definitions drive both modes —
only the resolved values change. Behavioral notes:

**Cursor:** the accent (`{colors.primary}`), 5px width, line style, solid
blinking. The fat cursor is deliberate — the single most visible element at all
times, and the clearest signal that this is Forest Flower. A thin or recolored
cursor diminishes the identity in either mode.

**Active tab underline:** a 2px bottom border in `{colors.primary}`. The only
use of color in the tab bar — all other tab chrome is greyscale/warm-grey
surface tones.

**Status bar branch:** renders as a small pill on `{colors.surface}`. The base
branch segment is `{colors.primary}` (the accent). After the `/` separator the
feature branch segment is `{colors.success}` (RCB green). One branch renders in
the accent. The accent/green split signals "active branch you're on" vs "the
line of work this branch comes from."

**Bracket matching:** a `{colors.primary}` border at `{rounded.sm}`, no fill.
Outline only — the interior remains fully readable.

**Find match:** a `{colors.primary}` border outlining the match, with a
`{colors.find-match-bg}` (25% accent) fill where the renderer supports alpha,
and `{colors.find-match-hl-bg}` (12% accent) for other matches. In Neovim's
highlight layer (no alpha) the match renders as a solid accent border.

**Git indicators:** green additions (`{colors.git-add}`), warm-orange
modifications (`{colors.git-change}`), red deletions (`{colors.git-delete}`).
Consistent across gutter diff markers, the sidebar file list, and inline diff.
None are the chrome accent; they come from the Flexoki semantic accents.

**Indent guides:** default guides at `{colors.surface-raised}` — barely
visible, structural only. The active scope's guide flips to `{colors.primary}`,
making the current indentation level immediately legible.

## Do's and Don'ts

- Do keep `{colors.primary}` (the chrome accent — gold in dark, forest green in light)
  exclusive to UI chrome. If the accent appears as a syntax token, the identity
  signal is lost.
- Do keep the cursor `{colors.primary}` at 5px width. A thin or recolored
  cursor undermines the theme's personality.
- Do use italic for comments when the font supports it. `{colors.subtle}` +
  italic is the designed comment treatment in both modes.
- Do use `{colors.syntax-variable}` (= `{colors.ink}`) for all plain
  identifiers and object properties. The neutral resting tone must not be
  brightened (dark) or darkened (light).
- Do treat the mode as a value swap on the semantic token layer — never fork
  components, typography, or prose per mode. If a value must change between
  modes, it belongs in the token table, not in a component or a second file.
- Don't reintroduce the retired RCB-green chrome. Chrome is single-accent;
  green is reserved for Flexoki keyword syntax and the git-add semantic accent.
- Don't use shadows, glows, or neon effects. Contrast comes from chroma against
  the canvas (dark) or inkiness against parchment (light), not emissive
  styling.
- Don't use a background lighter than `{colors.canvas}` inside the dark editor
  surface, nor darker than `{colors.canvas}` inside the light reading surface.
  Doing so reduces syntax-token contrast below designed levels.
  (Surface-raised is the deliberate exception, used only for hover/current-line
  marking, not bulk reading.)
- Don't apply the chrome accent to errors. The accent is the chrome identity —
  errors always use `{colors.error}`.
- Don't change `{colors.subtle}` to anything brighter (dark) or darker (light)
  for comments. Comments must stay subordinate. If they feel too hard to read,
  increase the editor font size before touching the comment color.
- Do validate all color pairs against WCAG AA (4.5:1 normal text, 3:1 large
  text) when building derived UI. All readable text tokens (ink, muted-strong,
  subtle, syntax tiers) meet or exceed AA against their respective canvas. Only
  `{colors.muted}` is intentionally below AA — reserved for decorative/positional
  elements (line numbers, operators) that don't require text-level contrast. If
  you need a quiet tone on text the user actually reads, use `{colors.muted-strong}`,
  never `{colors.muted}`.
