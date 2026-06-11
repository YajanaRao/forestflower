# Forest Flower Brave (Chromium) Theme

## Honest assessment

This applies a **minimal chrome tint** to Brave via the enterprise managed-policy
`BrowserThemeColor`. It is not full browser theming — it tints the toolbar/frame
with a subtle Material Design 3 (GM3) accent derived from the hex value. The
visual effect is barely perceptible, especially in dark mode.

Upstream Brave/Chromium does not provide a non-extension mechanism for full
surface theming (frame, toolbar, tab text, NTP). Omarchy solves this by
maintaining [`omarchy-chromium-bin`](https://github.com/basecamp/omarchy/issues/810)
— a micro-fork with patched `--set-user-color`, `--set-color-scheme`, and
`--set-color-variant` CLI flags. Forest Flower does not ship a browser fork.

If you want Brave to actually look like Forest Flower, the only upstream path is
a Chromium theme extension (Load unpacked at `brave://extensions`). This repo
does not ship one.

## What this does

Applies `BrowserThemeColor` from `DESIGN.md` → `colors.primary`:

| Variant              | `BrowserThemeColor` | DESIGN.md `primary` |
| -------------------- | ------------------- | ------------------- |
| `forestflower-night` | `#FFC600` (gold)    | Dark                |
| `forestflower-day`   | `#193549` (navy)    | Light               |

## Install

### macOS

```bash
# Night (default)
./install.sh

# Day
FF_BRAVE_VARIANT=day ./install.sh
```

The script writes the policy and attempts a live refresh:

```bash
defaults write com.brave.Browser BrowserThemeColor -string "#FFC600"
killall cfprefsd
open -b com.brave.Browser --args --refresh-platform-policy --no-startup-window
```

> `--refresh-platform-policy` requires Brave based on Chromium 141+. On older
> builds, restart Brave manually.

### Linux

```bash
sudo mkdir -p /etc/brave/policies/managed/
sudo cp extras/brave/forestflower-night.json /etc/brave/policies/managed/forestflower.json
# or day variant:
sudo cp extras/brave/forestflower-day.json /etc/brave/policies/managed/forestflower.json

# Refresh (Brave 141+ / Chromium 142+)
brave --refresh-platform-policy --no-startup-window
```

## Verify

Open `brave://policy` — `BrowserThemeColor` should appear with Status `OK`.
