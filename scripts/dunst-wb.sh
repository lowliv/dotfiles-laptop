#!/bin/bash
while :
do
  num1=$(dunstctl count displayed)
  num2=$(dunstctl count history)
  num3=$(dunstctl count waiting)
  status=$(dunstctl is-paused)
  
  if [ $status = 'true' ]; then
    alt="dnd"
  fi
  
  if [ $status = 'false' ]; then
    alt="normal"
  fi
  total=$((num1+num2+num3))
  if [ "$total" == "$total_P" ] && [ "$status" == "$status_P" ]; then
    echo '{"text": "'"$total"'", "alt": "'"$alt"'", "tooltip": "", "class": "none"}'
  fi
  total_P=$total
  status_P=$status
  
  waybar_status=$(pgrep waybar)
  if [[ -z "$waybar_status" ]]; then
    exit
  fi
  sleep 0.5
  
done
