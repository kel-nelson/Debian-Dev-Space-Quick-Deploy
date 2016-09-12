#!/bin/sh

#set temp downloads folder
Downloads_Folder=~
Downloads_Folder=$Downloads_Folder"/Downloads/Setup-Dev-Environment-Temp"

rm -Rf "$Downloads_Folder"
mkdir "$Downloads_Folder"

#get visual studio code
wget --user-agent="Debian APT-HTTP/1.3 (1.0.1ubuntu2)" --content-disposition -E -c https://go.microsoft.com/fwlink/?LinkID=760868 -O "$Downloads_Folder/temp.deb"
sudo dpkg -i "$Downloads_Folder/temp.deb"
rm "$Downloads_Folder/temp.deb"

#setup visual studio code settings
cp ./visual-studio-code-settings/settings.json ~/.config/Code/User

#enable backlite keyboard toggle (scroll lock) hot key
sudo cp /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us.backup
sudo cp ./system-settings/backlite-keyboard-activate/us /usr/share/X11/xkb/symbols
sudo rm -f /var/lib/xkb/* #clear old keyboard settings

rm -Rf "$Downloads_Folder"
echo -E "FYI - Some setting changes require a system reboot to take effect."
