
apps=(
  git         #for yay
  base-devel  #for yay
  yay
  tmux       
  sddm        
  i3-wm       
  bumblebee-status  
  alacritty
  virtualbox
  qt5-graphicaleffects
  qt5-svg
  qt5-quickcontrols2
  powerline
  qutebrowser
  rofi        
  rofi-power-menu
  fish        
  anki
  anydesk-bin
  microsoft-edge-stable-bin
  vim
  neovim        #for lunarvim
  lunarvim-git 
  hashcat-git
  rockyou
  ghidra
  radare2
  binwalk
  steghide
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
