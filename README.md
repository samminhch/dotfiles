# dotfiles

A repo to house all of my linux configuration files.
I just thought it would be really neat if I could just install a new distro,
run this, and save hours setting up my desktop!

## Pre-Requisites

- [ ] git
- [ ] pip (specifically for python 3)
- [ ] [pipenv](https://pipenv.pypa.io/en/latest/)
- [ ] curl
- [ ] zsh
- [ ] unzip

Additionally, there are config files for these packages:
- [ ] neovim (bob-nvim will be used to install neovim)
- [ ] helix
- [ ] ranger
- [ ] wezterm
- [ ] starship

### These will be set up for you in the bootstrap file

- [ ] starship
- [ ] FiraCode Nerd Font: ([AUR](https://archlinux.org/packages/community/any/ttf-firacode-nerd/), [REPO](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode))
- [ ] [RustUp](https://rustup.rs/)
    - [ ] cargo-binstall
    - [ ] rtx-cli (for version management)
        - nodejs@18
    - [ ] bob-nvim (for neovim management)
- [ ] oh-my-zsh
    - [ ] zsh-autosuggestions
    - [ ] zsh-syntax-highlighting

## Getting Started

This repo uses [Yet Another Dotfiles Manager (yadm)](https://yadm.io/).
Please follow the [installation guide](https://yadm.io/docs/install) to install `yadm`.

### Important!
You should probably back up your current config, if you're using one. However, it's improtant to know that `.config/yadm/bootstrap` does `yadm stash` to preserve your current machine's configuration

```console
yadm clone --recurse-submodules https://github.com/samminhch/dotfiles 
yadm submodule update --init --recursive
yadm stash
```

### On Ubuntu / Debian-based distributions

```sh
sudo apt update
sudo apt install -y git python3-pip curl zsh unzip yadm wget 
pip install pipenv
yadm clone --recurse-submodules https://github.com/samminhch/dotfiles 
yadm submodule update --init --recursive
```

### On Arch-based distributions
This snippet uses `paru` as the AUR helper, but you can use whatever one you want.

```sh
paru # to update
paru -S wget curl unzip yadm python-pipenv
yadm clone --recurse-submodules https://github.com/samminhch/dotfiles 
yadm submodule update --init --recursive
```

## Post-Install
Reload your shell, and you should be all good to go 😊

## Additional Addities

I use [this wallpaper](https://www.pexels.com/photo/close-up-photography-of-leaves-with-droplets-807598/)
throughout my desktop, because I like leaves. I'll also include them in the
GitHub repository for you to use if the link becomes inaccessable.
