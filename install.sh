#!/bin/bash
set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXTRAS_DIR="$SCRIPT_DIR/extras"
OPENCODE_THEMES_DIR="$SCRIPT_DIR/.opencode/themes"
DRY_RUN=false

usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Install Forest Flower configurations for various tools"
    echo ""
    echo "Options:"
    echo "  --dry-run    Show what would be installed without making changes"
    echo "  -h, --help   Show this help message"
    echo ""
    echo "This installs:"
    echo "  - OpenCode themes (forestflower, forestflower-day, forestflower-night)"
    echo "  - Starship prompt themes (forestflower-day, forestflower-night)"
    echo "  - Ghostty terminal themes (referenced, not copied)"
    echo "  - Slack sidebar themes (referenced, not copied)"
    echo "  - Brave (Chromium) chrome theme via managed policy"
    echo ""
    echo "Environment:"
    echo "  FF_BRAVE_VARIANT   Brave theme variant: night (default) or day"
}

log_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

log_success() {
    echo -e "${GREEN}✅${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}⚠${NC} $1"
}

log_error() {
    echo -e "${RED}❌${NC} $1"
}

backup_if_exists() {
    local target="$1"
    if [ -f "$target" ] || [ -d "$target" ]; then
        local backup="${target}.backup.$(date +%Y%m%d_%H%M%S)"
        if [ "$DRY_RUN" = false ]; then
            mv "$target" "$backup"
            log_warn "Backed up existing config to $backup"
        else
            log_info "Would backup existing config to $backup"
        fi
    fi
}

copy_file() {
    local src="$1"
    local dst="$2"

    if [ ! -f "$src" ]; then
        log_error "Source file not found: $src"
        return 1
    fi

    if [ "$DRY_RUN" = true ]; then
        log_info "Would copy: $src → $dst"
    else
        mkdir -p "$(dirname "$dst")"
        cp "$src" "$dst"
        log_success "Installed: $dst"
    fi
}

install_opencode_themes() {
    echo ""
    log_info "Installing OpenCode themes..."

    local target_dir="$HOME/.config/opencode/themes"

    if [ "$DRY_RUN" = false ]; then
        mkdir -p "$target_dir"
    fi

    # Install combined theme
    if [ -f "$OPENCODE_THEMES_DIR/forestflower.json" ]; then
        copy_file "$OPENCODE_THEMES_DIR/forestflower.json" "$target_dir/forestflower.json"
    else
        log_warn "Combined theme not found at $OPENCODE_THEMES_DIR/forestflower.json"
    fi

    # Also install individual variants for backward compatibility
    if [ -f "$OPENCODE_THEMES_DIR/forestflower-day.json" ]; then
        copy_file "$OPENCODE_THEMES_DIR/forestflower-day.json" "$target_dir/forestflower-day.json"
    fi

    if [ -f "$OPENCODE_THEMES_DIR/forestflower-night.json" ]; then
        copy_file "$OPENCODE_THEMES_DIR/forestflower-night.json" "$target_dir/forestflower-night.json"
    fi

    log_success "OpenCode themes installed"
    log_info "To use: set 'theme': 'forestflower' in ~/.config/opencode/tui.json"
}

install_starship_configs() {
    echo ""
    log_info "Installing Starship prompt configs..."

    if [ -f "$EXTRAS_DIR/starship/forestflower-day.toml" ]; then
        copy_file "$EXTRAS_DIR/starship/forestflower-day.toml" "$HOME/.config/starship-forestflower-day.toml"
    fi

    if [ -f "$EXTRAS_DIR/starship/forestflower-night.toml" ]; then
        copy_file "$EXTRAS_DIR/starship/forestflower-night.toml" "$HOME/.config/starship-forestflower-night.toml"
    fi

    log_success "Starship configs installed"
    log_info "To use: set 'preset' in ~/.config/starship.toml to point to one of these files"
}

