#!/bin/bash

FIREFOX_PLUGINS_PATH="/usr/lib/mozilla/plugins/"

# Create a temporal folder.
mkdir flash_tmp

# Uncompress flash package.
tar -xvf flash_player_npapi* -C flash_tmp > /dev/null

# Remove old libflash player.
sudo rm -rf "$FIREFOX_PLUGINS_PATH/libflashplayer.so"

# Move everything to the correct path.
sudo rsync flash_tmp/libflashplayer.so "$FIREFOX_PLUGINS_PATH/libflashplayer.so"
sudo rsync --recursive flash_tmp/usr /

# Delete temporal folder.
sudo rm -rf flash_tmp
