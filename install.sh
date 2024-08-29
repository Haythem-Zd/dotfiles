#!/bin/bash
set -eo pipefail

mkdir -p ~/.config
mkdir -p ~/oss

sudo apt-get -qq update

sudo apt-get -qq install -y sudo \
							curl \
							wget \
							ca-certificates \
							git \
							fzf \
							python3 \
							build-essential \
							cmake \
							ccache \
							ssh \
							man-db

# ZSH
sudo apt-get -qq install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
[[ -f ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.old
ln -sf ~/.dotfiles/shell/.zshrc ~/.zshrc
git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
ln -sf ~/.dotfiles/shell/zsh_plugins.txt ~/.zsh_plugins.txt

# BASH
git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
[[ -f ~/.bashrc ]] && mv ~/.bashrc ~/.bashrc.old
ln -sf ~/.dotfiles/shell/.bashrc ~/.bashrc

# TMUX
sudo apt-get -qq install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
[[ -f ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.tmux.conf.old
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

#NEOVIM
sudo apt-get -qq install -y ninja-build gettext unzip ripgrep
ln -sf ~/.dotfiles/nvim ~/.config/nvim
git clone --depth 1 --branch stable https://github.com/neovim/neovim.git ~/oss/neovim
(cd ~/oss/neovim; make CMAKE_BUILD_TYPE=Release -j10; sudo make install)


# Docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -qq update
sudo apt-get -qq install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker || true
sudo usermod -aG docker $USER

# More packages
sudo apt-get -qq install -y silversearcher-ag \
							exa \
							fd-find \
							ranger \
							jq \
							bat \
							ansible