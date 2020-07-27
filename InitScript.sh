HomeDir=/home/thomas

configDirBak=$HomeDir/.config_backup
mkdir -p $configDirBak

if [ -f "$HomeDir/.config" ]; then
	mv .config $configDirBak
fi
mkdir -p $HomeDir/.config/

yes | pacman -S git vim xorg-xinit xorg-server xorg-xset ttf-linux-libertine \
ttf-dejavu picom ttf-inconsolata

cd /opt
rm -rf yay-git
git clone https://aur.archlinux.org/yay-git.git
chown -R thomas:thomas ./yay-git
cd yay-git
sudo -u nobody makepkg -si
cd $HomeDir

rm -rf st
git clone https://gitlab.com/Thomas_Niedrist/st.git
cd st
make clean install
cd ..

ls -a | grep -Ev ".config_backup|Initscript.sh" |xargs -t -I '{}' mv {} $configDirBak

rm -rf $HomeDir/.config/.cfg
git clone --bare https://gitlab.com/Thomas_Niedrist/dotfiles.git $HomeDir/.config/.cfg

function config {
	/usr/bin/git --git-dir=$HomeDir/.config/.cfg --work-tree=$HomeDir $@
}

config checkout 
#if [ $? = 0 ]; then
#		echo "Config Ckecked Out!";
#else
#		echo "Backing up Files.";
#		config checkout 2>&1 |egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $$HomeDir/.config/.cfg /{} && config checkout
#fi;

config config status.showUntrackedFiles no
chown -R thomas .*
vim -e -s -c "PlugInstall" -c q
