#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <directory_name>"
    exit 1
fi

if [ -d "$1" ]; then
    echo "Directory '$1' already exists. Exiting."
    exit 0
fi

mkdir -p "$1"

cp -r "base/"* "$1"