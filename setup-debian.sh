#!/usr/bin/env bash

#https://dev.to/spacerockmedia/how-i-manage-my-dotfiles-using-gnu-stow-4l59

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

base=(
  fish
  nvim
  tmux
)

stowit() {
  usr=$1
  app=$2
  # -v verbose
  # -R recursive
  # -t target
  stow -v -R -t ${usr} ${app}
}

echo ""
echo "Stowing apps for user: ${whoami}"

for app in ${base[@]}; do
  stowit "${HOME}" $app 
done

echo ""
echo "##### ALL DONE"
