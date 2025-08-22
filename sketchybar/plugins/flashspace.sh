#!/bin/bash

if [ "$1" = "$WORKSPACE" ]; then
  sketchybar --set $NAME label.color=0xffff0000
else
  sketchybar --set $NAME label.color=0xffffffff
fi
