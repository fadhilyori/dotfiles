# Safety aliases - require confirmation for destructive commands
function rm
    command rm -I $argv
end

function cp
    command cp -i $argv
end

function mv
    command mv -i $argv
end

# Editor aliases (only if Neovim is available)
if command -v nvim >/dev/null 2>&1
    function v
        command nvim $argv
    end
    function vi
        command nvim $argv
    end
    function vim
        command nvim $argv
    end
end

# Wayland copy and paste aliases (if wl-clipboard is available)
if command -v wl-copy >/dev/null 2>&1
    function copy
        command wl-copy $argv
    end
end

if command -v wl-paste >/dev/null 2>&1
    function paste
        command wl-paste $argv
    end
end

# Navigation aliases
function ..
    builtin cd ..
end

function ...
    builtin cd ../..
end

# Interactive directory selection with fzf
if command -v zi >/dev/null 2>&1
    function cdi
        command zi $argv
    end
end

# Package Management (Ubuntu/Debian)
function apti
    command sudo apt install -y $argv
end

function aptu
    command sudo apt update && sudo apt upgrade -y
end

function aptdu
    command sudo apt update && sudo apt dist-upgrade -y
end

function aptfu
    command sudo apt update && sudo apt full-upgrade -y
end

function apts
    command apt search $argv
end

function aptr
    command sudo apt remove -y $argv
end

function aptc
    command sudo apt autoremove -y && sudo apt autoclean
end

function aptsh
    command apt show $argv
end

# Docker management aliases
function dps
    command docker ps -a $argv
end

function dimg
    command docker images $argv
end

function drun
    command docker run -it --rm $argv
end

function drma
    command docker container prune -f
end

function drmi
    command docker image prune -f
end

function dvol
    command docker volume ls
end

function dnet
    command docker network ls
end

function dexec
    command docker exec -it $argv
end

function dlog
    command docker logs -f $argv
end

# Docker Compose aliases
function doco
    command docker compose $argv
end

function dcup
    command docker compose up -d $argv
end

function dcdown
    command docker compose down $argv
end

function dcps
    command docker compose ps $argv
end

function dclog
    command docker compose logs -f $argv
end

# Python3 development aliases
function py
    command python3 $argv
end

function pip
    command pip3 $argv
end

function venv
    command python3 -m venv $argv
end

# Pip aliases
function pipup
    command pip install --upgrade pip $argv
end

function pipr
    command pip install -r requirements.txt $argv
end

function pipf
    command pip freeze > requirements.txt
end

# Node.js/NPM aliases
function ni
    command npm install $argv
end

function nr
    command npm run $argv
end

function ns
    command npm start $argv
end

function nt
    command npm test $argv
end

function nls
    command npm list -g --depth=0 $argv
end

function nout
    command npm outdated -g
end

function nbuild
    command npm run build $argv
end

function ndev
    command npm run dev $argv
end

# Golang development aliases
function gob
    command go build $argv
end

function gor
    command go run $argv
end

function got
    command go test $argv
end

function gofmt
    command gofmt -w $argv
end

function govet
    command go vet $argv
end

# PHP/Laravel development aliases
function art
    command php artisan $argv
end

function laserve
    command php artisan serve $argv
end

function lamigrate
    command php artisan migrate $argv
end

function lafresh
    command php artisan migrate:fresh $argv
end

function laseed
    command php artisan db:seed $argv
end

function latinker
    command php artisan tinker $argv
end

function lacache
    command php artisan cache:clear $argv
end

function laconfig
    command php artisan config:clear $argv
end

# System administration aliases
# File system operations
function dush
    command /usr/bin/du -sh $argv | sort -h
end

function lsbig
    command ls -lahS | head -10
end

# Network diagnostics
function myip
    command curl -s ipinfo.io/ip $argv
end

function myipinfo
    command curl -s ipinfo.io $argv
end

function ports
    if command -v ss >/dev/null 2>&1
        command ss -tuln $argv
    else if command -v netstat >/dev/null 2>&1
        command netstat -tuln $argv
    else
        echo "Neither ss nor netstat is available"
    end
