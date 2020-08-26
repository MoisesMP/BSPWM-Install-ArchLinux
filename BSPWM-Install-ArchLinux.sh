#!/bin/bash
set -e
##################################################################################################################
# BSPWM-Install-ArchLinux
# Author	:	Moises Montaño

package=bspwm
packages=bspwm sxhkd
#----------------------------------------------------------------------------------
#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then

    echo "################################################################"
    echo "################## "$package" is already installed"
    echo "################################################################"
    

else


    echo ">>> Cloning repositories of "$packages""

        git clone http://github.com/baskerville/bspwm.git
        git clone http://github.com/baskerville/sxhkd.git
    
    echo ">>> Compiling and installing "$packages""

        cd bspwm

        make & sudo make install

        cd ..

        cd sxhkd
        
        make & sudo make install
        
        cd ..

    echo ">>> Copying example configuration"

        mkdir ~/.config/bspwm
        mkdir ~/.config/sxhkd

        cp /bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
        cp /sxhkd/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

        chmod +x ~/.config/bspwm/bspwmrc
        chmod +x ~/.config/sxhkd/sxhkdrc
        

        echo "################################################################"
        echo "################## Installation Complete "
        echo "################################################################"
    

fi

