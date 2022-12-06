# dotfiles

A repo to house all of my linux configuration files.
I just thought it would be really neat if I could just install a new distro,
run this, and save hours setting up my desktop!

## Pre-Requisites

- [ ] git
- [ ] pip (specifically for python 3)
- [ ] curl
- [ ] zsh
- [ ] unzip
- [ ] A [nerd font](https://github.com/ryanoasis/nerd-fonts/)

## Getting Started

This repo uses [Yet Another Dotfiles Manager (yadm)](https://yadm.io/)

Please follow the [installation guide](https://yadm.io/docs/install) to install `yadm`.
Afterwards, use the [following commands](https://yadm.io/docs/getting_started#).

**Important:** Do *not* immediately run the bootstrap file. You need to run `yadm stash` in order to change to the dotfile's `.bashrc`
```console
yadm clone https://github.com/samminhch/dotfiles
yadm stash
```

### On Ubuntu / Debian distributions

```console
sudo apt update
sudo apt install git python3-pip curl zsh unzip yadm neovim wget 
yadm clone https://github.com/samminhch/dotfiles
yadm stash
./.config/yadm/bootstrap
```

#### Post-Install

Reload your shell, and install the latest NodeJS LTS release using `fnm`. For example:

```console
fnm install 18.12.1
```

... and you should be good to go :)

### On Arch-based distributions
This snippet uses `yay` as the AUR helper, but you can use whatever one you want.
With the AUR, it's not needed to run the bootstrap script:

```console
yay -Sy
yay -S wget curl unzip yadm-git fnm neovim python-pip python-pipenv pyenv zsh oh-my-zsh-git fnm-bin
yadm clone https://github.com/samminhch/dotfiles
yadm stash
```

#### Post-Install
Reload your shell, and then install the oh-my-zsh plugins:

```console
pip install thefuck
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Install the latest NodeJS LTS release using `fnm`. For example:

```console
fnm install 18.12.1
```

... and you should be good to go :)

## Additional Addities

I use [this wallpaper](https://www.pexels.com/photo/close-up-photography-of-leaves-with-droplets-807598/)
throughout my desktop, because I like leaves. I'll also include them in the
GitHub repository for you to use if the link becomes inaccessable.

... and you should be all good to go 😊
