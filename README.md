# dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```bash
git clone https://github.com/fadhilyori/.dotfiles.git ~/.dotfiles
```

Full install guide in [INSTALL.md](INSTALL.md), or run `./setup.sh` to do it automatically.

Tested on Ubuntu/Debian (apt) and Fedora (dnf). Needs Bash and sudo.

## Configuration

### Bash (.bash_config)

Wired up via [INSTALL.md §6](INSTALL.md#6-wire-up-bash-and-nano). Load order: `.bashrc` → `.bash_config` → `.aliases.d/*.alias`.

### Nano (.nanorc)

Wired up via [INSTALL.md §6](INSTALL.md#6-wire-up-bash-and-nano). Includes syntax highlighting for 30+ languages.

### GNU Stow

Configs are symlinked with [GNU Stow](https://www.gnu.org/software/stow/) (`--no-folding`). `.stow-local-ignore` controls what's excluded. See [INSTALL.md §5](INSTALL.md#5-stow-the-dotfiles).

### Other Configs

| File | Purpose |
|------|---------|
| `.inputrc` | Readline keybindings (vi mode, history search) |
| `.prettierrc.json` | Code formatter defaults |
| `.ansible.cfg` | Ansible global configuration |

## Cheatsheet: aliases and commands

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
├── setup.sh                   # Auto-setup wrapper (manual steps in INSTALL.md)
├── Makefile                   # stow --no-folding . (symlinks everything)
├── .stow-local-ignore         # Controls what stow excludes
├── .bash_config               # Main config: everything loaded from here
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

## License

[MIT License](LICENSE)
