#!/bin/bash
makemkvcon "info" "$1" --minlength=1800 | grep -c "was added"
