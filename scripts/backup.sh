#!/bin/bash
chmod u+x $HOME/scripts/*
for file in $HOME/scripts/*; do
    ln -s "$file" "$HOME/bin/"
done
rm $HOME/bin/\*
rm -rf $HOME/projects/.config
cp -ru $HOME/scripts $HOME/projects/dotfiles/
cp -ru $HOME/.config/btop $HOME/projects/dotfiles/.config
cp -ru $HOME/.config/dunst $HOME/projects/dotfiles/.config
cp -ru $HOME/.config/fish $HOME/projects/dotfiles/.config
cp -ru $HOME/.config/helix $HOME/projects/dotfiles/.config
cp -ru $HOME/.config/hypr $HOME/projects/dotfiles/.config
cp -ru $HOME/.config/OpenTabletDriver $HOME/projects/dotfiles/.config
cp -ru $HOME/.config/kitty $HOME/projects/dotfiles/.config
cp -ru $HOME/.config/ranger $HOME/projects/dotfiles/.config
cp -ru $HOME/.config/rofi $HOME/projects/dotfiles/.config
cp -ru $HOME/.config/tmux $HOME/projects/dotfiles/.config
cp -ru $HOME/.config/themewiz $HOME/projects/dotfiles/.config
cp -ru $HOME/.config/waybar $HOME/projects/dotfiles/.config

rm $HOME/projects/dotfiles/aor_pkglist.txt
rm $HOME/projects/dotfiles/aur_pkglist.txt
pacman -Qn > $HOME/projects/dotfiles/aor_pkglist.txt
pacman -Qm > $HOME/projects/dotfiles/aur_pkglist.txt

rm $HOME/projects/dotfiles/.config/ranger/ranger/plugins/ranger_devicons/.gitignore
rm $HOME/projects/dotfiles/.config/ranger/ranger_nopreview/plugins/ranger_devicons/.gitignore
exit
