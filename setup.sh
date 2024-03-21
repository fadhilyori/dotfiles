#!/bin/bash

# This script is used to setup my personal environment
# It will install dependencies and run stow command to create symlinks
# It will also install bash-it and nanorc if they are not installed

# Print usage if --help or -h is used
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    printf "Usage: setup.sh [--force]\n"
    printf "  --force  Force run as root\n"
    printf "  --help   Display this help message\n"
    exit 0
fi

# This script should run on non-root user, use --force to force run as root
if [ "$EUID" -eq 0 ] && [ "$1" != "--force" ]; then
    printf "=> Error: This script should not be run as root\n"
    exit 1
fi

# Install dependencies for different Linux distributions if they are not installed
# Package to install: stow nano git curl wget unzip zip htop zoxide bat eza diff-so-fancy

# Check if git is installed
if ! command -v git >/dev/null; then
    printf "=> Error: git is not installed\n"
    # Install git for different Linux distributions
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" = "opensuse-tumbleweed" ]; then
            sudo zypper install git
        elif [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
            sudo apt install git
        fi
    fi
fi

# Check if stow is installed
if ! command -v stow >/dev/null; then
    printf "=> Error: stow is not installed\n"
    # Install stow for different Linux distributions
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" = "opensuse-tumbleweed" ]; then
            sudo zypper install stow
        elif [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
            sudo apt install stow
        fi
    fi
fi

# Check if nano is installed
if ! command -v nano >/dev/null; then
    printf "=> Error: nano is not installed\n"
    # Install nano for different Linux distributions
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" = "opensuse-tumbleweed" ]; then
            sudo zypper install nano
        elif [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
            sudo apt install nano
        fi
    fi
fi

# Check if curl is installed
if ! command -v curl >/dev/null; then
    printf "=> Error: curl is not installed\n"
    # Install curl for different Linux distributions
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" = "opensuse-tumbleweed" ]; then
            sudo zypper install curl
        elif [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
            sudo apt install curl
        fi
    fi
fi

# Check if wget is installed
if ! command -v wget >/dev/null; then
    printf "=> Error: wget is not installed\n"
    # Install wget for different Linux distributions
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" = "opensuse-tumbleweed" ]; then
            sudo zypper install wget
        elif [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
            sudo apt install wget
        fi
    fi
fi

# Check if unzip and zip is installed
if ! command -v unzip >/dev/null || ! command -v zip >/dev/null; then
    printf "=> Error: unzip or zip is not installed\n"
    # Install unzip and zip for different Linux distributions
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" = "opensuse-tumbleweed" ]; then
            sudo zypper install unzip zip
        elif [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
            sudo apt install unzip zip
        fi
    fi
fi

# Check if htop is installed
if ! command -v htop >/dev/null; then
    printf "=> Error: htop is not installed\n"
    # Install htop for different Linux distributions
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" = "opensuse-tumbleweed" ]; then
            sudo zypper install htop
        elif [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
            sudo apt install htop
        fi
    fi
fi

# Check if zoxide is installed
if ! command -v z >/dev/null; then
    printf "=> Error: zoxide is not installed\n"
    # Install zoxide
    printf "=> Installing zoxide...\n"
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    printf "=> Installing zoxide...done\n\n"
fi

# Check if bat is installed

# Check if eza is installed
if ! command -v eza >/dev/null; then
    printf "=> Error: eza is not installed\n"
    # Install eza
    printf "=> Installing eza...\n"
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" = "opensuse-tumbleweed" ]; then
            sudo zypper install eza
        elif [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
            sudo mkdir -p /etc/apt/keyrings
            wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
            echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
            sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
            sudo apt update
            sudo apt install -y eza
        fi
    fi
    printf "=> Installing eza...done\n\n"
fi

# Check if diff-so-fancy is installed
# https://github.com/so-fancy/diff-so-fancy
# URL: https://github.com/so-fancy/diff-so-fancy/releases/download/v1.4.4/diff-so-fancy
if ! command -v diff-so-fancy >/dev/null; then
    printf "=> Error: diff-so-fancy is not installed\n"
    # Install diff-so-fancy
    printf "=> Installing diff-so-fancy...\n"
    curl -sSL https://github.com/so-fancy/diff-so-fancy/releases/download/v1.4.4/diff-so-fancy >~/bin/diff-so-fancy
    chmod +x ~/bin/diff-so-fancy
    printf "=> Installing diff-so-fancy...done\n\n"
fi

# Clone this repository if it is not cloned to ~/dotfiles
if [ ! -d ~/dotfiles ]; then
    printf "=> Cloning dotfiles...\n"
    git clone --depth=1 https://github.com/fadhilyori/dotfiles.git ~/dotfiles
    printf "=> Cloning dotfiles...done\n\n"
fi

# Install bash-it if it is not installed
# https://github.com/Bash-it/bash-it
if [ ! -d ~/.bash_it ]; then
    printf "=> Installing bash-it...\n"
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh --silent
    printf "=> Installing bash-it...done\n\n"
fi

# Install nanorc if it is not installed
# https://github.com/scopatz/nanorc
if [ ! -d ~/.nano ]; then
    printf "=> Installing nanorc...\n"
    curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
    printf "=> Installing nanorc...done\n\n"
fi

# Make directory
mkdir -p ~/bin ~/.config/htop ~/.bash_it/aliases ~/.ssh ~/Projects/Trustmedis

# Run stow command
stow . -t ~

# Show message to reload bash or open new terminal
printf "=> Please reload bash or open new terminal\n"
printf "=> You can also run the following command to reload bash\n"
printf "  source ~/.bashrc\n"
