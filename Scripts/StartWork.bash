#!/bin/bash

find ~/Obsidian -maxdepth 5 -type d -not -path '*/node_modules*' -not -path '*/.*' 2>&1 | grep -v "Permission denied" > ~/.startwork.txt
find ~/Code -maxdepth 3 -type d -not -path '*/node_modules*' -not -path '*/.*' 2>&1 | grep -v "Permission denied" >> ~/.startwork.txt
