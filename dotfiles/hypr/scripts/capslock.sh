#!/bin/bash
awk '{ print $0; exit }' /sys/class/leds/input*::capslock/brightness
