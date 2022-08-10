# dotfiles
A repo to house all of my linux configuration files

## Used packages
- [ ] yadm
- [ ] wget, curl, or fetch (or all three if you're feeling fancy)
- [ ] git
- [ ] starship (optional if you want to use starship prompt)
- [ ] nodejs (preferbly through [fnm](https://github.com/Schniz/fnm))
- [ ] [pyenv](https://github.com/pyenv/pyenv-installer)
- [ ] neovim
- [ ] ranger
- [ ] zsh
- [ ] tmux
- [ ] gh-cli (optional)
- [ ] oh-my-zsh
    - [ ] zsh-autocomplete
    ```console
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
### Ubuntu Install Script
It also has nala, which is an apt frontend and makes things pretty :)
```console
sudo apt install wget curl git neovim ranger tmux yadm
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh nala
curl -sS https://starship.rs/install.sh | sh
curl https://pyenv.run | bash
curl -fsSL https://fnm.vercel.app/install | bash
fnm completions --shell $(echo $SHELL | cut -d'/' -f 3)
```

## yadm script
```console
yadm clone https://github.com/samminhch/dotfile
yadm status
```

... and you should be all good to go :)
