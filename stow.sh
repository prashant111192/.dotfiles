#!/usr/bin/env bash

################
# Based on the following work
#https://stackoverflow.com/questions/45783937/bash-script-to-stow-linux-configuration-files-not-working-with-files-in-root-of
################



################
# This script will Stow all the dotfiles located in the ~/dotfiles folder.
# The -R flag is used to force a 'restow' which will remove any existing symlinks before attempting to Stow.
################

echo "make old_dotfiles"
mkdir -p ~/.old_dotfiles
echo Working on bash
mv ~/.bashrc ~/.old_dotfiles/ 

echo "Stowing Dotfiles...";

for file in ~/.dotfiles/packages/*; do
	# Only run Stow on the directories in the dotfiles folder and not the individual files.
	# Using 'basename' strips the filepath from the directory name. 
	if [ -d ${file} ]; then
		stow -S -d $HOME/.dotfiles/packages/ -t ~ $(basename $file) 

		#stow -R $(basename $file)
		echo "$(basename $file) stowed."; 
	fi
done

echo 'All stowed';
