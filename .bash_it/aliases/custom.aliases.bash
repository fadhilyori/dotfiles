# change default commands
# alias cd='z'
alias cat='bat'
alias e=exit

# check and upgrade
alias cnu='sudo zypper ref && sudo zypper dup --allow-vendor-change'

# flatpak
alias flu='sudo flatpak update'

# snap
alias snu='sudo snap refresh'

alias cnua='~/bin/upgrade-all.sh'

# list
alias ld='eza --icons=auto --group --octal-permissions -lD'
alias lf='eza --icons=auto --group --octal-permissions -lf'
alias lh='eza --icons=auto --group --octal-permissions -laf'
alias ll='eza --icons=auto --group --octal-permissions -al --group-directories-first'
alias ls='eza --icons=auto --group --octal-permissions -l --group-directories-first'
alias lt='eza --icons=auto --group --octal-permissions -al'

# removing
alias rmrf='rm -rf '

# tree
alias tdl='tree -a -I "node_modules|.svelte-kit|.git" --dirsfirst'

# direnv
alias di='echo dotenv > .envrc && touch .env && direnv allow'

# folder locations
alias r='cd /home/fadhilyori/Projects'
alias rt='cd /home/fadhilyori/Projects/Trustmedis'

#alias ls='ls -lart'

# git commands
alias g=git
alias gbl='branch -a'
alias gcl='git clone '
alias pp='git pull --rebase && git push'
alias gpr='git pull-request -b '
alias ga='git add .'
alias gc='git commit -m '
alias gagc='git add . && git commit -m '
alias gbr='git browse'
alias grb='git rebase -'
alias gs='git status'
alias gb='git checkout -b'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias grv='git remote -v'
alias gp='git fetch -p'

# Git Removed Branches
alias grb='npx git-removed-branches'

# Hub commands
alias gpr='git pull-request -b '
alias gcr='git create'

# yarn commands
alias ya='yarn add'
alias yad='yarn add -D'
alias yb='yarn build'
alias yd='yarn dev'
alias yg='yarn go'
alias yga='yarn global add'
alias yr='yarn remove'
alias ys='yarn start'
alias yyb='yarn && yarn build'
alias yyd='yarn && yarn dev'
alias yui='yarn upgrade-interactive --latest'
alias ygui='yarn global upgrade-interactive --latest'
alias yyd='yarn && yarn dev'
alias ylg='yarn global list'

# npm commands
alias nr='npm run'
alias nrs='npm run start'
alias ni='npm i'
alias nid='npm i -D'
alias nig='npm i -g'
alias no='npm outdated'
alias nog='npm outdated -g --depth=0'
alias nr='npm run'
alias nrb='npm run build'
alias nrd='npm run dev'
alias nrf='npm run format'
alias nrs='npm run start'
alias nu='npm un'
alias nug='npm -g un'
alias nlg='npm list -g --depth=0'

# pnpm commands
alias pr='pnpm run'
alias prs='pnpm run start'
alias pi='pnpm i'
alias pid='pnpm i -D'
alias pig='pnpm i -g'
alias po='pnpm outdated'
alias pog='pnpm outdated -g --depth=0'
alias pr='pnpm run'
alias prb='pnpm run build'
alias prd='pnpm run dev'
alias prf='pnpm run format'
alias prs='pnpm run start'
alias pu='pnpm un'
alias pug='pnpm -g un'
alias plg='pnpm list -g --depth=0'
alias pc='pnpm create '

# nvm
alias nln='nvm install-latest-npm'
