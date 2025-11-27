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

# Parse arguments
AUTO_SETUP=false
PACKAGES_ONLY=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -s|--auto-setup) AUTO_SETUP=true; shift ;;
        -p|--packages-only) PACKAGES_ONLY=true; shift ;;
        -h|--help)
            echo "Usage: $0 [-s] [-p] [-h]"
            echo "  -s  Auto-setup bash and nano configurations"
            echo "  -p  Install packages only (skip stow and dotfiles setup)"
            echo "  -h  Show this help"
            exit 0
            ;;
        *) log_error "Unknown option: $1"; exit 1 ;;
    esac
done

# Install system packages
install_packages() {
    log_info "Installing required packages"
    local packages=("git" "curl" "stow")

    if command -v apt >/dev/null 2>&1; then
        sudo apt update && sudo apt install -y "${packages[@]}"
    else
        log_error "Unsupported system: apt package manager required"
        exit 1
    fi
}

# Install optional development tools
install_optional_tools() {
    log_info "Installing optional development tools"

    # Install starship
    if ! command_exists starship; then
        log_info "Installing Starship..."
        sudo apt install -y starship
    else
        log_success "Starship already installed"
    fi

    # Install FZF
    if ! command_exists fzf; then
        log_info "Installing FZF..."
        sudo apt install -y fzf
    else
        log_success "FZF already installed"
    fi

    # Install Bat
    if ! command_exists batcat; then
        log_info "Installing Bat..."
        sudo apt install -y bat
    else
        log_success "Bat already installed"
    fi

    # Install Ripgrep
    if ! command_exists rg; then
        log_info "Installing Ripgrep..."
        sudo apt-get install -y ripgrep
    else
        log_success "Ripgrep already installed"
    fi

    # Install git delta
    if ! command_exists delta; then
        log_info "Installing git delta..."
        sudo apt install -y git-delta
    else
        log_success "git delta already installed"
    fi

    # Install tree
    if ! command_exists tree; then
        log_info "Installing tree..."
        sudo apt install -y tree
    else
        log_success "tree already installed"
    fi

    # Install dnsutils (for dig command)
    if ! command_exists dig; then
        log_info "Installing dnsutils..."
        sudo apt install -y dnsutils
    else
        log_success "dnsutils already installed"
    fi

    # Install FFmpeg
    if ! command_exists ffmpeg; then
        log_info "Installing FFmpeg..."
        sudo apt install -y ffmpeg
    else
        log_success "FFmpeg already installed"
    fi

    # Install 7zip
    if ! command_exists 7z; then
        log_info "Installing 7zip..."
        sudo apt install -y p7zip-full
    else
        log_success "7zip already installed"
    fi

    # Install jq
    if ! command_exists jq; then
        log_info "Installing jq..."
        sudo apt install -y jq
    else
        log_success "jq already installed"
    fi

    # Install poppler-utils
    if ! command_exists pdftotext; then
        log_info "Installing poppler-utils..."
        sudo apt install -y poppler-utils
    else
        log_success "poppler-utils already installed"
    fi

    # Install fd-find
    if ! command_exists fd; then
        log_info "Installing fd-find..."
        sudo apt install -y fd-find
    else
        log_success "fd-find already installed"
    fi

    # Install zoxide
    if ! command_exists zoxide; then
        log_info "Installing zoxide..."
        sudo apt install -y zoxide
    else
        log_success "zoxide already installed"
    fi

    # Install ImageMagick
    if ! command_exists convert; then
        log_info "Installing ImageMagick..."
        sudo apt install -y imagemagick
    else
        log_success "ImageMagick already installed"
    fi

    # Install yazi using snap
    if ! command_exists yazi; then
        log_info "Installing yazi..."
        sudo snap install yazi --classic
    else
        log_success "yazi already installed"
    fi

    # Install Kitty terminal
    if ! command_exists kitty; then
        log_info "Installing Kitty terminal..."
        sudo apt install -y kitty
    else
        log_success "Kitty terminal already installed"
    fi

    # Install duf (enhanced df replacement)
    if ! command_exists duf; then
        log_info "Installing duf..."
        sudo apt install -y duf
    else
        log_success "duf already installed"
    fi

    # Install ncdu (enhanced du replacement)
    if ! command_exists ncdu; then
        log_info "Installing ncdu..."
        sudo apt install -y ncdu
    else
        log_success "ncdu already installed"
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

    log_info "Installing fonts using apt..."
    sudo apt update
    sudo apt install -y "${fonts[@]}"

    # Refresh font cache
    if command -v fc-cache >/dev/null 2>&1; then
        fc-cache -f -v
        log_success "Font cache refreshed"
    fi

    log_success "Fonts installation completed"
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

    if stow . -t "$HOME" --no-folding 2>/dev/null; then
        log_success "Symlinks created successfully"
    else
        log_error "Failed to create symlinks"
        return 1
    fi
}

# Main function
main() {
    if [ "$PACKAGES_ONLY" = true ]; then
        log_info "Starting packages-only installation"
    else
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

    # Install optional development tools
    install_optional_tools

    # Install fonts
    install_fonts

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