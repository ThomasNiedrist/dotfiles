#!/bin/bash
#useradd -m -g wheel thomas
HomeDir=/home/thomas
configDirBak=$HomeDir/.config_backup
RepoFileName="Repos.txt"
PackageFileName="Packages.txt"
cp $RepoFileName $HomeDir
cp $PackageFileName $HomeDir
rm -rf st dmenu dwm
rm -rf $HomeDir/.config/.cfg
rm -rf $configDirBak

mkdir -p $configDirBak

if [ -f "$HomeDir/.config" ]; then
	mv $HomeDir/.config $configDirBak/.config
	rm -rf $HomeDir/.config
fi
mkdir -p $HomeDir/.config/

pacman -S --needed - < $PackageFileName

#cd /opt ||exit
rm -rf yay-git
git clone https://aur.archlinux.org/yay.git
chown -R thomas ./yay
cd yay ||exit
makepkg -si
cd $HomeDir || exit

yay -S shell-color-scripts

while IFS= read -r line
do 
		FolderName="$(echo "$line" | sed 's:.*/\(\w*$\):\1:g')"
		rm -rf  $FolderName
		git clone "$line"
		cd $FolderName || exit
		make clean install
		cd ..
done < "$RepoFileName"	



ls -a | grep -Ev ".ssh|.config_backup|Initscript.sh" |xargs -t -I '{}' mv {} $configDirBak

git clone --bare https://gitlab.com/Thomas_Niedrist/dotfiles.git $HomeDir/.config/.cfg

function config {
	/usr/bin/git --git-dir=$HomeDir/.config/.cfg --work-tree=$HomeDir "$@""
}

config checkout 

config config status.showUntrackedFiles no
chown -R thomas .*
vim -e -s -c "PlugInstall" -c q
