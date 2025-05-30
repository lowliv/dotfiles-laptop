#!/bin/bash

# Count number of wallpapers
number=$(ls -1q "$HOME/media/wallpapers" | wc -l)

# Select a random wallpaper
n=$(shuf -i 1-"$number" -n 1)

# Find the nth wallpaper and set it
t=0
find "$HOME/media/wallpapers" -type f | while read -r file; do
  let ++t
  if [[ $t -eq $n ]]; then
    killall swaybg
    swaybg --image $file &
    echo $file > $HOME/.config/hypr/wp
    break
  fi
done

