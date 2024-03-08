yay -Syu qt5-graphicaleffects qt5-svg qt5-quickcontrols2 --noconfirm
yay -S sddm i3 powerline bumblebee-status --noconfirm

git clone https://github.com/catppuccin/sddm.git
sudo rm -rf /usr/share/sddm/themes/*
sudo mv -f ./sddm/src/* /usr/share/sddm/themes/
sudo mv -f ./default.conf /usr/lib/sddm/sddm.conf.d
rm -rf ./sddm

