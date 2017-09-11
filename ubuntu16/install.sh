#!/bin/bash

# cd
cd $(dirname $0)

# apt
sudo apt-get update

sudo apt-get install -y zsh git autojump rsync tmux

function setup_zsh() {
    chsh -s /bin/zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp -f zs.zsh-theme ~/.oh-my-zsh/themes/
    cp -f zshrc ~/.zshrc
}
setup_zsh

function setup_git() {
	cp gitconfig ~/.gitconfig 
	cp gitignore_global ~/.gitignore_global
}
setup_git

function setup_fzf() {
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
}
setup_fzf

function setup_vim() {
    echo "..."
}
setup_vim
