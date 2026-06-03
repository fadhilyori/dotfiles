# dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```bash
git clone https://github.com/fadhilyori/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh -s    # Auto-setup bash and nano
exec $SHELL      # Reload shell
```

Supports **Ubuntu/Debian** (`apt`) and **Fedora** (`dnf`). Requires **Bash** and sudo access. Internet connection required to download packages.

## Configuration

### Bash (.bash_config)

Quick setup (sets up both Bash and Nano):
```bash
./setup.sh -s
```

Or manually — add to `~/.bashrc`:
```bash
if [ -f "$HOME/.dotfiles/.bash_config" ]; then
    . "$HOME/.dotfiles/.bash_config"
fi
```

Then run `source ~/.bashrc` or `exec $SHELL`.

Load order: `.bashrc` → `.bash_config` → `.aliases.d/*.alias`.

### Nano (.nanorc)

Configured automatically via `./setup.sh -s`. Includes syntax highlighting for 30+ languages.

To set up manually, add to `~/.nanorc`:
```bash
include "~/.dotfiles/.nanorc"
```

### GNU Stow

All config files are symlinked into place using [GNU Stow](https://www.gnu.org/software/stow/). The `.stow-local-ignore` file controls what gets excluded from symlinking.

```bash
make stow    # Symlinks everything (runs: stow --no-folding .)
```

Stow packages:
- `.config/` → `~/.config/` (app configs)
- `.local/`  → `~/.local/`  (KDE profiles, color schemes)
- `bin/`     → `~/bin/`     (utility scripts)
- `.gitconfig` → `~/.gitconfig`

### Other Configs

| File | Purpose |
|------|---------|
| `.inputrc` | Readline keybindings (vi mode, history search) |
| `.prettierrc.json` | Code formatter defaults |
| `.ansible.cfg` | Ansible global configuration |

## Cheatsheet — Aliases & Commands

### Safety
```bash
rm -I, cp -i, mv -i    # Confirm before overwriting
```

### File & Directory
```bash
ls, ll               # eza with icons (falls back to plain ls)
cat                  # bat (falls back to plain cat)
cd                   # z (zoxide, if available)
cdi                  # zi (interactive directory selection)
.. / ...             # cd shortcuts
```

### Editor
```bash
v, vi, vim           # nvim (if available)
```

### Git
```bash
gst                  # git status -sb
ga                   # git add -A
gc "msg"             # git commit -m
gp                   # git push
gds                  # git diff --staged
```

### Package Management
```bash
apti package         # sudo apt install
aptu                 # sudo apt update && upgrade
aptdu                # sudo apt dist-upgrade
apts query           # apt search
aptr package         # sudo apt remove
aptc                 # autoremove && autoclean
aptsh package        # apt show
```

### Docker
```bash
dps                  # docker ps -a
drun image           # docker run -it --rm
dstop                # stop all containers
dimg                 # docker images
drma                 # remove stopped containers
drmi                 # remove dangling images
dvol / dnet          # list volumes / networks
dexec container cmd  # docker exec -it
dlog container       # docker logs -f
doco                 # docker compose
dcup / dcdown        # compose up -d / down
dcps / dclog         # compose ps / logs -f
```

### Python
```bash
py                   # python3
pip                  # pip3
venv name            # python3 -m venv
vact                 # activate venv (auto-finds .venv/venv)
mkvenv name          # create + activate venv in one step
vwhich               # show current venv path
vdeact               # deactivate
pipup / pipr / pipf  # pip utilities
```

### Node.js
```bash
ni package           # npm install
nr script            # npm run
ns / nt              # npm start / test
nbuild / ndev        # npm build / dev
nout                 # list outdated global packages
```

### Go
```bash
gob                  # go build
gor                  # go run
got                  # go test
gofmt / govet        # go fmt / vet
```

### PHP / Laravel
```bash
art cmd              # php artisan
laserve              # php artisan serve
lamigrate / lafresh  # artisan migrate / migrate:fresh
latinker / lacache   # artisan tinker / cache ops
```

### System
```bash
df / dfh             # duf (disk usage, falls back to df -h)
du                   # ncdu (interactive disk usage)
dush                 # directory sizes (sorted)
lsbig                # largest files in current dir
myip / myipinfo      # public IP info
ports                # listening ports (ss)
psa / psg pattern    # ps aux / grep process
memh                 # memory usage summary
```

### Dotfiles
```bash
dotfiles             # cd ~/.dotfiles
dotfiles-update      # git pull in dotfiles repo
```

### Clipboard (Wayland)
```bash
copy                 # wl-copy (copy to clipboard)
paste                # wl-paste (paste from clipboard)
```

### Image Preview
```bash
icat file.png        # preview image in terminal (kitten icat)
```

## Structure

```
~/.dotfiles/
├── setup.sh                   # Bootstrap script (bash + nano setup)
├── Makefile                   # stow --no-folding . (symlinks everything)
├── .stow-local-ignore         # Controls what stow excludes
├── .bash_config               # Main config — everything loaded from here
├── .nanorc                    # Nano syntax highlighting (30+ languages)
├── .inputrc                   # Readline keybindings
├── .prettierrc.json           # Code formatter defaults
├── .ansible.cfg               # Ansible global config
├── .gitconfig                 # Git config
├── .aliases.d/
│   └── core.alias             # All aliases (80+)
├── .config/                   # App configs → ~/.config/
│   ├── opencode/              # AI coding agent config
│   ├── starship.toml          # Starship prompt
│   └── ...                    # (15 config files total)
├── .local/                    # KDE/local configs → ~/.local/
│   └── share/
│       ├── konsole/           # Terminal profiles + color schemes
│       └── color-schemes/     # KDE color schemes
└── bin/                       # Utility scripts → ~/bin/
    ├── npm-global-update      # Update global npm packages
    ├── ollama-update          # Update all Ollama models
    └── uv-tool-update         # Update uv Python tools
```

Load order: `.bashrc` → `.bash_config` → `.aliases.d/*.alias`.

To add aliases, create or edit `~/.dotfiles/.aliases.d/*.alias`:
```bash
alias myproject='cd ~/projects/my-project'
alias weather='curl wttr.in'
```

## KDE Plasma Setup

### Theme — [Darkly](https://github.com/Bali10050/Darkly)

Qt application style, window decoration, and color scheme. Fork of Lightly.

```bash
git clone https://github.com/Bali10050/Darkly.git
cd Darkly
./install.sh
```

Also available via AUR, Fedora COPR, and pre-built packages.

### Theme — [Catppuccin](https://github.com/catppuccin/kde) (alternative)

Soothing pastel theme for KDE Plasma. Includes application style, window decoration, color scheme, and Konsole profiles.

```bash
git clone https://github.com/catppuccin/kde.git
cd kde
./install.sh
```

Also available via the KDE Store and AUR.

### Widgets

- **[KDE Modern Clock](https://store.kde.org/p/2135653/)** — simple modern clock for the desktop (not the panel), Plasma 6 ready.
- **[Panel Colorizer](https://store.kde.org/p/2130967)** — Plasma panel customization, 30+ built-in presets, create your own.
- **[plasmusic-toolbar](https://store.kde.org/p/2128143/)** — shows currently playing song on the panel, compatible with Plasma 6.0.4+.

## License

[MIT License](LICENSE)
