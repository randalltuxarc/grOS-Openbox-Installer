!#bin/bash
# grOS-Openbox-Installer
# Openbox Installer Script for GrombyangOS (grOS)
# Coded by: randalltux < rndtx@gros-team.org > // January, 10 2014 at 03:25
# Powered by: grOS-DEVELOPER < developer@gros-team.org >
# How to use; chmod +x grOS-Openbox-Installer.sh && sudo ./grOS-Openbox-Installer.sh

# init
FILE="/tmp/out.$$"
GREP="/bin/grep"
#.......
# Make sure only root can run this Script
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root!" 1>&2
	exit 1
fi
#

# install supported apps
apt-get install rxvt-unicode-256color thunar fonts-droid tint2 openbox obconf obmenu lxappearance nitrogen gmrun gsimplecal volumeicon-alsa xfce4-power-manager -y

# install compton
add-apt-repository ppa:richardgv/compton -y
apt-get update && apt-get install compton -y

# Copy Openbox folder to ~/.config
mv ~/.config/openbox ~/.config/openbox.bak && cp -r openbox ~/.config

# Copy tint2 folder to ~/.config
cp -r tint2 ~/.config

# Copy .Xdefaults to /home/$USER
cp .Xdefaults /home/$USER

# Copy .gtkrc-2.0 to /home/$USER
mv ~/.gtkrc-2.0 ~/.gtkrc-2.0.bak && cp .gtkrc-2.0 /home/$USER

# Copy compton.conf to /home/$USER
cp .compton.conf /home/$USER

# Copy openbox files from github