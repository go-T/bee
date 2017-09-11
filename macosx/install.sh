#!/bin/bash

# cd
cd $(dirname $0)

function setup_brew() {
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | 
    sed -e 's#^BREW_REPO =.*$#BREW_REPO = "git://mirrors.ustc.edu.cn/brew.git".freeze#' | 
    sed -e 's#^CORE_TAP_REPO =.*$#CORE_TAP_REPO = "git://mirrors.ustc.edu.cn/homebrew-core.git".freeze#' > brew_install

    /usr/bin/ruby ./brew_install

    export PATH=/usr/local/bin:$PATH

    cd "$(brew --repo)"
    git remote set-url origin git://mirrors.ustc.edu.cn/brew.git
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin git://mirrors.ustc.edu.cn/homebrew-core.git
    brew update 

    # echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.bash_profile
    # source ~/.bash_profile
}
setup_brew

function setup_zsh() {
    brew install zsh
    chsh -s /usr/local/bin/zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp -f bash_profile ~/.bash_profile
    cp -f zshrc ~/.zshrc
}
setup_zsh

function setup_vim() {
    echo "..."
}
setup_vim
