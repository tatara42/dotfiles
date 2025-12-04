#!/usr/bin/env bash
# Minimal & safe dotfiles setup — exactly your commands + confirmation

set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log()  { echo -e "${GREEN}[OK] $1${NC}"; }
warn() { echo -e "${YELLOW}[!] $1${NC}"; }

# ──────────────────────────────────────────────────────────────
# Confirmation prompt
# ──────────────────────────────────────────────────────────────
echo
echo "This script will:"
echo "  • Install: neovim zsh fzf git gh tmux stow unzip gcc"
echo "  • Install Oh My Zsh"
echo "  • Install TPM (tmux plugin manager)"
echo "  • Backup and replace ~/.zshrc if needed"
echo "  • Stow: nvim, zshrc, tmux, bin"
echo
read -rp "Continue? (y/N) " answer
if [[ ! "$answer" =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 0
fi
echo

# ──────────────────────────────────────────────────────────────
# 1. Install packages (only if missing)
# ──────────────────────────────────────────────────────────────
log "Installing required packages..."
sudo apt update -qq
for pkg in neovim zsh fzf git gh tmux stow unzip gcc; do
    dpkg -l "$pkg" 2>/dev/null | grep -q "^ii" || sudo apt install -y "$pkg"
done

# ──────────────────────────────────────────────────────────────
# 2. Oh My Zsh
# ──────────────────────────────────────────────────────────────
[ -d "${HOME}/.oh-my-zsh" ] || {
    log "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- --unattended
}

# ──────────────────────────────────────────────────────────────
# 3. TPM
# ──────────────────────────────────────────────────────────────
[ -d "${HOME}/.tmux/plugins/tpm" ] || {
    log "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

# ──────────────────────────────────────────────────────────────
# 4. Safe .zshrc handling
# ──────────────────────────────────────────────────────────────
if [ -f "${HOME}/.zshrc" ] && ! grep -q "ohmyzsh" "${HOME}/.zshrc" 2>/dev/null; then
    warn "Backing up existing .zshrc → ~/.zshrc.backup"
    mv "${HOME}/.zshrc" "${HOME}/.zshrc.backup"
fi

# ──────────────────────────────────────────────────────────────
# 5. Create ~/.config if missing
# ──────────────────────────────────────────────────────────────
[ -d "${HOME}/.config" ] || mkdir -p "${HOME}/.config"

# ──────────────────────────────────────────────────────────────
# 6. Stow
# ──────────────────────────────────────────────────────────────
for dir in nvim zshrc tmux bin; do
    [ -d "$dir" ] && {
        log "Stowing $dir"
        stow -R "$dir" 2>/dev/null || true
    }
done

log "All done! Restart your terminal or run 'exec zsh'"
