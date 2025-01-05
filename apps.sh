apps=(
  # bun
  # discord-electron
  #anki
  #anydesk-bin
  #lunarvim-git
  #microsoft-edge-stable-bin
  aircrack-ng
  alacritty
  base-devel #for yay
  binwalk
  bumblebee-status
  catppuccin-gtk-theme-mocha
  dracula-gtk-theme
  entr
  fish
  flameshot
  ghidra
  git #for yay
  hashcat-git
  i3-wm
  i3lock
  i3lock-fancy
  lxappearance
  neovim #for lunarvim
  nodejs
  npm
  pandoc
  picom
  powerline #for theme
  qrencode
  qt5-graphicaleffects #for sddm theme
  qt5-quickcontrols2   #for sddm theme
  qt5-svg              #for sddm theme
  qutebrowser
  radare2
  rockyou
  rofi
  rofi-power-menu
  scrot
  sddm
  steghide
  tmux
  tradingview
  vim
  virtualbox
  wine
  xcursor-themes
  yay
  zbar
)

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

echo "For sddm theme, you have to do it manually, check apps.sh file"
# git clone https://github.com/catppuccin/sddm.git
# sudo rm -rf /usr/share/sddm/themes/*
# sudo mv -f ./sddm/src/* /usr/share/sddm/themes/
# change theme in /usr/lib/sddm/sddm.conf.d/default.conf
