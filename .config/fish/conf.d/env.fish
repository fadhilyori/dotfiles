fish_add_path "$HOME/bin" "$HOME/.local/bin"

# Dotfiles directory
if not set -q DOTFILES_DIR
  set -gx DOTFILES_DIR "$HOME/.dotfiles"
end

# Node.js options
set -gx NODE_OPTIONS "--max-old-space-size=4096"
