#!/bin/sh

if [ ! -e "$HOME/.dotfiles" ]
then
  git clone git@github.com:rkowalewski/dotfiles.git $HOME/.dotfiles
  if [ ! "$?" -eq 0]
  then
    echo "\"git clone git@github.com:rkowalewski/dotfiles.git\" FAILED!"
    exit 1
  fi
fi

cd $HOME/.dotfiles
git submodule update --init --recursive

cd $HOME

ln -s .dotfiles/zsh/.zshrc
ln -s .dotfiles/zsh/.zshenv

ln -s .dotfiles/tmux/.tmux.conf

ln -s .dotfiles/git/.gitconfig
ln -s .dotfiles/git/.gitignore_global

ln -s .dotfiles/vim/.vimrc
ln -s .dotfiles/vim/.vim
