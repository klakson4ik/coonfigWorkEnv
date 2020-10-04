#!/bin/bash
pathProject=$HOME/web/shop.local
pathScript=$HOME/scripts/web

function copyWeb(){
	cp -r $pathScript/config_i3 $HOME/.config/i3/config
	cp -r $pathScript/config_vimb $HOME/.config/vimb/config
	cp -r $pathScript/xinitrc $HOME/.xinitrc
	cp -r $pathScript/vimrc $HOME/.vimrc
	mkdir .config/termite
	cp -r $pathScript/config_termite $HOME/.config/termite/config
}

copyWeb
