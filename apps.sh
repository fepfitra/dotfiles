
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
  qt5-graphicaleffects #for sddm theme
  qt5-svg              #for sddm theme
  qt5-quickcontrols2   #for sddm theme
  powerline           #for theme
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

echo "For sddm theme, you have to do it manually, check apps.sh file"
# git clone https://github.com/catppuccin/sddm.git
# sudo rm -rf /usr/share/sddm/themes/*
# sudo mv -f ./sddm/src/* /usr/share/sddm/themes/
# change theme in /usr/lib/sddm/sddm.conf.d/default.conf
