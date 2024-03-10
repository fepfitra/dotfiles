#!/usr/bin/env bash

#https://dev.to/spacerockmedia/how-i-manage-my-dotfiles-using-gnu-stow-4l59

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

base=(
)

useronly=(
  git
  fish
  tmux
  lvim
  qutebrowser
  rofi
  i3
  fonts
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

for app in ${useronly[@]}; do
  if [[ ! "$(whoami)" = *"root"* ]]; then
    stowit "${HOME}" $app 
  fi
done


echo "setup i3 for certain device"
I3=$(pwd)/i3/.config/i3
cat $I3/config.base "$I3/config.$(uname -n)" > $I3/config


$(pwd)/apps.sh

echo ""
echo "##### ALL DONE"
