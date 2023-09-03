#!/bin/bash
"/mnt/e/sak/random program/makemkv/real/MakeMKV/makemkvcon64.exe" "info" "$1" --minlength=1800 | grep -c "was added"
