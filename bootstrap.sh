#!/bin/bash
DOTFILE_HOME=$(cd `dirname $0` && pwd)

function link_if_target_not_exists(){
    if [[ $# -eq 2 ]]; then
        [[ ! -e $2 ]] && ln -sf $1 $2
    else
        echo "invalid args."
        exit 1
    fi
}

function config_spacemacs(){
    cat <<EOF
=== config spacemacs ===
..ln ~/.spacemacs
EOF
    link_if_target_not_exists $DOTFILE_HOME/spacemacs/.spacemacs ~/.spacemacs
}

function config_oh_my_zsh(){
    cat <<EOF
=== config oh_my_zsh ===
..ln ~/.zshrc
..install .oh-my-zsh
EOF
    link_if_target_not_exists $DOTFILE_HOME/oh-my-zsh/oh-my-zsh ~/.oh-my-zsh
    link_if_target_not_exists $DOTFILE_HOME/oh-my-zsh/.zshrc ~/.zshrc
}

function config_git(){
    cat <<EOF
=== config git ===
.. ln ~/.gitconfig
.. ln ~/.gitignore_global
EOF
    link_if_target_not_exists $DOTFILE_HOME/git/.gitconfig ~/.gitconfig
    link_if_target_not_exists $DOTFILE_HOME/git/.gitignore_global ~/.gitignore_global
}

function config_all(){
  config_spacemacs
  config_oh_my_zsh
  config_git
}

config_all