end

# Process management
function psa
    command ps aux $argv
end

function psg
    command ps aux | grep -i "$argv"
end

function memh
    command free -h $argv
end

# Dotfiles management
function dotfiles
    cd ~/.dotfiles
end

function dotfiles-update
    cd ~/.dotfiles; and git pull origin (git rev-parse --abbrev-ref HEAD); and cd -
end

# Docker management - stop all running containers
function dstop
    set -l containers (command docker ps -q)
    if test -n "$containers"
        command docker stop $containers
    else
        echo "No running containers"
    end
end

# Activate virtual environment (searches common locations)
function vact
    if set -q VIRTUAL_ENV
        echo "Already in virtual environment: $VIRTUAL_ENV"
        return 0
    end

    for dir in .venv venv .env env
        if test -f "$dir/bin/activate"
            set -gx VIRTUAL_ENV (pwd)/$dir
            set -gx PATH "$VIRTUAL_ENV/bin" $PATH
            echo "Activated: $dir"
            return 0
        end
    end

    echo "No virtual environment found. Tried: .venv venv .env env"
    return 1
end

# Activate specific venv by name
function vactn
    if test -z "$argv[1]"
        echo "Usage: vactn <venv_name>"
        return 1
    end

    if test -f "$argv[1]/bin/activate"
        source "$argv[1]/bin/activate"
        echo "Activated: $argv[1]"
    else
        echo "Not found: $argv[1]/bin/activate"
        return 1
    end
end

# Create and activate venv in one step
function mkvenv
    set -l name "$argv[1]"
    if test -z "$name"
        set name ".venv"
    end

    python3 -m venv "$name"
    source "$name/bin/activate"
    echo "Created and activated: $name"
end

# Deactivate (with check)
function vdeact
    if set -q VIRTUAL_ENV
        set -l venv_path "$VIRTUAL_ENV/bin"
        if contains $venv_path $PATH
            set -gx PATH (string match -v $venv_path $PATH)
        end
        set -e VIRTUAL_ENV
        echo "Deactivated virtual environment"
    else
        echo "No active virtual environment"
    end
end

# Show current venv status
function vwhich
    if set -q VIRTUAL_ENV
        echo "$VIRTUAL_ENV"
    else
        echo "No active virtual environment"
    end
end

# icat alias for image previewing in terminal (if kitten is available)
if command -v kitten >/dev/null 2>&1
    function icat
        command kitten icat $argv
    end
end

# Alias fd for fzf integration (if fd is available)
if command -v fdfind >/dev/null 2>&1
    function fd
        command fdfind $argv
    end
end

# Enhanced ls replacement (if eza is available)
if command -v eza >/dev/null 2>&1
    functions -e ls
    function ls
        command eza --icons=auto --group --octal-permissions -l --group-directories-first --header $argv
    end

    functions -e ll
    function ll
        command eza --icons=auto --group --octal-permissions -al --group-directories-first --header $argv
    end
else
    functions -e ls
    function ls
        command ls --color=auto $argv
    end

    functions -e ll
    function ll
        command ls -al $argv
    end
end

# Enhanced cat replacement (if bat/batcat is available)
if command -v bat >/dev/null 2>&1
    functions -e cat
    function cat
        command bat --style=plain --paging=never $argv
    end
else if command -v batcat >/dev/null 2>&1
    functions -e cat
    function cat
        command batcat --style=plain --paging=never $argv
    end
end

# Enhanced df replacement (if duf is available)
if command -v duf >/dev/null 2>&1
    functions -e df dfh dfl
    function _df
        command /usr/bin/df $argv
    end

    function df
        command duf $argv
    end

    function dfh
        command duf $argv
    end

    function dfl
        command duf -only local $argv
    end
else
    functions -e dfh
    function dfh
        command df -h $argv
    end
end

# Enhanced du replacement (if ncdu is available)
if command -v ncdu >/dev/null 2>&1
    functions -e du
    function _du
        command /usr/bin/du $argv
    end

    function du
        command ncdu $argv
    end
end