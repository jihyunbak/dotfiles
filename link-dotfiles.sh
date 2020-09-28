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

# On Mac or Linux, symlink all dotfiles except .bash_profile
if [[ ($MACHINE == "Mac" || $MACHINE == "Linux" ) ]]; then
  for f in dotfiles/\.[^.]*; do
    FILE="$(basename $f)"
    #echo "$FILE"
    #ln -sf "$PWD/dotfiles/$FILE" "$HOME"
    if [[ $FILE == ".bash_profile" ]]; then
      echo ".bash_profile is not changed."
    else
      echo "$FILE"
      ln -sf "$PWD/dotfiles/$FILE" "$HOME"
    fi
  done
fi

# For now, do not symlink on Linux as it is likely a shared machine;
# instead copy custom settings manually
#if [[ $MACHINE == "Linux" ]]; then
#    echo "Detected a Linux machine; this script will do nothing."
#fi

echo "Linked dotfiles. Please restart your shell. "

