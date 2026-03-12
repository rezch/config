#!/bin/bash

upower \
    -i $( upower -e | grep headphones | head -n 1 ) \
    | grep percentage \
    | awk '{print $2}'
