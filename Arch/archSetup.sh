#!/bin/bash

# This file is intended to take all the existing configurations in this repository, and copy them to the actual environment

dotfiles_dir=$(pwd)
home_dir="/home/scald"
echo "Using $dotfiles_dir"

create_softlink(){
	echo "Creating soft link for $1"
	echo "Directory: $2"
	rm $2
	ln -s $3 $2
}

echo "Installing zsh"
pacman -S --noconfirm zsh make ly fastfetch gcc

create_softlink "bashrc" "$home_dir/.bashrc" "$dotfiles_dir/.bashrc"
source "$home_dir/.bashrc"

create_softlink "vimrc" "$home_dir/.vimrc" "$dotfiles_dir/.vimrc"

xprofile="$homedir/.xprofile"
create_softlink "xprofile" $xprofile "$dotfiles_dir/.xprofile"

# ly is the display manager, meaning, the UI that shows up when you first start the session
mkdir -p /etc/ly
create_softlink "ly" "/etc/ly/.config.ini" "$dotfiles_dir/etc/ly/.config.ini"

create_softlink "zshrc" "$home_dir/.zshrc" "$dotfiles_dir/home/scald/.zshrc"

mkdir -p "$home_dir/.config/kitty"
create_softlink "kitty.config" "$home_dir/.config/kitty/kitty.conf" "$dotfiles_dir/home/scald/.config/kitty/kitty.conf"


mkdir -p "$home_dir/.config/i3"
create_softlink "i3/config" "$home_dir/.config/i3/config" "$dotfiles_dir/home/scald/.config/i3/config"

mkdir -p "$home_dir/.config/i3status"
create_softlink "i3status/config" "$home_dir/.config/i3status/config" "$dotfiles_dir/home/scald/.config/i3status/config"

# nvim stuff
mkdir -p "$home_dir/.config/nvim"
create_softlink "nvim-init.lua" "$home_dir/.config/nvim/init.lua" "$dotfiles_dir/home/scald/.config/nvim/init.lua"


mkdir -p "$home_dir/.config/nvim/lua"
create_softlink "nvim-plugins.lua" "$home_dir/.config/nvim/lua/plugins.lua" "$dotfiles_dir/home/scald/.config/nvim/lua/plugins.lua"

create_softlink "nvim-remap.lua" "$home_dir/.config/nvim/lua/remap.lua" "$dotfiles_dir/home/scald/.config/nvim/lua/remap.lua"


mkdir -p "$home_dir/.config/nvim/lua/config"
mkdir -p "$home_dir/.config/nvim/lua/plugins"
create_softlink "bootstrap.lua" "$home_dir/.config/nvim/lua/config/bootstrap.lua" "$dotfiles_dir/home/scald/.config/nvim/lua/config/bootstrap.lua"
create_softlink "lazy.lua" "$home_dir/.config/nvim/lua/config/lazy.lua" "$dotfiles_dir/home/scald/.config/nvim/lua/config/lazy.lua"

plugins="/home/scald/src/dotfiles/Arch/home/scald/.config/nvim/lua/plugins"
final_plugins="/home/scald/.config/nvim/lua/plugins"
for file in "$plugins"/*; do
	echo "Testing file $file"
	if [ -f "$file" ]; then
		echo "Creating softline for $file"
		ln -s "$file" "$final_plugins"
	fi
done
