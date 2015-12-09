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

function init_spacemacs_repo(){
   [[ -d ~/.emacs.d ]] && echo "~/.emacs.d exists." && return

   git clone git@github.com:HQingYi/spacemacs.git ~/.emacs.d
   cd ~/.emacs.d
   git checkout -b develop origin/develop
   git remote add upstream https://github.com/syl20bnr/spacemacs.git
   git fetch --all
   cd
}

function config_spacemacs(){
    cat <<EOF
=== config spacemacs ===
..ln ~/.spacemacs
..git checkout git@github.com:HQingYi/spacemacs.git ~/.emacs.d
EOF
    init_spacemacs_repo
    link_if_target_not_exists $DOTFILE_HOME/spacemacs/.spacemacs ~/.spacemacs
}

function init_oh_my_zsh(){
    [[ -d ~/.oh-my-zsh ]] && echo "~/.oh-my-zsh exists." && return

    git clone git@github.com:HQingYi/oh-my-zsh.git ~/.oh-my-zsh
    cd ~/.oh-my-zsh
    git remote add upstream https://github.com/robbyrussell/oh-my-zsh.git
    git fetch --all
    cd
}

function config_oh_my_zsh(){
    cat <<EOF
=== config oh_my_zsh ===
..ln ~/.zshrc
..git checkout git@github.com:HQingYi/oh-my-zsh.git ~/.oh-my-zsh
EOF
    init_oh_my_zsh
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

