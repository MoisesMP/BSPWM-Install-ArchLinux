#!/bin/bash
set -e
##################################################################################################################
# BSPWM-Install-ArchLinux
# Author	:	Moises Montaño



Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Default
DefaultColor='\e[39m'   # Default foreground color

b='\033[1m'
u='\033[4m'
bl='\E[30m'
r='\E[31m'
g='\E[32m'
y='\E[33m'
bu='\E[34m'
m='\E[35m'
c='\E[36m'
w='\E[37m'
endc='\E[0m'
enda='\033[0m'
spath="$( cd "$( dirname $0 )" && pwd )"


function showlogo {
  clear
echo ""
sleep 0.1
echo -e $Cyan   "    +${Yellow}-------------------------------------------------------------------------------------------${Cyan}+"
sleep 0.1
echo -e $Yellow   "    |                                                                                          $Yellow |"
sleep 0.1
echo -e "     |$Red             ████████     █████████   ██████████   ██             ██   ██       ██        $Yellow |"
sleep 0.1
echo -e "     |$Red             ██     ██   ██           ██      ██   ██             ██   ██ █   █ ██        $Yellow |"   
sleep 0.1
echo -e "     |$Red             ██     ██   ██           ██      ██   ██             ██   ██  █ █  ██        $Yellow |"  
sleep 0.1
echo -e "     |$Red             █████████   █████████    ██████████    █     █       █    ██   █   ██        $Yellow |"  
sleep 0.1
echo -e "     |$Red             ██     ██           ██   ██             █   █  █    █     ██       ██        $Yellow |"
sleep 0.1
echo -e "     |$Red             ██     ██           ██   ██              █ █    █  █      ██       ██        $Yellow |" 
sleep 0.1     
echo -e "     |$Red             ████████    █████████    ██               █      █        ██       ██        $Yellow |"  
sleep 0.1
echo -e "     |$Red                                                                                          $Yellow |" 
sleep 0.1
echo -e "     |$Red                                        INSTALLER                                         $Yellow |" 
sleep 0.1
echo -e "     |$Red              \e[1;37m  Created By Moises Montaño @MoisesMP: github.com/MoisesMP                  $Yellow |"
sleep 0.1
echo -e $Cyan   "    +${Yellow}-------------------------------------------------------------------------------------------${Cyan}+${Yellow}"
sleep 0.1
echo -e "                                                                                                             " 
echo -e "                     \e[101m\e[1;37m| [!]  | BSPWM Installer For Arch Linux | Ver.1.0  |\e[0m\n"               
}

function checkyay {
  which yay > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Yay]: installation found!;
else

echo [x]::[warning]:this script require Yay ;
echo ""
echo [!]::[please wait]: Installing Yay ..  ;
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si 
echo ""
fi
sleep 1
}

function checkgit {
    which git > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Git]: installation found!;
else

echo [x]::[warning]:this script require Git ;
echo ""
echo [!]::[please wait]: Installing Git ..  ;
sudo pacman -S git --noconfirm
echo ""
fi
sleep 1
}

function checkbspwm {
      which bspwm > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[BSPWM]: installation found!;
    else
        installbspwm
    fi
    sleep 1
}

function clonerepos {


    git clone http://github.com/baskerville/bspwm.git
    git clone http://github.com/baskerville/sxhkd.git

}

function installrepos {


        cd bspwm

        make & sudo make install

        cd ..

        cd sxhkd
        
        make & sudo make install
        
        cd ..

}

function copyexampleconfig {

        mkdir ~/.config/bspwm
        mkdir ~/.config/sxhkd

        cp /bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
        cp /sxhkd/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

        chmod +x ~/.config/bspwm/bspwmrc
        chmod +x ~/.config/sxhkd/sxhkdrc
}

function installbspwm {

package=bspwm
packages=bspwm sxhkd

    echo
    echo -e " Currently Installing ${b}BSPWM${enda}"
    echo -e "  Read more about it here: ${b}http://github.com/baskerville/bspwm/${endc}"
    echo && echo -en " ${y}Press Enter To Continue${endc}"
    read input

    echo [x]::[warning]: Cloning repositories of "$packages";

    clonerepos

    echo ""
    echo [!]::[please wait]: Compiling and installing "$packages";

    installrepos

    echo [!]::[please wait]: Copying example configuration;

    copyexampleconfig

    echo -e " ${b}BSPWM${enda} Was Successfully Installed"
    echo -en " ${y}Press Enter To Return To Menu${endc}"
    echo
    read input 

    
}

