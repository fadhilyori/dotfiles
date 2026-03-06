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
- **Modern replacements**: eza -> ls, bat -> cat, plus ripgrep/fd/fzf tooling
- **Git workflow helpers**: Short aliases for status, diff, logs, staging, and branch work
- **Package management**: Smart apt aliases (apti, aptu, aptdu)
- **FZF integration**: Enhanced fuzzy completion

### Development Stack
- **Docker**: Container management aliases (dps, drun, dstop)
- **Node.js**: Enhanced npm commands (ni, nr, ns, nt)
- **Python**: Virtual environment helpers (venv, vact, vdeact)
- **Go**: Development workflow aliases (gob, gor, got)
- **PHP/Laravel**: Artisan shortcuts (art, laserve, lamigrate)

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
gst             # git status -sb
ga              # git add -A
gc "commit"     # git commit -m
gp              # git push
gds             # git diff --staged
git flow feature start my-feature
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
laserve         # php artisan serve
```

## Architecture

```
~/.dotfiles/
├── setup.sh              # Main setup/bootstrap script
├── .bash_config          # Main config (sourced)
├── .aliases.d/core.alias # All aliases (sourced)
├── .config/              # App configs (symlinked)
├── bin/                  # Utility scripts (symlinked)
├── .gitconfig            # Git config (symlinked)
└── AGENTS.md             # Repo guidance for coding agents
```

**Configuration Loading**: `.bashrc` → `.bash_config` → `.aliases.d/core.alias`

## Validation

There is no formal automated test suite in this repository. Use focused validation commands based on the files you changed.

### Shell Files
```bash
bash -n setup.sh
bash -n bin/npm-global-update
shellcheck .bash_config .aliases.d/core.alias bin/* setup.sh
```

### Setup Script Paths
```bash
bash ./setup.sh -h
bash ./setup.sh -s
bash ./setup.sh -p
bash ./setup.sh -l
```

### Config Validation
```bash
bash -lc 'source ./.bash_config'
prettier -c .prettierrc
```

### Single-Test Guidance
```bash
bash -n setup.sh                 # narrow check for the main installer
bash -n bin/uv-tool-update       # narrow check for one helper script
shellcheck .bash_config          # single-file lint for sourced Bash config
prettier -c .prettierrc          # single-file format check for JSON/JSONC config
```

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
