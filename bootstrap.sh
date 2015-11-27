#!/bin/bash
DOTFILE_HOME=$(cd `dirname $0` && pwd)

function config_spacemacs(){
    cat <<EOF
=== config spacemacs ===
..ln ~/.spacemacs
EOF
    [[ ! -a ~/.spacemacs ]] && ln -sf $DOTFILE_HOME/spacemacs/.spacemacs ~/.spacemacs
}

function config_oh_my_zsh(){
    cat <<EOF
=== config oh_my_zsh ===
..ln ~/.zshrc
..install .oh-my-zsh
EOF
    [[ ! -d ~/.oh-my-zsh ]] && ln -sf $DOTFILE_HOME/oh-my-zsh/oh-my-zsh ~/.oh-my-zsh
    [[ ! -a ~/.zshrc ]] && ln -sf $DOTFILE_HOME/oh-my-zsh/.zshrc ~/.zshrc
}

function config_all(){
  config_spacemacs
  config_oh_my_zsh
}

config_all

