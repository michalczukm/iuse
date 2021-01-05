#!/bin/sh

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

dir_path=$(dirname $(realpath $0))

# 👇 based on https://www.grzegorowski.com/how-to-remap-single-mac-keyboard-key ❤️
# immedeately set bindings, no restart needed
hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x700000064,
      "HIDKeyboardModifierMappingDst":0x700000035}]
}'

# add task to autostart
sudo cp $dir_path/org.custom.keyboard-remap.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/org.custom.keyboard-remap.plist