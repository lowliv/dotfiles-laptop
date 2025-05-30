#!/bin/bash
rm $HOME/projects/dotfiles/aor_pkglist.txt
rm $HOME/projects/dotfiles/aur_pkglist.txt
pacman -Qn > $HOME/projects/dotfiles/aor_pkglist.txt
pacman -Qm > $HOME/projects/dotfiles/aur_pkglist.txt
exit
