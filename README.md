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

```console
yadm clone https://github.com/samminhch/dotfiles
yadm status
```

### On Ubuntu / Debian distributions
**Important:** Add `$HOME/.local/bin` to your `PATH` enviornment variable!
```console
sudo apt update
sudo apt install git python3-pip curl zsh unzip yadm neovim wget
yadm clone https://github.com/samminhch/dotfiles
yadm stash
```

### On Arch-based distributions
This snippet uses `yay` as the AUR helper, but you can use whatever one you want

```console
yay -Sy
yay -S python-pip zsh unzip yadm-git neovim wget
yadm clone https://github.com/samminhch/dotfiles
yadm stash
```

## Post-Install
You'll need to install these oh-my-zsh plugins:

```console
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
pip install thefuck
```

I use [this wallpaper](https://www.pexels.com/photo/close-up-photography-of-leaves-with-droplets-807598/)
throughout my desktop, because I like leaves. I'll also include them in the
GitHub repository for you to use if the link becomes inaccessable.

... and you should be all good to go 😊
