#!/bin/bash
while true; do 
    WIN_CLASS=$(xprop -id $(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5) WM_CLASS | cut -d "," -f2 | sed 's/"//g') 
    if [ -z $LAST_WIN ]; then 
        LAST_WIN=$WIN_CLASS 
    fi
    if [ "$WIN_CLASS" != "$LAST_WIN" ]; then 
        i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d""" -f2 
        echo "Window changed $WIN_CLASS"
        LAST_WIN=$WIN_CLASS 
    fi 
    sleep 1 
done

