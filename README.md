# Personal Dotfiles

This repository contains my personal dotfiles and configurations for my development environment. The dotfiles and configurations are managed using [GNU Stow](https://www.gnu.org/software/stow/).

# Features
Tools will be installed and configured:
- [Bash](https://www.gnu.org/software/bash/)
- [GNU Stow](https://www.gnu.org/software/stow/)
- [Bash-it](https://github.com/Bash-it/bash-it)
- [Nano](https://www.nano-editor.org/)
- [Htop](https://htop.dev/)
- [Curl](https://curl.se/)
- [Wget](https://www.gnu.org/software/wget/)
- [Git](https://git-scm.com/)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [Eza](https://github.com/eza-community/eza)
- [Bat](https://github.com/sharkdp/bat)
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
- [nanorc](https://github.com/scopatz/nanorc/)

# Supported Operating Systems
- Ubuntu
- Debian
- openSUSE

# How to use

This repository contains dotfiles that can be used to customize your development environment. To use this dotfiles repository, follow the steps below:

1. Run the `setup.sh` script using `curl` or `wget` without cloning the repository first. This script will download and install the necessary dotfiles and configurations.

    ```bash
    curl -sSL https://raw.githubusercontent.com/fadhilyori/dotfiles/main/setup.sh | bash
    ```
    Using `wget`:
    ```bash
    wget -qO- https://raw.githubusercontent.com/fadhilyori/dotfiles/main/setup.sh | bash
    ```

1. Reload your shell or restart your terminal.
1. After the installation is complete, you can customize the dotfiles and configurations to your liking.

# License

Licensed under the [MIT License](LICENSE).
