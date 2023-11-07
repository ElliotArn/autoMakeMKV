#!/bin/bash
makemkvcon "info" "$1" --minlength=1000 | grep -c "was added"
