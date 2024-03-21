#!/bin/bash

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
  . /etc/os-release
  if [ "$ID" = "opensuse-tumbleweed" ]; then
    printf "=> Checking for updates to zypper...\n"
    sudo zypper refresh
    sudo zypper dup --allow-vendor-change
    printf "=> Checking for updates to zypper...done\n\n"
  fi
fi

# Check for updates to apt on Ubuntu or Debian
if [ -f /etc/os-release ]; then
  . /etc/os-release
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