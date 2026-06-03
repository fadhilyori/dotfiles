#!/bin/bash

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { printf "${BLUE}[INFO]${NC} %s\n" "$*"; }
log_success() { printf "${GREEN}[SUCCESS]${NC} %s\n" "$*"; }
log_error() { printf "${RED}[ERROR]${NC} %s\n" "$*"; }
log_warning() { printf "${YELLOW}[WARNING]${NC} %s\n" "$*"; }

command_exists() { command -v "$1" >/dev/null 2>&1; }

# Detect distribution and set package management globals
detect_distro() {
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
    else
        log_error "Cannot detect distribution: /etc/os-release not found"
        exit 1
    fi

    # Detect Fedora or Debian-based
    case "$ID" in
        fedora)
            DISTRO="fedora"
            PKG_MANAGER="dnf"
            ;;
        debian|ubuntu|pop|mint)
            DISTRO="debian"
            PKG_MANAGER="apt"
            ;;
        *)
            # Check ID_LIKE for derived distributions
            case "$ID_LIKE" in
                *fedora*)
                    DISTRO="fedora"
                    PKG_MANAGER="dnf"
                    ;;
                *debian*)
                    DISTRO="debian"
                    PKG_MANAGER="apt"
                    ;;
                *)
                    log_error "Unsupported distribution: $ID (ID_LIKE=$ID_LIKE)"
                    exit 1
                    ;;
            esac
            ;;
    esac

    log_info "Detected distro: $DISTRO ($ID), using $PKG_MANAGER"
}

# Package name mapping (Debian → Fedora)
declare -A PKG_MAP=(
    [git]="git"
    [curl]="curl"
    [stow]="stow"
    [starship]="starship"
    [fzf]="fzf"
    [bat]="bat"
    [ripgrep]="ripgrep"
    [git-delta]="git-delta"
    [tree]="tree"
    [dnsutils]="bind-utils"
    [ffmpeg]="ffmpeg-free"
    [p7zip-full]="p7zip"
    [jq]="jq"
    [poppler-utils]="poppler-utils"
    [fd-find]="fd-find"
    [zoxide]="zoxide"
    [imagemagick]="ImageMagick"
    [kitty]="kitty"
    [duf]="duf"
    [ncdu]="ncdu"
    [wl-clipboard]="wl-clipboard"
    [gnupg2]="gnupg2"
    [fonts-adobe-sourcesans3]="adobe-source-sans-3-fonts"
    [fonts-cantarell]="abattis-cantarell-fonts"
    [fonts-cascadia-code]="cascadia-code-fonts"
    [fonts-dejavu-core]="dejavu-sans-mono-fonts"
    [fonts-firacode]="fira-code-fonts"
    [fonts-font-awesome]="fontawesome-fonts"
    [fonts-inter]="google-inter-fonts"
    [fonts-jetbrains-mono]="jetbrains-mono-fonts"
    [fonts-noto]="google-noto-fonts"
)

# Resolve package name based on distribution
resolve_pkg() {
    local deb_name="$1"
    if [[ "$DISTRO" == "fedora" ]] && [[ -v PKG_MAP[$deb_name] ]]; then
        echo "${PKG_MAP[$deb_name]}"
    else
        echo "$deb_name"
    fi
}

# Install packages (accepts multiple package name arguments)
pkg_install() {
    local resolved=()
    local pkg
    for pkg in "$@"; do
        resolved+=("$(resolve_pkg "$pkg")")
    done
    if [[ "$DISTRO" == "fedora" ]]; then
        sudo dnf install -y "${resolved[@]}"
    else
        sudo apt install -y "${resolved[@]}"
    fi
}

# Update package lists
pkg_update() {
    if [[ "$DISTRO" == "fedora" ]]; then
        # dnf check-update exits 100 when updates are available (not an error)
        sudo dnf check-update || [[ $? -eq 100 ]]
    else
        sudo apt update -qq
    fi
}

# Parse arguments
AUTO_SETUP=false
PACKAGES_ONLY=false
SYMLINKS_ONLY=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -s|--auto-setup) AUTO_SETUP=true; shift ;;
        -p|--packages-only) PACKAGES_ONLY=true; shift ;;
        -l|--symlinks-only) SYMLINKS_ONLY=true; shift ;;
        -h|--help)
            echo "Usage: $0 [-s] [-p] [-l] [-h]"
            echo "  -s  Auto-setup bash and nano configurations"
            echo "  -p  Install packages only (skip stow and dotfiles setup)"
            echo "  -l  Symlinks only (skip package installation)"
            echo "  -h  Show this help"
            exit 0
            ;;
        *) log_error "Unknown option: $1"; exit 1 ;;
    esac
done

# Detect distro as early as possible
detect_distro

# Install system packages
install_packages() {
    log_info "Installing required packages"
    pkg_install git curl stow
}

