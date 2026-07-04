# Installation

Manual install guide for [fadhilyori/dotfiles](https://github.com/fadhilyori/.dotfiles).

Supports **Debian/Ubuntu** (`apt`) and **Fedora** (`dnf`). Requires **Bash** and `sudo`.

> Prefer automation? Run `./setup.sh` from the cloned repo instead. It does every step below. This document is the canonical reference; `setup.sh` is just a wrapper.

## 1. Clone the repo

```bash
git clone https://github.com/fadhilyori/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

## 2. Install system packages

### Required

| Debian/Ubuntu | Fedora |
|---------------|--------|
| `sudo apt install git curl stow` | `sudo dnf install git curl stow` |

### Optional (recommended)

These power most of the aliases in `.aliases.d/core.alias` and helpers in `.bash_config`. Skip any you don't need.

**Debian/Ubuntu:**

```bash
sudo apt install \
  starship fzf bat ripgrep git-delta tree dnsutils ffmpeg \
  p7zip-full jq poppler-utils fd-find zoxide imagemagick \
  kitty duf ncdu wl-clipboard
```

> Note: on Debian/Ubuntu, the `bat` package ships its binary as `batcat`. `.bash_config` and `.aliases.d/core.alias` already handle both names.

**Fedora:**

```bash
sudo dnf install \
  starship fzf bat ripgrep git-delta tree bind-utils ffmpeg-free \
  p7zip jq poppler-utils fd-find zoxide ImageMagick \
  kitty duf ncdu wl-clipboard
```

### yazi (terminal file manager)

**Fedora**: available in repos:

```bash
sudo dnf install yazi
```

**Debian/Ubuntu**: install via snap:

```bash
sudo snap install yazi --classic
```

### eza (modern `ls` replacement)

**Fedora**: available in repos:

```bash
sudo dnf install eza
```

**Debian/Ubuntu**: install from the Gierens apt repo:

```bash
sudo apt install -y gnupg2
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc \
  | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" \
  | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
```

## 3. Install fonts

**Debian/Ubuntu:**

```bash
sudo apt install \
  fonts-adobe-sourcesans3 fonts-cantarell fonts-cascadia-code \
  fonts-dejavu-core fonts-firacode fonts-font-awesome fonts-inter \
  fonts-jetbrains-mono fonts-noto
```

**Fedora:**

```bash
sudo dnf install \
  adobe-source-sans-3-fonts abattis-cantarell-fonts cascadia-code-fonts \
  dejavu-sans-mono-fonts fira-code-fonts fontawesome-fonts \
  google-inter-fonts jetbrains-mono-fonts google-noto-fonts
```

Then refresh the font cache:

```bash
fc-cache -f -v
```

## 4. Install nano syntax highlighting

Pulls 30+ language definitions from [galenguyer/nano-syntax-highlighting](https://github.com/galenguyer/nano-syntax-highlighting):

```bash
bash <(curl -s https://raw.githubusercontent.com/galenguyer/nano-syntax-highlighting/master/install.sh)
```

## 5. Stow the dotfiles

GNU Stow creates symlinks from this repo into `$HOME`. The `--no-folding` flag keeps the directory layout as-is (no nesting tricks).

```bash
cd ~/.dotfiles
stow . -t "$HOME" --no-folding
```

Or use the Makefile:

```bash
make stow
```

## 6. Wire up Bash and Nano

Add to `~/.bashrc`:

```bash
if [ -f "$HOME/.dotfiles/.bash_config" ]; then
    . "$HOME/.dotfiles/.bash_config"
fi
```

Add to `~/.nanorc`:

```
include "~/.dotfiles/.nanorc"
```

> If `~/.bashrc` or `~/.nanorc` doesn't exist yet, just `touch` it first.

## 7. Reload the shell

```bash
exec $SHELL
```

You should now have the starship prompt, all aliases (`ls` → eza, `cat` → bat, etc.), fzf keybindings, and zoxide navigation wired up.

## Updating later

```bash
dotfiles-update    # alias: git pull in ~/.dotfiles, then run `stow --no-folding .` if needed
```

## 8. Neovim (optional)

The `v` / `vi` / `vim` aliases point here when installed.

**Debian/Ubuntu:** `sudo apt install neovim`
**Fedora:** `sudo dnf install neovim`

## 9. Kitty terminal (optional)

Enables the `icat` alias for image previews in `.aliases.d/core.alias`.

**Debian/Ubuntu:** `sudo apt install kitty`
**Fedora:** `sudo dnf install kitty`

## 10. tmux (optional)

Enables the `tl` / `tk` / `tn` / `ta` session aliases.

**Debian/Ubuntu:** `sudo apt install tmux`
**Fedora:** `sudo dnf install tmux`

## 11. mosh (optional)

For the commented-out `ssh()` wrapper in `.aliases.d/core.alias` (currently disabled; uncomment lines 9-52 to use mosh-preferred SSH).

**Debian/Ubuntu:** `sudo apt install mosh`
**Fedora:** `sudo dnf install mosh`

## AI tooling reference

Additional AI tools currently used by the user.

- https://github.com/rtk-ai/rtk
- https://github.com/backnotprop/plannotator
- https://github.com/colbymchenry/codegraph
- https://github.com/MinishLab/semble
- https://github.com/mksglu/context-mode

## Optional: KDE Plasma

### Theme: [Darkly](https://github.com/Bali10050/Darkly)

Qt application style, window decoration, and color scheme. Fork of Lightly.

```bash
git clone https://github.com/Bali10050/Darkly.git
cd Darkly
./install.sh
```

Also available via AUR, Fedora COPR, and pre-built packages.

### Theme: [Catppuccin](https://github.com/catppuccin/kde) (alternative)

Soothing pastel theme for KDE Plasma. Includes application style, window decoration, color scheme, and Konsole profiles.

```bash
git clone https://github.com/catppuccin/kde.git
cd kde
./install.sh
```

Also available via the KDE Store and AUR.

### Widgets

- **[KDE Modern Clock](https://store.kde.org/p/2135653/)**: simple modern clock for the desktop (not the panel), Plasma 6 ready.
- **[Panel Colorizer](https://store.kde.org/p/2130967)**: Plasma panel customization, 30+ built-in presets, create your own.
- **[plasmusic-toolbar](https://store.kde.org/p/2128143/)**: shows currently playing song on the panel, compatible with Plasma 6.0.4+.