function check-polybar {
    which polybar > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Polybar]: installation found!;
else

echo [x]::[warning]:this script require Polybar ;
echo ""
echo [!]::[please wait]: Installing Polybar ..  ;
sudo pacman -S polybar --noconfirm
echo ""
fi
sleep 1
}

function checkpicom {
    which picom > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Picom]: installation found!;
else

echo [x]::[warning]:this script require Picom ;
echo ""
echo [!]::[please wait]: Installing Picom ..  ;
sudo pacman -S picom --noconfirm 
echo ""
fi
sleep 1
}

function checknitrogen {
    which picom > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Nitrogen]: installation found!;
else

echo [x]::[warning]:this script require Nitrogen ;
echo ""
echo [!]::[please wait]: Installing Nitrogen ..  ;
sudo pacman -S nitrogen --noconfirm
echo ""
fi
sleep 1
}

function checkrofi {
    which rofi > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Rofi]: installation found!;
else

echo [x]::[warning]:this script require Rofi ;
echo ""
echo [!]::[please wait]: Installing Rofi ..  ;
sudo pacman -S rofi --noconfirm
echo ""
fi
sleep 1
}

function checknemo {
    which nemo > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Nemo]: installation found!;
else

echo [x]::[warning]:this script require Nemo ;
echo ""
echo [!]::[please wait]: Installing Nemo ..  ;
sudo pacman -S nemo --noconfirm
echo ""
fi
sleep 1
}

function checkchromium {
    which chromium > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Chromium]: installation found!;
else

echo [x]::[warning]:this script require Chromium ;
echo ""
echo [!]::[please wait]: Installing Chromium ..  ;
sudo pacman -S Chromium --noconfirm
echo ""
fi
sleep 1
}

function checktilix {
    which picom > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Tilix]: installation found!;
else

echo [x]::[warning]:this script require Tilix ;
echo ""
echo [!]::[please wait]: Installing Tilix ..  ;
sudo pacman -S tilix --noconfirm
echo ""
fi
sleep 1
}

function checkgnomecontrol {
    which gnome-control-center > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Gnome Control Center]: installation found!;
else

echo [x]::[warning]:this script require Gnome Control Center ;
echo ""
echo [!]::[please wait]: Installing Gnome Control Center ..  ;
sudo pacman -S gnome-control-center --noconfirm
echo ""
fi
sleep 1
}

function checkblueberry {
    which blueberry > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Blueberry]: installation found!;
else

echo [x]::[warning]:this script require Blueberry;
echo ""
echo [!]::[please wait]: Installing Blueberry ..  ;
sudo pacman -S blueberry --noconfirm
echo ""
fi
sleep 1
}

function checknetwork {
    which networkmanager-dmenu-git > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Networkmanager-dmenu]: installation found!;
else

echo [x]::[warning]:this script require Networkmanager-dmenu;
echo ""
echo [!]::[please wait]: Installing Networkmanager-dmenu ..  ;
yay -S --noconfirm networkmanager-dmenu-git
echo ""
fi
sleep 1
}

function checkdunst {
    which dunst > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Dunst]: installation found!;
else

echo [x]::[warning]:this script require Dunst;
echo ""
echo [!]::[please wait]: Installing Dunst ..  ;
sudo pacman -S dunst --noconfirm
echo ""
fi
sleep 1
}

function checklolcat {
    which lolcat > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Lolcat]: installation found!;
else

echo [x]::[warning]:this script require Lolcat;
echo ""
echo [!]::[please wait]: Installing Lolcat ..  ;
sudo pacman -S lolcat --noconfirm
echo ""
fi
sleep 1
}

function checklolcat {
    which pfetch > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Pfetch]: installation found!;
else

echo [x]::[warning]:this script require Pfetch;
echo ""
echo [!]::[please wait]: Installing Pfetch ..  ;
yay -S --noconfirm pfetch
echo ""
fi
sleep 1
}