show_ghostty_info() {
    echo ""
    log_info "Ghostty terminal theme"

    if [ -d "$EXTRAS_DIR/ghostty" ]; then
        log_success "Ghostty themes available at: $EXTRAS_DIR/ghostty/"
        log_info "Add to your ghostty config:"
        log_info "  theme = forestflower-night  # or forestflower-day"
    else
        log_warn "Ghostty themes not found at $EXTRAS_DIR/ghostty/"
    fi
}

show_slack_info() {
    echo ""
    log_info "Slack sidebar theme"

    if [ -d "$EXTRAS_DIR/slack" ]; then
        log_success "Slack themes available at: $EXTRAS_DIR/slack/"
        log_info "Copy the contents of forestflower-day or forestflower-night into Slack preferences"
    else
        log_warn "Slack themes not found at $EXTRAS_DIR/slack/"
    fi
}

install_brave_theme() {
    echo ""
    log_info "Installing Brave (Chromium) theme..."

    # Source of truth: DESIGN.md colors.primary. Variant defaults to night.
    local variant="${FF_BRAVE_VARIANT:-night}"
    local theme_file="$EXTRAS_DIR/brave/forestflower-${variant}.json"

    if [ ! -f "$theme_file" ]; then
        log_warn "Brave: unknown variant '${variant}' (no $theme_file); skipping"
        return
    fi

    local theme_color
    theme_color=$(plutil -extract BrowserThemeColor raw -o - "$theme_file")

    if [ "$(uname)" = "Darwin" ]; then
        if [ "$DRY_RUN" = true ]; then
            log_info "Would set com.brave.Browser BrowserThemeColor=$theme_color"
            return
        fi
        defaults write com.brave.Browser BrowserThemeColor -string "$theme_color"
        killall cfprefsd 2>/dev/null || true
        # Attempt live refresh via --refresh-platform-policy (requires Brave
        # based on Chromium 141+; gracefully ignored on older builds).
        open -b com.brave.Browser --args --refresh-platform-policy --no-startup-window 2>/dev/null || true
        log_success "Brave theme (${variant}) applied: BrowserThemeColor=$theme_color"
        log_info "Verify at brave://policy"
    else
        log_info "On Linux, install the Brave policy with:"
        log_info "  sudo mkdir -p /etc/brave/policies/managed/"
        log_info "  sudo cp $theme_file /etc/brave/policies/managed/forestflower.json"
        log_info "Then restart Brave. Verify at brave://policy"
    fi
}

print_summary() {
    echo ""
    echo "=========================================="
    if [ "$DRY_RUN" = true ]; then
        echo "DRY RUN COMPLETE"
    else
        echo "INSTALLATION COMPLETE"
    fi
    echo "=========================================="
    echo ""
    echo "Installed configs:"
    echo "  • OpenCode themes → ~/.config/opencode/themes/"
    echo "  • Starship prompt → ~/.config/starship-forestflower-{day,night}.toml"
    echo "  • Brave theme → com.brave.Browser policy (macOS) / see notes (Linux)"
    echo ""
    echo "Referenced (not copied - use directly from repo):"
    echo "  • Ghostty terminal themes → $EXTRAS_DIR/ghostty/"
    echo "  • Slack sidebar colors → $EXTRAS_DIR/slack/"
    echo ""
    echo "To apply changes:"
    echo "  1. Restart OpenCode instances (if running)"
    echo "  2. Set 'theme': 'forestflower' in ~/.config/opencode/tui.json"
    echo "  3. Reload Starship config: eval \$(starship init \$SHELL)"
    echo ""
}

main() {
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --dry-run)
                DRY_RUN=true
                shift
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
    done

    echo "🌺 Forest Flower Config Installer 🌺"
    if [ "$DRY_RUN" = true ]; then
        echo -e "${YELLOW}(DRY RUN - no changes will be made)${NC}"
    fi
    echo ""

    install_opencode_themes
    install_starship_configs
    show_ghostty_info
    show_slack_info
    install_brave_theme
    print_summary
}

main "$@"
