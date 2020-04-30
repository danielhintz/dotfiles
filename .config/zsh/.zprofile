#!/bin/sh

[ "$(tty)" = "/dev/tty1" ] && exec startx "$XINITRC"
