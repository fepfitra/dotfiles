#!/usr/bin/env bash

#https://dev.to/spacerockmedia/how-i-manage-my-dotfiles-using-gnu-stow-4l59

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

base=(
)

useronly=(
  # qutebrowser
  # rofi
  #fuzzel
  i3
  niri
  picom
  pip
  rofi
  sway
)

hostnames=(
  archer
  archie
)

stowit() {
  usr=$1
  app=$2
  # -v verbose
  # -R recursive
  # -t target
  stow -v -R -t "${usr}" "${app}"
}

echo ""
echo "Stowing apps for user: ${whoami}"

for app in "${base[@]}"; do
  stowit "${HOME}" "$app"
done

for app in "${useronly[@]}"; do
  if [[ ! "$(whoami)" = *"root"* ]]; then
    stowit "${HOME}" "$app"
  fi
done

I3="$(pwd)/i3/.config/i3"

if [[ " ${hostnames[@]} " =~ " $(uname -n) " ]]; then
  cat "$I3/config.base" "$I3/config.$(uname -n)" >"$I3/config"
else
  cat "$I3/config.base" "$I3/config.default" >"$I3/config"
fi

unset I3

I3="$(pwd)/sway/.config/sway"

if [[ " ${hostnames[@]} " =~ " $(uname -n) " ]]; then
  cat "$I3/config.base" "$I3/config.$(uname -n)" >"$I3/config"
else
  cat "$I3/config.base" "$I3/config.default" >"$I3/config"
fi

unset I3
"$(pwd)"/apps.sh

echo ""
echo "##### ALL DONE"
