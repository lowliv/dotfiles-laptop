#!/bin/bash

while true; do
    total_energy=0
    total_full=0
    charging=false

    for bat in /sys/class/power_supply/BAT*; do
        status=$(cat "$bat/status")
        if [[ "$status" == "Charging" ]]; then
            charging=true
        fi

        energy_now=$(cat "$bat/energy_now" 2>/dev/null || cat "$bat/charge_now")
        energy_full=$(cat "$bat/energy_full" 2>/dev/null || cat "$bat/charge_full")

        total_energy=$((total_energy + energy_now))
        total_full=$((total_full + energy_full))
    done

    if [[ $total_full -gt 0 ]]; then
        percentage=$((total_energy * 100 / total_full))
    else
        percentage=0
    fi

    # Determine the "alt" value
    if $charging; then
        alt="charging"
    elif [ "$percentage" -gt 95 ]; then
        alt="full"
    elif [ "$percentage" -ge 80 ]; then
        alt="high"
    elif [ "$percentage" -ge 40 ]; then
        alt="medium"
    elif [ "$percentage" -ge 10 ]; then
        alt="low"
    else
        alt="very_low"
    fi

    # Output JSON for Waybar
    echo "{\"text\": \"${percentage}%\", \"alt\": \"$alt\"}"

    sleep 10
done

