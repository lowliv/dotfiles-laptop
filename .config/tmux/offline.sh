#!/bin/bash

# Check if we can reach a known IP
if ! ping -q -c 1 -W 1 1.1.1.1 >/dev/null 2>&1; then
    echo " "
    exit 1
fi

# Check if DNS is working by resolving a domain
if ! getent hosts archlinux.org >/dev/null 2>&1; then
    echo " DNS"
    exit 1
fi


