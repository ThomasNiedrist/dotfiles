HomeDir=/home/thomas
configDirBak=$HomeDir/.config_backup

rm -rf st dmenu
rm -rf $HomeDir/.config/.cfg
rm -rf $configDirBak

mkdir -p $configDirBak

if [ -f "$HomeDir/.config" ]; then
	mv $HomeDir/.config $configDirBak/.config
	rm -rf $HomeDir/.config
fi
mkdir -p $HomeDir/.config/

yes j | pacman -S git vim xorg-xinit xorg-server xorg-xset ttf-linux-libertine \
ttf-dejavu picom ttf-inconsolata

cd /opt
rm -rf yay-git
git clone https://aur.archlinux.org/yay-git.git
chown -R thomas:thomas ./yay-git
cd yay-git
sudo -u nobody makepkg -si
cd $HomeDir

git clone https://gitlab.com/Thomas_Niedrist/st.git
cd st
make clean install
cd ..

git clone https://gitlab.com/Thomas_Niedrist/dmenu.git
cd dmenu
make clean install
cd ..

ls -a | grep -Ev ".config_backup|Initscript.sh" |xargs -t -I '{}' mv {} $configDirBak

git clone --bare https://gitlab.com/Thomas_Niedrist/dotfiles.git $HomeDir/.config/.cfg

function config {
	/usr/bin/git --git-dir=$HomeDir/.config/.cfg --work-tree=$HomeDir $@
}

config checkout 

config config status.showUntrackedFiles no
chown -R thomas .*
vim -e -s -c "PlugInstall" -c q
