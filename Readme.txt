Use Stow to link the files to your home directory. 

-n can be used to simuilate the changes before they are finalised. 

stow -nSt ~ *

-S Stow
-t Target

-D Delink

--adobt use this if the files already exist in your home folder...they are then copied to the location and linked. Be careful with it though. 

For Fonts

stow -nSt /usr/share/fonts *
