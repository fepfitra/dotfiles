yay -Syu qt5-graphicaleffects qt5-svg qt5-quickcontrols2
yay -S sddm i3 powerline bumblebee-status

git clone git@github.com:catppuccin/sddm.git
mv ./sddm/src/* /usr/share/sddm/themes/
rm -rf sddm
sudo mv ./default.conf /usr/lib/sddm/sddm.conf.d

