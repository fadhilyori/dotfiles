# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$HOME/go/bin:$PATH

# Load aliases
. ~/.zsh_aliases

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.poshthemes/mytheme.omp.toml)"
fi

alias zshconfig="nvim ~/.zshrc"
alias doco="docker compose"

# ld — lists only directories (no files)
# lf — lists only files (no directories)
# lh — lists only hidden files (no directories)
# ll — lists everything with directories first
# ls — lists directories and files sorted by name
# lt — lists everything sorted by time updated
alias ld='eza --icons=auto --group --octal-permissions -lD'
alias lf='eza --icons=auto --group --octal-permissions -lf'
alias lh='eza --icons=auto --group --octal-permissions -laf'
alias ll='eza --icons=auto --group --octal-permissions -al --group-directories-first'
alias ls='eza --icons=auto --group --octal-permissions -l --group-directories-first'
alias lt='eza --icons=auto --group --octal-permissions -al'

# Ansible
export ANSIBLE_STDOUT_CALLBACK=yaml

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
