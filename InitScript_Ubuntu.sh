#!/bin/bash
HomeDir=/home/thomas
configDirBak=$HomeDir/.config_backup

rm -rf st dmenu dwm
rm -rf $HomeDir/.config/.cfg
rm -rf $configDirBak

mkdir -p $configDirBak

if [ -f "$HomeDir/.config" ]; then
	mv $HomeDir/.config $configDirBak/.config
	rm -rf $HomeDir/.config
fi
mkdir -p $HomeDir/.config/

yes j | sudo apt-get install make git vim xorg-xinit xorg-server xorg-xset libx11-dev libxft-dev ttf-linux-libertine \
ttf-dejavu picom ttf-inconsolata

git clone https://gitlab.com/Thomas_Niedrist/st.git
cd st
make clean install
cd ..

git clone https://gitlab.com/Thomas_Niedrist/dmenu.git
cd dmenu
make clean install
cd ..

git clone https://gitlab.com/Thomas_Niedrist/dwm.git
cd dwm
make clean install
cd ..

ls -a | grep -Ev ".ssh|.config_backup|Initscript.sh" |xargs -t -I '{}' mv {} $configDirBak

git clone --bare https://gitlab.com/Thomas_Niedrist/dotfiles.git $HomeDir/.config/.cfg

function config {
	/usr/bin/git --git-dir=$HomeDir/.config/.cfg --work-tree=$HomeDir $@
}

config checkout 

config config status.showUntrackedFiles no
chown -R thomas .*
vim -e -s -c "PlugInstall" -c q
