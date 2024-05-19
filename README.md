# dotfiles

A repo to house all of my linux configuration files.
I just thought it would be really neat if I could just install a new distro,
run this, and save hours setting up my desktop!

## Pre-Requisites

- [ ] bc
- [ ] fzf
- [ ] git
- [ ] npm
- [ ] zsh
- [ ] curl
- [ ] wget
- [ ] yadm
- [ ] unzip
- [ ] nvim
- [ ] starship
- [ ] tree-sitter

Additionally, there are config files for these packages:

- [ ] paru
- [ ] rofi
- [ ] helix
- [ ] waybar
- [ ] wezterm
- [ ] hyprland (and its ecosystem)

### These will be set up for you in the bootstrap file

- [ ] Pre-Requisites if they're not already installed
- [ ] Fonts (if you have pacman as your package manager)

### Important Note

My NeoVim configuration is [here](https://github.com/samminhch/nvim). Maybe
I'll integrate it with this configuration via. the bootstrap file soon.

## Getting Started

This repo uses [Yet Another Dotfiles Manager (yadm)](https://yadm.io/).
Please follow the [installation guide](https://yadm.io/docs/install) to install
`yadm`, or just run the bootstrap file located in `.config/yadm/bootstrap`

### Important!

You should probably back up your current config, if you're using one. However,
it's important to know that `.config/yadm/bootstrap` does `yadm stash` to
preserve your current machine's configuration

```sh
yadm clone https://github.com/samminhch/dotfiles   # or git@github.com:samminhch/dotfiles
```

## Post-Install

Reload your shell, and you should be all good to go 😊

## Additional Addities

I use [this wallpaper](https://www.pexels.com/photo/close-up-photography-of-leaves-with-droplets-807598/)
throughout my desktop, because I like leaves. I'll also include them in the
GitHub repository for you to use if the link becomes inaccessible.
