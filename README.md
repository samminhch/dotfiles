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
- [ ] A [nerd font](https://github.com/ryanoasis/nerd-fonts/).
  - The one I use is `FiraCode Nerd Font`

Additionally, there are config files for these packages:
- [ ] neovim
- [ ] helix
- [ ] tmux (*use at your own risk! i'm not sure how well it's set up*)
- [ ] ranger

## Getting Started

This repo uses [Yet Another Dotfiles Manager (yadm)](https://yadm.io/).
Please follow the [installation guide](https://yadm.io/docs/install) to install `yadm`.

**Important:** Do *not* immediately run the bootstrap file. You need to run `yadm stash` in order to load the `dotfile`'s
`.bashrc`.

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

### On Arch-based distributions
This snippet uses `yay` as the AUR helper, but you can use whatever one you want.
This snippet also installs the `FiraCode Nerd Font`, as it's the font I use in
my configurations.

```console
yay
yay -S wget curl unzip yadm neovim python-pip zsh
yadm clone https://github.com/samminhch/dotfiles
yadm stash
./.config/yadm/bootstrap
```

## Post-Install
**Reload your shell**, and then install the latest NodeJS LTS release using `fnm`. For example:

```console
fnm install 18.12.1
```

If you have installed `neovim`, don't mind the error messages that appear when you first run it.
You just need to run `:PlugInstall` to install the neovim plugins.

... and you should be all good to go 😊

## Additional Addities

I use [this wallpaper](https://www.pexels.com/photo/close-up-photography-of-leaves-with-droplets-807598/)
throughout my desktop, because I like leaves. I'll also include them in the
GitHub repository for you to use if the link becomes inaccessable.