# Install optional development tools
install_optional_tools() {
    log_info "Installing optional development tools"

    declare -A tools=(
        [starship]="starship"
        [fzf]="fzf"
        [batcat]="bat"
        [rg]="ripgrep"
        [delta]="git-delta"
        [tree]="tree"
        [dig]="dnsutils"
        [ffmpeg]="ffmpeg"
        [7z]="p7zip-full"
        [jq]="jq"
        [pdftotext]="poppler-utils"
        [fd]="fd-find"
        [zoxide]="zoxide"
        [convert]="imagemagick"
        [kitty]="kitty"
        [duf]="duf"
        [ncdu]="ncdu"
        [wl-copy]="wl-clipboard"
    )

    for cmd in "${!tools[@]}"; do
        local check_cmd="$cmd"
        # On Fedora, bat binary is named 'bat', not 'batcat'
        [[ "$DISTRO" == "fedora" && "$cmd" == "batcat" ]] && check_cmd="bat"

        if ! command_exists "$check_cmd"; then
            log_info "Installing ${tools[$cmd]}..."
            pkg_install "${tools[$cmd]}" || log_warning "Failed to install ${tools[$cmd]}"
        else
            log_success "${tools[$cmd]} already installed"
        fi
    done

    if ! command_exists yazi; then
        log_info "Installing yazi..."
        if [[ "$DISTRO" == "fedora" ]]; then
            # Fedora has yazi in repos
            pkg_install "yazi"
        else
            # Debian: use snap
            sudo snap install yazi --classic
        fi
    else
        log_success "yazi already installed"
    fi

    if ! command_exists eza; then
        install_eza
    else
        log_success "eza already installed"
    fi
}

install_eza() {
    log_info "Installing eza..."
    if [[ "$DISTRO" == "fedora" ]]; then
        # Fedora: available directly in repos
        pkg_install "eza"
    else
        # Debian: GPG key + custom apt repo
        local gpg_keyring="/etc/apt/keyrings/gierens.gpg"
        local gpg_src="https://raw.githubusercontent.com/eza-community/eza/main/deb.asc"

        sudo apt install -y gnupg2
        sudo mkdir -p /etc/apt/keyrings

        local key_temp="$(mktemp)"
        if ! wget -qO "$key_temp" "$gpg_src"; then
            log_error "Failed to download eza GPG key"
            rm -f "$key_temp"
            return 1
        fi

        if ! sudo gpg --dearmor -o "$gpg_keyring" "$key_temp" 2>/dev/null; then
            log_error "Failed to process eza GPG key"
            rm -f "$key_temp"
            return 1
        fi
        rm -f "$key_temp"

        echo "deb [signed-by=$gpg_keyring] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list >/dev/null
        sudo chmod 644 "$gpg_keyring" /etc/apt/sources.list.d/gierens.list
        sudo apt install -y eza
    fi
}

# Install fonts
install_fonts() {
    log_info "Installing fonts"

    local fonts=(
        "fonts-adobe-sourcesans3"
        "fonts-cantarell"
        "fonts-cascadia-code"
        "fonts-dejavu-core"
        "fonts-firacode"
        "fonts-font-awesome"
        "fonts-inter"
        "fonts-jetbrains-mono"
        "fonts-noto"
    )

    log_info "Installing fonts..."
    pkg_install "${fonts[@]}"

    # Refresh font cache
    if command -v fc-cache >/dev/null 2>&1; then
        fc-cache -f -v
        log_success "Font cache refreshed"
    fi

    log_success "Fonts installation completed"
}

# Install nano syntax highlighting
install_nano_syntax() {
    log_info "Installing nano syntax highlighting"

    if [ -d "$HOME/.nano" ]; then
        log_success "nano syntax highlighting already installed"
        return 0
    fi

    local nano_syntax_install="/tmp/nano-syntax-install.sh"
    if curl -s -o "$nano_syntax_install" https://raw.githubusercontent.com/galenguyer/nano-syntax-highlighting/master/install.sh && bash "$nano_syntax_install"; then
        log_success "nano syntax highlighting installed successfully"
    else
        log_warning "Failed to install nano syntax highlighting"
    fi
    rm -f "$nano_syntax_install"
}

# Clone or update dotfiles
setup_dotfiles() {
    if [ ! -d "$HOME/.dotfiles" ]; then
        log_info "Cloning dotfiles repository"
        git clone --depth=1 https://github.com/fadhilyori/.dotfiles.git "$HOME/.dotfiles"
        log_success "Dotfiles cloned successfully"
    else
        log_info "Updating dotfiles"
        cd "$HOME/.dotfiles" || exit 1
        if git pull origin main; then
            log_success "Dotfiles updated successfully"
        else
            log_warning "Failed to update dotfiles"
        fi
    fi
}

