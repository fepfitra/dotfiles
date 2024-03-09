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

apps=(
  git
  base-devel
  yay
  tmux
  sddm
  i3-wm
  bumblebee-status
  qutebrowser
  rofi
  fish
  anki
  anydesk-bin
  microsoft-edge-stable-bin
  lunarvim-git
  hashcat-git
  rockyou
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

for app in ${apps[@]}; do
  TMP=$(pacman -Q $app)
  if [[ $? -eq 0 ]]; then
    echo "app $app is installed"
  else
    echo "app $app is not installed"
    echo "installing $app"

    if [[ $app = "yay" ]]; then
      git clone https://aur.archlinux.org/yay.git
      cd yay
      makepkg -si
      cd ..
      rm -rf yay
    elif [[ $app = "git" ]]; then
      pacman -S git --noconfirm --needed
    elif [[ $app = "base-devel" ]]; then
      pacman -S git --noconfirm --needed
    else
      yay -S $app --noconfirm
    fi
  fi
done

echo ""
echo "##### ALL DONE"
