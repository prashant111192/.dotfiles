#!/bin/bash


#############
#Setting up custom linux
#All files changed are stored in ~/.old_dotfiles
#############

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

echo Install i3Gaps
add-apt-repository ppa:regolith-linux/release
apt update
apt -y install i3-gaps

apt -y install i3blocks


apt -y install gnome-tweak-tool
#git clone https://github.com/prashant111192/.dotfiles.git
echo Install VSCODE

snap install --classic code

echo Mousepad Profile
mkdir -p /etc/X11/xorg.conf.d
cp ./linked/90-touchpad.conf /etc/X11/xorg.conf.d/



#stow -n -R -d $HOME/tmpdotfiles/.dotfiles/ -t ~ bash 