# Configure .bashrc if requested
setup_bashrc() {
    if [ "$AUTO_SETUP" = true ]; then
        log_info "Configuring .bashrc"

        # Check if .bashrc exists, create it if it doesn't
        if [ ! -f "$HOME/.bashrc" ]; then
            log_info ".bashrc not found, creating new file"
            touch "$HOME/.bashrc"
        fi

        if grep -q "DOTFILES_CONFIG" "$HOME/.bashrc" 2>/dev/null; then
            log_warning "Dotfiles already configured in .bashrc"
            return 0
        fi

        # Add configuration to .bashrc
        cat >> "$HOME/.bashrc" << 'EOF'

# DOTFILES_CONFIG - Load dotfiles configuration
if [ -f "$HOME/.dotfiles/.bash_config" ]; then
    . "$HOME/.dotfiles/.bash_config"
fi
EOF

        log_success "Added dotfiles configuration to .bashrc"
    fi
}

# Configure .nanorc if requested
setup_nanorc() {
    if [ "$AUTO_SETUP" = true ]; then
        log_info "Configuring .nanorc"

        # Check if .nanorc exists, create it if it doesn't
        if [ ! -f "$HOME/.nanorc" ]; then
            log_info ".nanorc not found, creating new file"
            touch "$HOME/.nanorc"
        fi

        if grep -q '\.dotfiles/\.nanorc' "$HOME/.nanorc" 2>/dev/null; then
            log_warning "Dotfiles already configured in .nanorc"
            return 0
        fi

        # Add configuration to .nanorc
        cat >> "$HOME/.nanorc" << 'EOF'

# DOTFILES_NANO - Load dotfiles nano configuration
include "~/.dotfiles/.nanorc"
EOF

        log_success "Added dotfiles configuration to .nanorc"
    fi
}

# Create necessary directories
setup_directories() {
    log_info "Creating necessary directories"
    
    # Create nano backup directory
    mkdir -p "$HOME/.cache/nano/backups"
    
    # Create bin directory if it doesn't exist
    mkdir -p "$HOME/bin"
}

# Create symlinks
setup_symlinks() {
    log_info "Creating symlinks"
    cd "$HOME/.dotfiles" || {
        log_error "Failed to change to dotfiles directory"
        return 1
    }

    if stow . -t "$HOME" --no-folding; then
        log_success "Symlinks created successfully"
    else
        log_error "Failed to create symlinks"
        return 1
    fi
}

# Main function
main() {
    if [ "$SYMLINKS_ONLY" = true ]; then
        log_info "Starting symlinks-only setup"
        setup_dotfiles
        setup_directories
        setup_bashrc
        setup_nanorc
        setup_symlinks

        printf '\n%s\n' "${GREEN}Symlinks setup completed!${NC}"
        printf "Next step: Reload shell with 'exec \$SHELL' or 'source ~/.bashrc'\n"
        log_success "Done!"
        return 0
    fi

    if [ "$PACKAGES_ONLY" = false ]; then
        log_info "Starting dotfiles setup"
    fi

    # Check dependencies
    local need_packages=false
    for cmd in git curl; do
        if ! command_exists "$cmd"; then
            need_packages=true
            break
        fi
    done

    if [ "$need_packages" = true ] || ! command_exists stow; then
        install_packages
    fi

    if [ "$PACKAGES_ONLY" = false ]; then
        pkg_update
    fi

    # Install optional development tools
    install_optional_tools

    # Install fonts
    install_fonts

    # Install nano syntax highlighting
    install_nano_syntax

    if [ "$PACKAGES_ONLY" = true ]; then
        printf '\n%s\n' "${GREEN}Packages installation completed!${NC}"
        printf "✅ Required and optional packages installed successfully\n"
        printf "💡 Tip: Run without -p flag to setup dotfiles and stow configuration\n"
    else
        setup_dotfiles
        setup_directories
        setup_bashrc
        setup_nanorc
        setup_symlinks

        printf '\n%s\n' "${GREEN}Setup completed!${NC}"

        if [ "$AUTO_SETUP" = true ]; then
            printf "✅ .bashrc and .nanorc configured automatically\n"
            printf "Next step: Reload shell with 'exec \$SHELL' or 'source ~/.bashrc'\n"
        else
            printf "Next steps:\n"
            printf "1. Add this to ~/.bashrc:\n"
            printf "   # DOTFILES_CONFIG - Load dotfiles configuration\n"
            printf "   if [ -f \"\$HOME/.dotfiles/.bash_config\" ]; then\n"
            printf "       . \"\$HOME/.dotfiles/.bash_config\"\n"
            printf "   fi\n\n"
            printf "2. For nano editor, add this to ~/.nanorc:\n"
            printf "   include \"~/.dotfiles/.nanorc\"\n\n"
            printf "3. Reload shell with 'exec \$SHELL' or 'source ~/.bashrc'\n"
            printf "💡 Tip: Use -s flag next time to auto-setup bash and nano\n"
        fi
    fi

    log_success "Done!"
}

main "$@"
