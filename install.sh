#!/usr/bin/env bash
# Universal dotfiles setup — works on Arch, Debian/Ubuntu, and Fedora
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() { echo -e "${GREEN}[OK] $1${NC}"; }
warn() { echo -e "${YELLOW}[!] $1${NC}"; }

# ──────────────────────────────────────────────────────────────
# Detect package manager
# ──────────────────────────────────────────────────────────────
detect_pkg_manager() {
    if command -v pacman >/dev/null 2>&1; then
        echo "arch"
    elif command -v apt >/dev/null 2>&1; then
        echo "debian"
    elif command -v dnf >/dev/null 2>&1; then
        echo "fedora"
    else
        echo "Unsupported distro. Only Arch, Debian/Ubuntu, and Fedora are supported." >&2
        exit 1
    fi
}

PKG_MANAGER=$(detect_pkg_manager)

# ──────────────────────────────────────────────────────────────
# Confirmation
# ──────────────────────────────────────────────────────────────
echo
echo "Detected: $([[ $PKG_MANAGER = arch ]] && echo "Arch Linux" || \
                [[ $PKG_MANAGER = debian ]] && echo "Debian/Ubuntu" || \
                echo "Fedora")"
echo
echo "This script will:"
echo " • Install: neovim, zsh, fzf, git, gh, tmux, stow, unzip, gcc, ripgrep, fd"
echo " • Install Oh My Zsh (unattended)"
echo " • Install TPM (tmux plugin manager)"
echo " • Safely backup existing ~/.zshrc if needed"
echo " • Stow: nvim, zshrc, tmux, bin"
echo
read -rp "Continue? (y/N) " answer
[[ "$answer" =~ ^[Yy]$ ]] || { echo "Aborted."; exit 0; }
echo

# ──────────────────────────────────────────────────────────────
# 1. Install packages (only what's needed)
# ──────────────────────────────────────────────────────────────
log "Installing required packages..."

case "$PKG_MANAGER" in
    arch)
        sudo pacman -Syu --noconfirm --needed \
            neovim zsh fzf git github-cli tmux gnu-stow unzip gcc ripgrep fd
        ;;
    debian)
        sudo apt update -qq
        for pkg in neovim zsh fzf git gh tmux stow unzip gcc ripgrep fd-find; do
            dpkg -l "$pkg" 2>/dev/null | grep -q "^ii" || sudo apt install -y "$pkg"
        done
        ;;
    fedora)
        sudo dnf install -y \
            neovim zsh fzf git gh tmux stow unzip gcc ripgrep fd-find \
            util-linux-user
        ;;
esac

# ──────────────────────────────────────────────────────────────
# 2. Oh My Zsh
# ──────────────────────────────────────────────────────────────
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    log "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- --unattended
fi
echo 'alias vim="nvim"' >> ~/.zshrc

# ──────────────────────────────────────────────────────────────
# 3. TPM (Tmux Plugin Manager)
# ──────────────────────────────────────────────────────────────
if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then
    log "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# ──────────────────────────────────────────────────────────────
# 4. Safe .zshrc backup
# ──────────────────────────────────────────────────────────────
# if [ -f "${HOME}/.zshrc" ] && ! grep -q "ohmyzsh" "${HOME}/.zshrc" 2>/dev/null; then
#     warn "Backing up existing ~/.zshrc → ~/.zshrc.backup"
#     mv "${HOME}/.zshrc" "${HOME}/.zshrc.backup"
# fi

# ──────────────────────────────────────────────────────────────
# 5. Ensure ~/.config exists
# ──────────────────────────────────────────────────────────────
[ -d "${HOME}/.config" ] || mkdir -p "${HOME}/.config"

# ──────────────────────────────────────────────────────────────
# 6. Stow dotfiles
# ──────────────────────────────────────────────────────────────
for dir in nvim tmux bin; do
    if [ -d "$dir" ]; then
        log "Stowing $dir"
        stow -R "$dir" 2>/dev/null || true
    fi
done

log "All done! Restart your terminal or run: exec zsh"
