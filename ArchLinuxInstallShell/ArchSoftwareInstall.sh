#!/bin/sh

#wget target
picomConfig=""
polybarConfig=""
i3Config=""
alacrittyConfig=""

#install packages

sudo pacman -S fish which ranger gdm
sudo curl -L https://get.oh-my.fish | fish

omf install alias

sudo pacman -S i3-wm i3blocks i3lock i3status i3-gaps picom alacritty

sudo pacman -S fcitx-rime fcitx-configtool

sudo pacman -S chromium

sudo pacman -S feh

sudo pacman -S wget

sudo pacman -S adobe-source-code-pro-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts

git clone https://aur.archlinux.org/yay.git && cd yay

sudo makepkg -si

#get config file

wget -O ~/.config/picom.conf ${picomConfig}

#polybar
if [! -d "~/.config/polybar"]; then
	mkdir ~/.config/polybar
else
	rm ~/.config/polybar/config
fi
wget -O ~/.config/polybar/config ${polybarConfig}

#i3
if [! -d "~/.config/i3"]; then
	mkdir ~/.config/i3
else
	rm ~/.config/i3/config
fi
wget -O ~/.config/i3/config ${i3Config}

#alacritty
if [! -d "~/.config/alacritty"]; then
	mkdir ~/.config/alacritty
else
	rm ~/.config/alacritty/alacritty.yml
fi
wget -O ~/.config/alacritty/alacritty.yml ${alacrittyConfig}

#screenfetch
wget -O /usr/bin/screenfetch https://git.io/vaHfR
sudo chmod +x /usr/bin/screenfetch

#switch shell
sudo chsh -s /usr/bin/fish

#alias
alias s screenfetch
alias c clear

