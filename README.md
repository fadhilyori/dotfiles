# dotfiles

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Shell: Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash)
![Platform: Linux](https://img.shields.io/badge/Platform-Linux-FCC624?logo=linux)

This repository contains my personal dotfiles and configurations for my development environment. The dotfiles and configurations are managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Quick Start

```bash
curl -sSL https://raw.githubusercontent.com/fadhilyori/.dotfiles/main/setup.sh | bash
```

## Features

### Core Tools
- **Modern replacements**: eza → ls, bat → cat, rg → grep (with fallbacks)
- **Git Flow integration**: Complete workflow aliases
- **Package management**: Smart apt aliases (apti, aptu, aptdu)
- **FZF integration**: Enhanced fuzzy completion

### Development Stack
- **Docker**: Container management aliases (dps, drun, dstop)
- **Node.js**: Enhanced npm commands (ni, nr, ns, nt)
- **Python**: Virtual environment helpers (venv, vact, vdeact)
- **Go**: Development workflow aliases (gob, gor, got)
- **PHP/Laravel**: Artisan shortcuts (art, serve, migrate)

### System Administration
- **File operations**: Quick disk usage and file management
- **Network diagnostics**: IP info, port checking, ping utilities
- **Process monitoring**: Enhanced system visibility

## Requirements

- **Ubuntu/Debian** with apt package manager
- **Bash** shell with sudo access
- **Internet connection** for package downloads

## Installation

### Automated Installation
```bash
curl -sSL https://raw.githubusercontent.com/fadhilyori/.dotfiles/main/setup.sh | bash
```

### Manual Installation
```bash
git clone https://github.com/fadhilyori/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh -s    # Auto-setup bash and nano
exec $SHELL      # Reload shell
```

## Configuration Setup

### Bash Configuration (.bash_config)

#### Automatic Configuration
```bash
./setup.sh -s    # Auto-setup bash and nano configurations
```

#### Manual Configuration
Add this to your `~/.bashrc`:
```bash
# DOTFILES_CONFIG - Load dotfiles configuration
if [ -f "$HOME/.dotfiles/.bash_config" ]; then
    . "$HOME/.dotfiles/.bash_config"
fi
```

#### Apply Changes
```bash
source ~/.bashrc    # OR
exec $SHELL         # Start a new shell session
```


## Usage Examples

### Git Workflow
```bash
gs              # git status
ga              # git add .
gc "commit"     # git commit -m
gp              # git push
gfs feature     # git flow feature start
```

### Package Management
```bash
apti package    # sudo apt install
aptu            # sudo apt update && upgrade
apts query      # apt search
```

### Docker
```bash
dps             # docker ps -a
drun nginx      # docker run -it --rm nginx
dstop           # stop all containers
```

### Development
```bash
venv myenv      # python3 -m venv myenv
vact            # source .venv/bin/activate
ni express      # npm install express
nr dev          # npm run dev
gob             # go build
art serve       # php artisan serve
```

## Architecture

```
~/.dotfiles/
├── .bash_config          # Main config (sourced)
├── .aliases.d/core.alias # All aliases (sourced)
├── .config/              # App configs (symlinked)
├── bin/                  # Utility scripts (symlinked)
└── .gitconfig           # Git config (symlinked)
```

**Configuration Loading**: `.bashrc` → `.bash_config` → `.aliases.d/core.alias`

## Troubleshooting

**Aliases not working?**
```bash
source ~/.dotfiles/.bash_config
```

**Stow issues?**
```bash
cd ~/.dotfiles
stow -D . -t "$HOME"  # Remove symlinks
stow . -t "$HOME" --no-folding  # Recreate
```

## Customization

**Add aliases**: Edit `~/.dotfiles/.aliases.d/core.alias`
```bash
alias myproject='cd ~/projects/my-project'
alias weather='curl wttr.in'
```

**Environment variables**: Edit `~/.dotfiles/.bash_config`
```bash
export EDITOR=vim
export PATH="$HOME/.local/bin:$PATH"
```

## Uninstallation

```bash
cd ~/.dotfiles && stow -D . -t "$HOME"
rm -rf ~/.dotfiles
# Remove dotfiles config line from ~/.bashrc
```

## License

[MIT License](LICENSE)