function checkfeh {
    which feh > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Feh]: installation found!;
else

echo [x]::[warning]:this script require Feh;
echo ""
echo [!]::[please wait]: Installing Feh ..  ;
sudo pacman -S feh --noconfirm
echo ""
fi
sleep 1
}

function checkthunar {
    which thunar > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Thunar]: installation found!;
else

echo [x]::[warning]:this script require Thunar;
echo ""
echo [!]::[please wait]: Installing Thunar ..  ;
sudo pacman -S thunar --noconfirm
echo ""
fi
sleep 1
}

function checkfirefox {
    which firefox > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Firefox]: installation found!;
else

echo [x]::[warning]:this script require Firefox;
echo ""
echo [!]::[please wait]: Installing Firefox .. ;
sudo pacman -S firefox --noconfirm
echo ""
fi
sleep 1
}

function checklxappearance {
    which lxappearance > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Lxappearance]: installation found!;
else

echo [x]::[warning]:this script require Lxappearance;
echo ""
echo [!]::[please wait]: Installing Lxappearance .. ;
sudo pacman -S lxappearance --noconfirm
echo ""
fi
sleep 1
}

function clonerepo {

git clone https://github.com/MoisesMP/dotfiles.git

}

function compilingrepo {

    cd dotfiles/

    cp -r fonts/* ~/.local/share/fonts

    fc-cache -v

    cd .config

    cp -r * ~/.config/

    cd ..

    cp -r .zshrc ~/

    cd

    chmod +x .zshrc

    cd ~/.config/bspwm/

    chmod +x bspwmrc

}

function apps {

    checkpicom   
    checknitrogen
    checkfeh
    check-polybar
    checkrofi
    checknemo
    checkthunar
    checkchromium
    checkfirefox
    checktilix
    checkgnomecontrol
    checkblueberry
    #checknetwork
    checkdunst
    checklolcat
    lxappearance

}

function installnetwork {

    echo
    echo -e " Currently Installing ${b}NetworkManager${enda}"
    echo -e "  Read more about it here: ${b}${endc}"
    echo && echo -en " ${y}Press Enter To Continue${endc}"
    read input

    sudo pacman -S networkmanager --noconfirm

    sudo systemctl enable networkmanager.service

    echo -e " ${b} [Networkmanager-dmenu]${enda}"
    echo -e "
            S) Instalar Networkmanager-dmenu 
            N) Exit
            "

    echo
    echo -en " Choose An Option: "
    read option
    case $option in
        s) checknetwork;;
        S) checknetwork;;
        n) sleep 1;;
        N) sleep 1;;
        *) echo " \"$option\" Is Not A Valid Option"; sleep 1; showvid ;;
    esac

    echo -e " ${b}NetworkManager${enda} Was Successfully Installed"
    echo -en " ${y}Press Enter To Return To Menu${endc}"
    echo
    read input

}


function installdotfiles {


    apps


    echo
    echo -e " Currently Installing ${b}DOTFILES${enda}"
    echo -e "  Read more about it here: ${b}http://github.com/MoisesMP/dotfiles/${endc}"
    echo && echo -en " ${y}Press Enter To Continue${endc}"
    read input

    echo [x]::[warning]: Cloning repositories;

    clonerepo

    echo ""
    echo [!]::[please wait]: Compiling and installing;

    compilingrepo

    echo -e " ${b}DOTFILES${enda} Was Successfully Installed"
    echo -en " ${y}Press Enter To Return To Menu${endc}"
    echo
    read input 

}


function showmpd {
    showlogo
    echo -e " ${b} [MPD & NCMPCPP]${enda}"
    echo -e "
            1) MPD For English Systems
            2) MPD For Spanish Systems

            q)    Return To Menu"

    echo
    echo -en " Choose An Option: "
    read option
    case $option in
        1) installmpd-en;;
        2) installmpd-es;;
        q) sleep 1;;
        *) echo " \"$option\" Is Not A Valid Option"; sleep 1; showvid ;;
  esac
}

function installmpd {
     which mpd > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[Mpd]: installation found!;
else

echo [!]::[please wait]: Installing MPD .. ;
sudo pacman -S mpd --noconfirm
sudo pacman -S mpc --noconfirm
echo ""
fi
sleep 1
}


function installncmpcpp {
    which ncmpcpp > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
    echo [✔]::[NCMPCPP]: installation found!;
else

echo [!]::[please wait]: Installing NCMPCPP .. ;
sudo pacman -S ncmpcpp --noconfirm
echo ""
fi
sleep 1

}

function configmpd-en {
     sudo rm /etc/mpd.conf

        mkdir -p ~/.config/mpd

        cp /usr/share/doc/mpd/mpdconf.example ~/.config/mpd/mpd.conf

        sed -i 's/#music_directory/music_directory/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/music/~\/Music/g' ~/.config/mpd/mpd.conf

        sed -i 's/#playlist_directory/playlist_directory/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/playlists/~\/.config\/mpd\/playlists/g' ~/.config/mpd/mpd.conf


        sed -i 's/#db_file/db_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/database/~\/.config\/mpd\/database/g' ~/.config/mpd/mpd.conf

        sed -i 's/#log_file/log_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/log/~\/.config\/mpd\/log/g' ~/.config/mpd/mpd.conf

        sed -i 's/#pid_file/pid_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/pid/~\/.config\/mpd\/pid/g' ~/.config/mpd/mpd.conf

        sed -i 's/#state_file/state_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/state/~\/.config\/mpd\/state/g' ~/.config/mpd/mpd.conf

        sed -i 's/#sticker_file/sticker_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/sticker/~\/.config\/mpd\/sticker/g' ~/.config/mpd/mpd.conf

        sed -i 's/#bind_to_address/bind_to_address/g' ~/.config/mpd/mpd.conf

        sed -i 's/#port/port/g' ~/.config/mpd/mpd.conf

        sed -i 's/#auto_update/auto_update/g' ~/.config/mpd/mpd.conf

        sed -i 's/#follow_inside_symlinks/follow_inside_symlinks/g' ~/.config/mpd/mpd.conf

        sed -i 's/~\/.mpd\/socket/~\/.config\/mpd\/socket/g' ~/.config/mpd/mpd.conf

        sed -i 's/#filesystem_charset/filesystem_charset/g' ~/.config/mpd/mpd.conf

        echo 'audio_output {
              type  "alsa"
              name  "mpd-alsa"
              mixer_type "software"
        }
        audio_output {
        type               "fifo"
        name               "toggle_visualizer"
        path               "/tmp/mpd.fifo"
        format             "44100:16:2"
        }' >> ~/.config/mpd/mpd.conf


        mkdir ~/.config/mpd/playlists

        mkdir ~/.ncmpcpp
        cp /usr/share/doc/ncmpcpp/config ~/.ncmpcpp/config

        sed -i 's/#mpd_host/mpd_host/g' ~/.ncmpcpp/config
        sed -i 's/#mpd_port/mpd_port/g' ~/.ncmpcpp/config
        sed -i 's/#mpd_music_dir = ~\/music/mpd_music_dir = ~\/Music/g' ~/.ncmpcpp/config


        cp /usr/share/doc/ncmpcpp/bindings ~/.ncmpcpp/bindings
}

function configmpd-es {

        sudo rm /etc/mpd.conf

        mkdir -p ~/.config/mpd

        cp /usr/share/doc/mpd/mpdconf.example ~/.config/mpd/mpd.conf

        sed -i 's/#music_directory/music_directory/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/music/~\/Música/g' ~/.config/mpd/mpd.conf

        sed -i 's/#playlist_directory/playlist_directory/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/playlists/~\/.config\/mpd\/playlists/g' ~/.config/mpd/mpd.conf


        sed -i 's/#db_file/db_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/database/~\/.config\/mpd\/database/g' ~/.config/mpd/mpd.conf

        sed -i 's/#log_file/log_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/log/~\/.config\/mpd\/log/g' ~/.config/mpd/mpd.conf

        sed -i 's/#pid_file/pid_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/pid/~\/.config\/mpd\/pid/g' ~/.config/mpd/mpd.conf

        sed -i 's/#state_file/state_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/state/~\/.config\/mpd\/state/g' ~/.config/mpd/mpd.conf

        sed -i 's/#sticker_file/sticker_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/sticker/~\/.config\/mpd\/sticker/g' ~/.config/mpd/mpd.conf

        sed -i 's/#bind_to_address/bind_to_address/g' ~/.config/mpd/mpd.conf

        sed -i 's/#port/port/g' ~/.config/mpd/mpd.conf

        sed -i 's/#auto_update/auto_update/g' ~/.config/mpd/mpd.conf

        sed -i 's/#follow_inside_symlinks/follow_inside_symlinks/g' ~/.config/mpd/mpd.conf

        sed -i 's/~\/.mpd\/socket/~\/.config\/mpd\/socket/g' ~/.config/mpd/mpd.conf

        sed -i 's/#filesystem_charset/filesystem_charset/g' ~/.config/mpd/mpd.conf

        echo 'audio_output {
              type  "alsa"
              name  "mpd-alsa"
              mixer_type "software"
        }
        audio_output {
        type               "fifo"
        name               "toggle_visualizer"
        path               "/tmp/mpd.fifo"
        format             "44100:16:2"
        }' >> ~/.config/mpd/mpd.conf


        mkdir ~/.config/mpd/playlists

        mkdir ~/.ncmpcpp
        cp /usr/share/doc/ncmpcpp/config ~/.ncmpcpp/config

        sed -i 's/#mpd_host/mpd_host/g' ~/.ncmpcpp/config
        sed -i 's/#mpd_port/mpd_port/g' ~/.ncmpcpp/config
        sed -i 's/#mpd_music_dir = ~\/music/mpd_music_dir = ~\/Música/g' ~/.ncmpcpp/config


        cp /usr/share/doc/ncmpcpp/bindings ~/.ncmpcpp/bindings
}

function installmpd-en {
    echo
    echo -e " Currently Installing ${b}MPD${enda}"
    echo -e "  Read more about it here: ${b}https://wiki.archlinux.org/index.php/Music_Player_Daemon/${endc}"
    echo && echo -en " ${y}Press Enter To Continue${endc}"
    read input

    echo [x]::[warning]: Installing MPD;

    installmpd

    echo [x]::[warning]: Installing MPD;

    installncmpcpp

    echo ""
    echo [!]::[please wait]: Copying Configuration;

    configmpd-en

    sudo systemctl enable mpd.service
    sudo systemctl start mpd.service

    echo -e " ${b}MPD${enda} Was Successfully Installed"
    echo -en " ${y}Press Enter To Return To Menu${endc}"
    echo
    read input 

}

function installmpd-es {
    echo
    echo -e " Currently Installing ${b}MPD${enda}"
    echo -e "  Read more about it here: ${b}https://wiki.archlinux.org/index.php/Music_Player_Daemon_(Español)/${endc}"
    echo && echo -en " ${y}Press Enter To Continue${endc}"
    read input

    echo [x]::[warning]: Installing MPD;

    installmpd

    echo [x]::[warning]: Installing MPD;

    installncmpcpp

    echo ""
    echo [!]::[please wait]: Copying Configuration;

    configmpd-es

    sudo systemctl enable mpd.service
    sudo systemctl start mpd.service

    echo -e " ${b}MPD${enda} Was Successfully Installed"
    echo -en " ${y}Press Enter To Return To Menu${endc}"
    echo
    read input

}


checkgit
checkyay 
showlogo
sleep 1


function exitScript {
  showlogo && echo -e " Thank You For Using ${b} BSPWM-Install-ArchLinux Script ${enda}"
  echo
  sleep 1
  exit
}


while :
do
showlogo
echo -e "                                ${BCyan}[ BSPWM Installer MENU ]${enda}"
echo -e "                               GIVE ME A TARGET

 [1]   BSPWM INSTALL                    [4]   INSTALL MPD & NCMPCPP      
 [2]   INSTALL MY DOTFILES         
 [3]   INSTALL NETWORKMANAGER
          
 q)    Quit Script"   
        
        
        
echo
echo -en " Select Option: "
read option
case $option in
1) checkbspwm;;
2) installdotfiles;;
3) installnetwork;;
4) showmpd;;
q) exitScript;;
*) echo " \"$option\" Is Not A Valid Option"; sleep 1 ;;

esac

done
