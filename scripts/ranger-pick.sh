#!/bin/bash
var=${ZELLIJ:-10}
if [ $var -eq 10 ]; then 
  exit
else
  ranger -r $HOME/.config/ranger/ranger_nopreview --choosefile=/tmp/OUTPUT
  path=$( cat /tmp/OUTPUT )
  zellij action toggle-floating-panes
  zellij action write 27
  zellij action write-chars ":$1 $path"
  zellij action write 13
  exit
fi

