#!/bin/bash


#############
#Setting up custom linux
#All files changed are stored in ~/.old_dotfiles
#############

sudo apt-get update


echo neovim 
apt -y install neovim 

echo git 
apt -y install git 

echo stow
#apt -y install stow

echo ranger
apt -y install ranger

#need curl for nvim
echo curl
apt -y install curl

echo Install i3Gaps + i3Blocks + FontsAwesome
add-apt-repository ppa:regolith-linux/release
apt update
apt -y install i3-gaps
apt -y install i3blocks
apt -y install gnome-tweak-tool
apt -y install fonts-font-awesome 

# Fonts Awesome cheatsheet https://fontawesome.com/v5/cheatsheet

echo Install pulse Graphical
apt -y install pavucontrol

#git clone https://github.com/prashant111192/.dotfiles.git
echo Install VSCODE
snap install --classic code



echo Install feh for wallpaper
apt -y install feh

echo Mousepad Profile
mkdir -p /etc/X11/xorg.conf.d
cp ./linked/90-touchpad.conf /etc/X11/xorg.conf.d/


echo Make all blocks executable

Now=$PWD

chmod +x ./packages/i3/.config/i3/config/blocks/*



echo light for using keys to work with screen brightness
echo based on https://unix.stackexchange.com/a/625983
apt -y install light



echo instal pywal
pip3 install pywal 
pip3 install haishoku 

echo "use wal -i <link to walpaper> --backend haishok"

echo Please restart device and run
echo light -N 10
echo this sets the minimum brightness of the device to 10%



#stow -n -R -d $HOME/tmpdotfiles/.dotfiles/ -t ~ bash 





