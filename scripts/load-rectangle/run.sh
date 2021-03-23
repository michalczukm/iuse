#!/bin/sh

echo 'load-rectangle: 🚀 start'

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

dir_path=$(dirname $(realpath $0))

brew install --cask rectangle

# load config
sudo cp $dir_path/com.knollsoft.Rectangle.plist $HOME/Library/Preferences/com.knollsoft.Rectangle.plist

echo 'load-rectangle: 🎉 done'