#!/bin/bash

BELL="󰂚"
BELL_PENDING="󱅫"
BELL_DND="󱏧"

if [[ $( swaync-client -D ) != "false" ]]; then
    echo $BELL_DND
elif [[ $( swaync-client -c ) != "0" ]]; then
    echo -e $BELL_PENDING
else
    echo -e $BELL
fi
