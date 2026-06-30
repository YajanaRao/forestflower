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

# Neovim component map — each element styled by INDEXING the token axes above
# (elevation / ink / attention / status / state). No per-platform translation:
# a status bar is elevation −2 → surface.recessed2, a cursor is attention →
# accent.action. References are mode-agnostic; the active scheme resolves them.
components:
  editor:
    backgroundColor: "{surface.base}"
    textColor: "{ink.primary}"

  titlebar:
    backgroundColor: "{surface.recessed2}"
    textColor: "{ink.comment}"

  sidebar:
    backgroundColor: "{surface.recessed1}"
    textColor: "{ink.secondary}"

  sidebar-file-active:
    backgroundColor: "{surface.raised}"
    textColor: "{ink.primary}"

  sidebar-file-modified:
    textColor: "{accent.action}"

  sidebar-file-new:
    textColor: "{status.success}"

  sidebar-file-deleted:
    textColor: "{status.danger}"

  tab-bar:
    backgroundColor: "{surface.recessed1}"

  tab-active:
    backgroundColor: "{surface.base}"
    textColor: "{ink.primary}"
    borderBottomColor: "{accent.action}"
    borderBottomWidth: 2px

  tab-inactive:
    backgroundColor: "{surface.recessed1}"
    textColor: "{ink.comment}"

  gutter:
    backgroundColor: "{surface.recessed1}"
    textColor: "{ink.faint}"

  cursor:
    color: "{accent.action}"
    width: 5px
    style: line
    blink: solid

  line-highlight:
    backgroundColor: "{surface.raised}"

  selection:
    backgroundColor: "{state.selection}"

  indent-guide:
    color: "{surface.raised}"
    activeColor: "{accent.action}"

  status-bar:
    backgroundColor: "{surface.recessed2}"
    textColor: "{ink.comment}"

  status-bar-branch:
    backgroundColor: "{surface.recessed1}"
    textColor: "{accent.action}"
    rounded: "{rounded.sm}"
    padding: "2px 8px"

  status-bar-branch-feature:
    textColor: "{accent.resting}"

  bracket-match:
    borderColor: "{accent.action}"
    rounded: "{rounded.sm}"

  find-match:
    backgroundColor: "{state.match_all}"
    borderColor: "{accent.action}"

  find-match-highlight:
    backgroundColor: "{state.match_all}"

  panel:
    backgroundColor: "{surface.recessed1}"
    textColor: "{ink.primary}"

  terminal:
    backgroundColor: "{surface.recessed2}"
    textColor: "{ink.primary}"
    cursorColor: "{accent.action}"

  scrollbar-thumb:
    backgroundColor: "{surface.raised}"

  scrollbar-thumb-hover:
    backgroundColor: "{ink.faint}"

  minimap:
    backgroundColor: "{surface.recessed1}"

  diagnostic-error:
    color: "{status.danger}"

  diagnostic-warning:
    color: "{status.warning}"

  diagnostic-info:
    color: "{status.info}"

  diagnostic-hint:
    color: "{ink.comment}"
---

