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
### Ubuntu 22.04 Install Script
It also has nala, which is an apt frontend and makes things pretty :)
```console
sudo apt update
# install required packages
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev git neovim ranger tmux yadm zsh unzip
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# add the github-cli repos
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
# install starship prompt
curl -sS https://starship.rs/install.sh | sh
# install pyenv
curl https://pyenv.run | bash
# install fnm
curl -fsSL https://fnm.vercel.app/install | bash
# install github-cli
sudo apt update
sudo apt install -y gh
# add nala repo
echo "deb https://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
sudo apt install -y nala
```

## yadm script
```console
yadm clone https://github.com/samminhch/dotfiles
yadm status

yadm stash
yadm rebase
```

... and you should be all good to go :)