HomeDir=/home/thomas
mkdir -p $HomeDir/config
configDirBak=$HomeDir/.config_backup

pacman -S git vim xorg-xinit xorg-server xorg-xset
git clone --bare https://gitlab.com/Thomas_Niedrist/dotfiles.git $HomeDir/config/.cfg

function config {
	/usr/bin/git --git-dir=$HomeDir/config/.cfg --work-tree=$HOME $@
}

mkdir -p $configDirBak
config checkout 
if [ $? = 0 ]; then
		echo "Config Ckecked Out!";
else
		echo "Backing up Files.";
		config checkout 2>&1 |egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $configDirBak /{} && config checkout
fi;

config config status.showUntrackedFiles no
chown -R thomas .*
