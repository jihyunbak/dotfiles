#!/bin/bash

# copied and adapted from github.com/zellwk/dotfiles/link-dotfiles.sh

# detect the operating system
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

echo "Creating symlinks for dotfiles to $HOME"

# Symlink all dotfiles on Mac
if [[ $MACHINE == "Mac" ]]; then
  for f in dotfiles/\.[^.]*; do
    FILE="$(basename $f)"
    ln -sf "$PWD/dotfiles/$FILE" "$HOME"
    #echo "$FILE"
    #if [[ $FILE == ".bash_custom" ]]; then
    #  echo "Double symlink does not work.. Copying instead."
    #  cp -p "$PWD/dotfiles/.bash_custom" "$HOME"
    #else
    #  ln -sf "$PWD/dotfiles/$FILE" "$HOME"
    #fi
  done
fi

# For now, do not symlink on Linux as it is likely a shared machine;
# instead copy custom settings manually
if [[ $MACHINE == "Linux" ]]; then
    echo "Detected a Linux machine; this script will do nothing."
fi

echo "Linked dotfiles. Please restart your shell. "

