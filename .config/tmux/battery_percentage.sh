#!/bin/bash

total_energy=0
total_full=0

for bat in /sys/class/power_supply/BAT*; do
    status=$(cat "$bat/status")
    if [[ "$status" == "Charging" || "$status" == "Full" ]]; then
        exit 0  # Output nothing if any battery is charging or full
    fi
    
    energy_now=$(cat "$bat/energy_now" 2>/dev/null || cat "$bat/charge_now")
    energy_full=$(cat "$bat/energy_full" 2>/dev/null || cat "$bat/charge_full")
    
    total_energy=$((total_energy + energy_now))
    total_full=$((total_full + energy_full))
done

if [[ $total_full -gt 0 ]]; then
    echo $((total_energy * 100 / total_full))%
fi