A warm-surface, calm-ink editor theme. One platform-agnostic semantic token
layer — elevation · ink · attention · status · state, plus code/diff/terminal
domain palettes — drives light and dark from a single source. Interfaces index
tokens by FUNCTION (a status bar is "recessed", a cursor is "action") rather
than mapping per platform.

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
  single **bright gold** (`{accent.action}` — #FFC600) chrome accent. The result
  feels like a forest at night lit by bioluminescence: the shell recedes, the
  code glows.
- **Light** — warm cream parchment surfaces, deeper-tier syntax inks, and the
  **same gold accent darkened** to a **deep gold** (#6F5800) so it reads on the
  cream canvas. The result feels like ink on aged paper: the shell recedes, the
  code reads.

The accent is a single hue across both modes — gold — value-swapped like every
other token: bright on the dark canvas, deep on the cream one. It is the one
place earlier versions changed hue between modes; unifying on gold makes the
accent obey the same value-swap rule as the rest of the system.

Both modes obey the same chrome rule. The **action accent**
(`{accent.action}`, gold) carries the cursor, the current search match, the
active tab underline, the branch base, the active indent guide, lualine
non-normal mode segments, the modified file marker, and the bracket match
border. It works as an outline, marker, or cursor color — almost never as a broad
background fill. The **resting accent** (`{accent.resting}`, green) carries the
lualine normal-mode pill and the derived selection wash — passive state, kept to
backgrounds and washes so it never competes with green keyword syntax. Neither
accent appears in syntax; gold's power comes from that scarcity, and green's
chrome use stays in a separate (background) layer from code.

The cursor is the accent (`{accent.action}`), fat at 5px, and solid-blinking.
This is the single most visible element in the editor and the clearest
expression of the theme's identity — deliberate and immediately recognizable in
either mode.

**Key characteristics:**

- Single chrome identity, one hue both modes: gold — bright (dark) / deep (light)
  for every chrome accent. The lualine normal pill uses the success green `{status.success}`
  to signal resting state, distinct from the accent-filled active-mutation cluster.
- Inky syntax — calm, perceptually-calibrated accents role-mapped to syntax
  tokens. Dark runs a brighter tier (for the darker canvas); light runs a deeper
  tier (for the cream canvas). Both land at WCAG AA against their canvas.
- Warm canvas in both modes: forest grey-green (dark) / parchment cream
  (light) — never cold, never pure neutral, never harsh white.
- Single cursor identity: accent cursor at 5px width. The fat cursor is
  intentional — it anchors the eye and feels confident.
- Comments fade, not disappear: `{ink.comment}` keeps comments readable
  without competing with code, in both modes.

## Colors

Colors are defined once as **semantic tokens**, named by the **job** they do in
any interface — not by component, platform, or literal value. A token's _name_ is
mode-independent; its _value_ resolves per scheme. The front matter `schemes:`
block holds both the **dark** and **light** values for every token, so a single
source drives both modes — and any downstream surface (editor, web, terminal,
Slack) reads the same tokens.

> The intensity pattern inverts by substrate: dark needs _brighter_ tokens to
> read against the forest canvas; light needs _deeper_ tokens to read against the
> cream canvas — code/status hues flip 300→600 / 200→700. Only `code.operator`
> (and `none`) hold one value across both schemes; see `constant:` in the front
> matter.

### Token axes

Tokens are organised by the semantic **axis** they belong to. An interface styles
an element by **indexing an axis** — a status bar is "recessed", a cursor is
"action" — so there is no per-platform mapping table.

| Axis          | Index                                             | Tokens                                     | Source            |
| ------------- | ------------------------------------------------- | ------------------------------------------ | ----------------- |
| **Elevation** | recessed-2 · recessed-1 · base · raised · overlay | `surface.*` (+ `border` = recessed-2 tone) | Everforest        |
| **Ink**       | primary · secondary · comment · faint · on-action | `ink.*`                                    | Everforest / ink  |
| **Attention** | action · resting (+ containers)                   | `accent.*`                                 | Gold + Green      |
| **Status**    | danger · warning · success · info                 | `status.*`                                 | Flexoki           |
| **State**     | selection · match-all · active · hover · disabled | `state.*` (**derived**)                    | Attention/Surface |
| **Code**      | keyword · function · string · type · tag · …      | `code.*`                                   | Flexoki           |
| **Diff**      | add · change · delete · untracked · …             | `diff.*` (= `status.*` / `code.tag`)       | Flexoki           |
| **Terminal**  | ansi[0..15]                                       | `terminal.ansi.*`                          | Flexoki           |

**Source palettes.** Surfaces are Everforest (forest dark / parchment light).
Accents are Flexoki, role-mapped (300/200 dark, 600/700 light). The action accent
is gold — Cobalt 2 `#FFC600` dark, deep `#6F5800` light. The resting accent is
Flexoki green (= the `status.success` tier).

**Aliases, not copies.** Several tokens are references, so one edit propagates:
`status.success → {accent.resting}`, `diff.* → {status.*}`, `code.variable →
{ink.primary}`, `code.comment` = `code.punctuation` = `{ink.comment}`,
`state.active → {accent.action}`. In the front matter these are `{a.b}` refs that
resolve within the enclosing scheme.

**Derived state.** State washes are not stored as literals; they are computed at
load (`themes/init.lua` `M.derive`) so they always sit inside the palette:

- `state.selection = blend(accent.resting, 0.24, surface.base)` — a low-chroma
  green wash behind selected text. One hue both modes.
- `state.match_all = blend(accent.action, 0.25, surface.base)` — a faint gold wash
  behind _all_ search matches; the **current** match stays solid `accent.action`
  (`state.active`) so it still pops.

### Token value table

| Token                               | Job                                          | Light     | Dark      |
| ----------------------------------- | -------------------------------------------- | --------- | --------- |
| `surface.base`                      | content plane (editor)                       | `#FDF6E3` | `#2D353B` |
| `surface.recessed1`                 | sidebar, gutter, tab bar                     | `#F4F0D9` | `#232A2E` |
| `surface.recessed2`                 | title bar, status bar, 1px divider           | `#EFEBD4` | `#1D2226` |
| `surface.raised`                    | current line, hover, floats                  | `#E6E2CC` | `#3D484D` |
| `surface.overlay`                   | popups, dialogs, toasts (+2)                 | `#DEDAC2` | `#475258` |
| `ink.primary`                       | body / default fg (AA)                       | `#5C6A72` | `#D3C6AA` |
| `ink.secondary`                     | filenames, headings — read (AA)              | `#606D5C` | `#A6B0A0` |
| `ink.comment`                       | comments, inactive labels, hints — read (AA) | `#829181` | `#969E95` |
| `ink.faint`                         | line numbers, operators — locate (AA-exempt) | `#A6B0A0` | `#7A8478` |
| `ink.on_action`                     | text/icon on an `accent.action` fill         | `#FDF6E3` | `#1D2226` |
| `accent.action`                     | the scarce "act here" mark                   | `#6F5800` | `#FFC600` |
| `accent.action_container`           | chrome bg fill                               | `#FBE8D3` | `#403319` |
| `accent.resting`                    | resting identity (normal mode, branch)       | `#4D6B0E` | `#BEC97E` |
| `accent.resting_container`          | state bg fills (pills, washes)               | `#E1E0C1` | `#3A5A40` |
| `status.danger`                     | errors, destructive, git delete              | `#942822` | `#F89A8A` |
| `status.warning`                    | warnings, git change                         | `#9B4A0F` | `#F9AE77` |
| `status.success` (= accent.resting) | passing tests, git add, lualine normal       | `#4D6B0E` | `#BEC97E` |
| `status.info`                       | info diagnostics, inline hints               | `#1A4F8C` | `#92BFDB` |
| `state.selection`                   | selected-text wash — _derived_ resting @24%  | `#D3D5B0` | `#50594B` |
| `state.match_all`                   | all search matches — _derived_ action @25%   | `#DACFAA` | `#62592C` |
| `code.keyword`                      | control flow, imports, declarations          | `#66800B` | `#A0AF54` |
| `code.operator` (**constant**)      | `=` `=>` `?` `:` `+` `&&`                    | `#878580` | `#878580` |
| `code.function`                     | function defs, method calls                  | `#BC5215` | `#EC8B49` |
| `code.string`                       | string & template literals                   | `#24837B` | `#5ABDAC` |
| `code.type`                         | type/class/interface names                   | `#205EA6` | `#66A0C8` |
| `code.tag`                          | HTML/JSX tags, language features             | `#A02F6F` | `#E47DA8` |
| `code.regex` / `code.number`        | regex; numeric & boolean literals            | `#5E409D` | `#A699D0` |
| `code.variable` (= ink.primary)     | plain identifiers, properties                | `#5C6A72` | `#D3C6AA` |
| `code.punctuation` (= ink.comment)  | delimiters, brackets, semicolons             | `#829181` | `#969E95` |
| `code.comment` (= ink.comment)      | comments, italic where supported             | `#829181` | `#969E95` |

`diff.*` map to the status family (`add → success`, `change → warning`, `delete →
danger`, `untracked → info`, `ignored → ink.comment`, `conflict → code.tag`). The
`diff.*_bg` line-background washes are `blend(status hue, 0.22, surface.base)`.
`terminal.ansi.*` is the 16-slot Flexoki mapping (dark vs light), held in full in
the front matter `schemes:` block.

### Token application

A consumer styles an element by stating its **intent** on an axis; the token
resolves. No translation table — the element's meaning _is_ the index.

**Neovim** (rich target — 1:1):

| Element                | Intent                     | Token                                |
| ---------------------- | -------------------------- | ------------------------------------ |
| `Normal`               | elevation 0 · ink primary  | `surface.base` · `ink.primary`       |
| `StatusLine`           | elevation −2 · ink comment | `surface.recessed2` · `ink.comment`  |
| `LineNr`               | ink faint                  | `ink.faint`                          |
| `CursorLine`           | elevation +1               | `surface.raised`                     |
| `Cursor`               | attention action           | `accent.action` (fg `ink.on_action`) |
| `Visual`               | state selection            | `state.selection`                    |
| `Search` / `CurSearch` | state match-all / active   | `state.match_all` / `accent.action`  |
| `DiagnosticError`      | status danger              | `status.danger`                      |
| `@keyword`             | code keyword               | `code.keyword`                       |

**Slack** (coarse target — 8 fixed positional slots; the index picks the best fit):

| #   | Slot             | Index → token                      |
| --- | ---------------- | ---------------------------------- |
| 1   | Column BG        | elevation 0 → `surface.base`       |
| 2   | Menu BG hover    | elevation −1 → `surface.recessed1` |
| 3   | Active item      | attention → `accent.action`        |
| 4   | Active item text | `ink.on_action`                    |
| 5   | Hover item       | elevation +1 → `surface.raised`    |
| 6   | Text color       | `ink.primary`                      |
| 7   | Active presence  | status → `status.success`          |
| 8   | Mention badge    | status → `status.danger`           |

> The hand-written `extras/slack/*` files predate this model and drift from it
> (night "active presence" uses the keyword green, day "active item" uses a green
> that should be gold). The generator regenerates them from the table above.

### Elevation (surfaces)

Five surface steps create hierarchy through tone, never shadow, indexed by signed
distance from the reading plane. In **dark** they ascend out of the forest
(`surface.recessed2` darkest → `surface.overlay` lightest); in **light** the ramp
inverts (`surface.base` is the _brightest_ layer; recessed and raised steps read
progressively _darker_) — the same tonal-depth idea, mirrored.

- `surface.recessed2` (−2): title bar, status bar; also the 1px divider tone.
- `surface.recessed1` (−1): sidebar, gutter, tab bar.
- `surface.base` (0): the content plane (editor).
- `surface.raised` (+1): current line, hover, active rows.
- `surface.overlay` (+2): popups, dialogs, toasts — a step above `raised`.

### Selection & focus

- **`state.selection`**: a derived **resting** wash — `accent.resting` blended
  into `surface.base` at ~24% (see _Derived state_). Both modes share one hue (a
  forest-green tint). It is a passive _state_ marker, so it stays low-chroma and
  never borrows the gold action accent.
- **Current line / hover** (`state.hover` = `surface.raised`): reads as "active
  surface," not "spotlight."

### Ink

Four reading tiers split by **job**, not brightness — anything you _read_ meets
WCAG AA; anything you merely _locate_ need not.

- **`ink.primary`**: the default foreground — Everforest parchment (dark) /
  slate-green (light). Not white/black, not grey; sits against the canvas without
  harsh contrast.
- **`ink.secondary`**: quiet _text_ you still read — sidebar filenames and
  section headings. A step below `ink.primary` so the file tree recedes under the
  code, but it meets WCAG AA (4.5:1) against `surface.recessed1` in both modes.
- **`ink.faint`**: line numbers and operators only. Decorative and positional —
  intentionally below WCAG AA text contrast because these are landmarks, not
  prose. The split from `ink.secondary` is by _job_, not shade.
- **`ink.comment`**: comments, inactive tab labels, status-bar labels, hints. The
  quietest readable tone that still meets WCAG AA (4.5:1). Comments render italic
  (with supporting fonts) and recede without disappearing.
- **`ink.on_action`**: text/icons placed on an `accent.action` fill (cursor glyph,
  active match) — the deepest substrate tone, for maximum contrast on gold.

### Code (syntax)

The code palette is inky and perceptually-calibrated: every accent sits at the
same perceptual tier, so no single color shouts over its neighbours. Dark runs a
**brighter tier** (the canvas is lighter than true black), light a **deeper
tier** (to read against cream); same hue vocabulary, only the value flips.
Calibrated accents — not electric neon — preserve the "ink on paper" reading state
and leave `accent.action` free to be the single loud signal.

> The code palette's hue calibration and role mapping are adapted from Flexoki by
> Steph Ango (stephango.com/flexoki).

- **`code.keyword`** — control flow, imports, `const`, `return`, declarations.
  Green; keywords are the skeleton.
- **`code.operator`** (constant `#878580`, both modes) — `=`, `=>`, `?`, `:`,
  `+`, `&&`. Muted on purpose; recedes so keywords carry the structural emphasis.
- **`code.function`** — definitions, method calls. Orange — "active" but calm
  enough not to burn over a long session.
- **`code.string`** — string & template literals. Cyan — cool, recedes slightly.
- **`code.type`** — type/class/interface names. Blue — "external/structural,"
  without competing with green keywords.
- **`code.tag`** — HTML/JSX tags, language features, thrown exceptions. Magenta.
- **`code.regex`** — regex & special literals. Purple — the rarest; draws the eye.
- **`code.number`** — numeric & boolean literals. Shares purple with regex.
- **`code.variable`** (= `ink.primary`) — plain identifiers, object properties,
  parameters. The default reading state must not demand attention; it is the
  resting point the eye returns to between bright token moments.
- **`code.comment`** (= `ink.comment`) — italic where the font supports it
  (Operator Mono, Dank Mono, Victor Mono). Raised to the comment tier because a
  quieter tone fails WCAG AA at these canvas brightnesses.
- **`code.punctuation`** (= `ink.comment`) — delimiters, brackets, semicolons;
  distinguished from comments by glyph shape (single characters vs. words), not
  color.

### Attention (chrome)

Two channels with a strict division of labour: **`accent.action` (gold) =
action**, **`accent.resting` (green) = resting state**.

The **action accent** is gold, value-swapped to its substrate: **Cobalt 2 gold**
(#FFC600) in dark, the same gold darkened to a **deep gold** (#6F5800) in light so
it reads on the cream canvas. It marks the things you actively operate on — the
cursor, the current search match, the active tab underline, the branch base, the
active indent guide, the modified-file marker, the bracket-match border — as an
outline/marker/cursor, almost never a broad background fill.

Why gold for action and not green? Gold is the one hue `code.*` uses in _neither_
mode (light and dark span red/orange/green/cyan/blue/purple/magenta, never
yellow). Green is the worst candidate for _action_: it is the most frequent code
color (keywords) and carries `status.success` / `diff.add`, so a green action mark
would collide constantly. Gold sits in the open slot — and that exclusivity is
what makes the action accent read as chrome rather than syntax.

The **resting accent** is green (`accent.resting`, = the `status.success` tier).
It carries passive, resting signals — the lualine normal-mode pill, the
feature-branch segment, and the derived `state.selection` wash. As a low-chroma
background wash it lives in a different visual layer than foreground code, so it
never competes with green keywords. Warm gold = you're acting; calm green = at rest.

- **`accent.action`** / **`accent.action_container`**: the action mark and its
  accent-adjacent surface for chrome background fills. Never used in code; never a
  broad fill.
- **`accent.resting`** / **`accent.resting_container`**: the resting mark and a
  deep-green surface for state fills (pills, washes). Confined to backgrounds and
  resting modes — never a foreground action mark.

Earlier iterations used green chrome in light mode; it was retired because green
as a foreground _action_ mark collides with green keyword syntax and the
`status.success` / `diff.add` semantic. The current split fixes this by role, not
by banishing green: gold owns action; green's chrome use is confined to resting
backgrounds and washes — a separate layer from foreground code.

### Status

Status colors come from Flexoki accents one tier louder than code so diagnostics
and `diff.*` markers read as "signal, not text." The tier inverts by substrate:
**dark uses the 200-series** (brighter than the 300 code tier), **light the
700-series** (darker than the 600 code tier). Same hue vocabulary as code; only
intensity changes.

- **`status.danger`** — error squiggles, error text, destructive actions,
  `diff.delete`. Never the chrome accent.
- **`status.warning`** — warning diagnostics; a step louder than orange function
  syntax.
- **`status.success`** (= `accent.resting`) — passing tests, resolved
  diagnostics, `diff.add`, new-file marker, lualine normal pill.
- **`status.info`** — informational diagnostics and inline hints.

Lowest-priority hints fall to `ink.comment`.

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

If JetBrains Mono and Operator Mono are unavailable, **Fira Code** is the
closest open-source substitute with full ligature support. The proportions
transfer cleanly at the same size and weight settings.

### Three type roles: code, UI, content

The theme distinguishes three jobs, and each wants a different genre. Sharing
one font across all three is the most common mistake — a grotesque made for UI
reads cold across long prose, and a code mono reads cramped in a paragraph.

- **Code** (`typography.editor`): a calm humanist/neutral monospace with
  cursive-capable italics (JetBrains Mono / Operator Mono / Victor Mono).
- **UI** (`typography.ui`): a system-UI grotesque stack. This is the one place
  a neutral grotesque is correct — chrome should recede, render instantly with
  no web-font cost, and match the host OS. Used for nav, labels, buttons, and
  short headings only.
- **Content** (`typography.content`): a **warm serif** for long-form reading
  (blog posts, docs). This is the literal expression of the theme's "ink on
  paper" philosophy — the serif tradition _is_ ink on paper. The shipped face is
  **Fraunces** (a free, high-contrast "old-style" serif with characterful
  italics and built-in optical sizing) — used italic + heavy for headlines (an
  energetic, editorial masthead voice) and at a text weight for body copy. The
  inspiration was DJR's commercial **Roslindale** (Deck Narrow Bold Italic);
  Fraunces is the free, Google-Fonts-hosted substitute that lands the same
  register. **`Georgia`** is the critical fallback because it is a warm,
  readable serif present on nearly every OS, so even with no web font the
  reading surface stays inky rather than collapsing to a cold grotesque.

> Fraunces is variable — let `font-optical-sizing: auto` size it per use, so
> headline hairlines stay crisp while body text thickens for reading. If you
> license the premium **Roslindale**, lead both stacks with it (Deck Narrow for
> headings, Text for body) and keep Fraunces → Georgia as graceful fallbacks.

> Do not use the UI grotesque stack (Inter / system-ui) for body prose. Inter
> is purpose-built for interface text at small sizes; across 1,500 words it
> reads characterless and "generic internet," undoing the warm Everforest /
> Flexoki identity. Keep Inter for chrome; give the reading surface a serif.

As CSS custom properties for a derived site:

```css
/* headlines — editorial masthead voice, ink on paper (italic + heavy) */
--font-heading: "Fraunces", "Newsreader", Georgia, serif;

/* long-form reading: blog body, docs — warm serif */
--font-content:
  "Fraunces", "Newsreader", "Source Serif 4", Georgia, Cambria,
  "Times New Roman", serif;

/* chrome: nav, buttons, labels, card teasers — recede, render instantly */
--font-ui:
  -apple-system, BlinkMacSystemFont, "Inter", "IBM Plex Sans", "Segoe UI",
  Helvetica, Arial, sans-serif;

/* code blocks — carry the editor identity into samples */
--font-code:
  "JetBrains Mono", "Victor Mono", "Operator Mono", "Fira Code", ui-monospace,
  Menlo, Monaco, monospace;
```

Headlines render italic + bold (`font: italic 700 …`). Card teasers and other
short snippets may stay on `--font-ui`; the full article body switches to
`--font-content` for the long-form reading experience.

### Heading colors

Heading hierarchy is built from **tone, not hue** — the same principle as the
four surface steps. Different-colored headings (green h2, blue h3…) would read
as noise on a calm reading surface and undo the ink-on-paper voice. So the
scale stays in the warm ink family and steps _down_ in weight as it descends.
The chrome accent (`{accent.action}`) is allowed at exactly one content
touchpoint: a small **eyebrow/kicker** above the title — the accent as a
_marker_, consistent with its chrome rule, never as a broad heading fill.

| Element                  | Token             | Role                                             |
| ------------------------ | ----------------- | ------------------------------------------------ |
| Eyebrow / kicker         | `{accent.action}` | accent marker, small-caps, above the title only  |
| `h1` (page title)        | `{ink.primary}`   | full-strength ink; size + italic carry weight    |
| `h2` (section)           | `{ink.primary}`   | ink; separated from h1 by size, not color        |
| `h3` (subsection)        | `{ink.secondary}` | one tonal step down — still AA, clearly quieter  |
| `h4`–`h6`                | `{ink.secondary}` | smallest cuts; weight/size do the work           |
| Body                     | `{ink.primary}`   | the resting reading tone                         |
| Lede / standfirst        | `{ink.secondary}` | intro paragraph, a step quiet under body         |
| Caption / byline / meta  | `{ink.comment}`   | quietest readable tone (AA), italic where apt    |
| Links                    | `{accent.action}` | the accent — the one hue allowed inline in prose |
| Blockquote border + mark | `{accent.action}` | accent as an outline/marker, not a fill          |

```css
.kicker {
  color: var(--accent-action);
} /* small-caps eyebrow */
h1,
h2 {
  color: var(--ink-primary);
}
h3,
h4,
h5,
h6 {
  color: var(--ink-secondary);
}
.lede {
  color: var(--ink-secondary);
}
.meta,
figcaption {
  color: var(--ink-comment);
}
a {
  color: var(--accent-action);
}
```

Rationale: ink for the loud headings, a single tonal step to `ink.secondary` for
the quieter ones (still WCAG AA), `ink.comment` for true metadata. The accent enters
content only as a marker (kicker, link, quote rule) — the same exclusivity it
holds in the editor chrome, so the blog and the editor read as one identity.

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

1. `{surface.recessed2}` — deepest/most-settled layer (title bar, status bar)
2. `{surface.recessed1}` — secondary surfaces (sidebar, gutter, tab bar)
3. `{surface.base}` — primary editor surface
4. `{surface.raised}` — foreground surface element (current line, hover)

The tonal direction mirrors per mode: in **dark**, `surface.raised` is
_lighter_ than the base; in **light**, it reads slightly _darker_ than the base.
Same tonal-depth concept, inverted — the current line and hover use a touch of
light (dark mode) or a touch of warm shadow (light mode).

No drop shadows. No blur. No decorative borders. Region separation uses a 1px
rule at `{surface.recessed2}` — dividing by tone rather than a distinct
stroke color. The one exception is the bracket match border and find-match
overlay, both using the accent (`{accent.action}`) as an outline. These are
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

**Cursor:** the accent (`{accent.action}`), 5px width, line style, solid
blinking. The fat cursor is deliberate — the single most visible element at all
times, and the clearest signal that this is Forest Flower. A thin or recolored
cursor diminishes the identity in either mode.

**Active tab underline:** a 2px bottom border in `{accent.action}`. The only
use of color in the tab bar — all other tab chrome is greyscale/warm-grey
surface tones.

**Status bar branch:** renders as a small pill on `{surface.recessed1}`. The base
branch segment is `{accent.action}` (the gold action accent). After the `/`
separator the feature branch segment is `{accent.resting}` (the resting green).
The gold/green split signals "active branch you're on" vs "the line of work this
branch comes from" — action vs resting, the same two-accent logic everywhere.

**Bracket matching:** a `{accent.action}` border at `{rounded.sm}`, no fill.
Outline only — the interior remains fully readable.

**Search / find match:** all matches get a faint gold wash —
`{state.match_all}`, the pre-blended `accent.action` @ 25% over the base (Neovim has
no live alpha, so the wash is baked into the token). The **current/active** match
(`IncSearch`/`CurSearch`) stays solid `{accent.action}` so the one you're on
pops. This keeps the broad "every match" fill off the loud accent while the
single active hit still reads as the action color.

**Git indicators:** green additions (`{diff.add}`), warm-orange
modifications (`{diff.change}`), red deletions (`{diff.delete}`).
Consistent across gutter diff markers, the sidebar file list, and inline diff.
None are the chrome accent; they come from the Flexoki semantic accents.

**Indent guides:** default guides at `{surface.raised}` — barely
visible, structural only. The active scope's guide flips to `{accent.action}`,
making the current indentation level immediately legible.

## Do's and Don'ts

- Do keep `{accent.action}` (the chrome accent — gold in both modes, bright in
  dark / deep in light) exclusive to UI chrome. If the accent appears as a syntax
  token, the identity signal is lost.
- Do keep the cursor `{accent.action}` at 5px width. A thin or recolored
  cursor undermines the theme's personality.
- Do use italic for comments when the font supports it. `{ink.comment}` +
  italic is the designed comment treatment in both modes.
- Do use `{code.variable}` (= `{ink.primary}`) for all plain
  identifiers and object properties. The neutral resting tone must not be
  brightened (dark) or darkened (light).
- Do treat the mode as a value swap on the semantic token layer — never fork
  components, typography, or prose per mode. If a value must change between
  modes, it belongs in the token table, not in a component or a second file.
- Don't use green (`{accent.resting}`) as a foreground _action_ mark — cursor,
  current-search, active-tab underline, matched paren, etc. stay gold
  (`{accent.action}`). Green's chrome use is confined to resting backgrounds and
  washes (selection, lualine normal, feature branch), a separate layer from the
  green keyword syntax it would otherwise collide with.
- Don't derive state colours (`state.selection`, `state.match_all`) by hand. They are
  computed from the attention accents in `themes/init.lua` (`M.derive`); change the
  blend alpha there, not by pasting a literal hex into a theme file.
- Don't use shadows, glows, or neon effects. Contrast comes from chroma against
  the canvas (dark) or inkiness against parchment (light), not emissive
  styling.
- Don't use a background lighter than `{surface.base}` inside the dark editor
  surface, nor darker than `{surface.base}` inside the light reading surface.
  Doing so reduces syntax-token contrast below designed levels.
  (Surface-raised is the deliberate exception, used only for hover/current-line
  marking, not bulk reading.)
- Don't apply the chrome accent to errors. The accent is the chrome identity —
  errors always use `{status.danger}`.
- Don't change `{ink.comment}` to anything brighter (dark) or darker (light)
  for comments. Comments must stay subordinate. If they feel too hard to read,
  increase the editor font size before touching the comment color.
- Do validate all color pairs against WCAG AA (4.5:1 normal text, 3:1 large
  text) when building derived UI. All readable text tokens (ink, muted-strong,
  subtle, syntax tiers) meet or exceed AA against their respective canvas. Only
  `{ink.faint}` is intentionally below AA — reserved for decorative/positional
  elements (line numbers, operators) that don't require text-level contrast. If
  you need a quiet tone on text the user actually reads, use `{ink.secondary}`,
  never `{ink.faint}`.
