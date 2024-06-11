#!/bin/bash

# author: Fadhil Yori Hibatullah
# description: A script to check for updates to dotfiles, bash-it, zypper on openSUSE Tumbleweed, apt on Ubuntu or Debian, flatpak, and snap

# shellcheck source=/etc/os-release
. /etc/os-release

# Check for updates to dotfiles
# Check if dotfiles is installed
if [ ! -d ~/dotfiles ]; then
  printf "=> Error: dotfiles is not installed\n"
  exit 1
fi

printf "=> Checking for updates to dotfiles...\n"
# Show the output of the git pull command if verbose mode is enabled
cd ~/dotfiles && git pull --rebase true || (echo "=> Error: git pull failed, check the error below" && exit 1)
printf "=> Checking for updates to dotfiles...done\n\n"

# Check for updates to bash-it
# Check if bash-it is installed
if [ ! -d ~/.bash_it ]; then
  printf "=> Error: bash-it is not installed\n"
  exit 1
fi

printf "=> Checking for updates to bash-it...\n"
cd ~/.bash_it && git pull
printf "=> Checking for updates to bash-it...done\n\n"

# Check for updates to zypper on openSUSE Tumbleweed
if [ -f /etc/os-release ]; then
  if [ "$ID" = "opensuse-tumbleweed" ]; then
    printf "=> Checking for updates to zypper...\n"
    sudo zypper refresh
    sudo zypper dup --allow-vendor-change
    printf "=> Checking for updates to zypper...done\n\n"
  fi
fi

# Check for updates to apt on Ubuntu or Debian
if [ -f /etc/os-release ]; then
  if [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
    printf "=> Checking for updates to apt...\n"
    sudo apt update
    sudo apt full-upgrade
    printf "=> Checking for updates to apt...done\n\n"
  fi
fi

# Check for updates to flatpak
# Only check for updates if flatpak is installed
if command -v flatpak > /dev/null; then
  printf "=> Checking for updates to flatpak...\n"
  sudo flatpak update
  printf "=> Checking for updates to flatpak...done\n\n"
fi

# Check for updates to snap
# Only check for updates if snap is installed
if command -v snap > /dev/null; then
    printf "=> Checking for updates to snap...\n"
    sudo snap refresh
    printf "=> Checking for updates to snap...done\n\n"
fi