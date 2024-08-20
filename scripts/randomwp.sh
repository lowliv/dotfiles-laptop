#!/bin/bash
t=0
number=$(ls -1q wallpapers | wc -l)
n=$(shuf -i 1-$number -n 1)
name=0
echo $n
find "/home/camacmi/wallpapers" | while read -r file; do
  name="$file"
  echo "$file"
  echo "$name"
  let ++t
  if [[ $t -eq $n ]]; then
    killall swaybg
    swaybg --image "$name";
    break
  fi
done

