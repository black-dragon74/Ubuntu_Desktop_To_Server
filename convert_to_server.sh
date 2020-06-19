#!/bin/bash

echo "** Script by Nick aka black.dragon74 **"
echo "Converting Desktop to server..."

function abort() {
    echo "Fatal error: ${1}"
    exit 1
}

# update
sudo apt-get update || abort "Unable to update"

# install the 'tasksel' package so we can remove the desktop image
sudo apt-get install tasksel || abort "Unable to install tasksel"

# remove the desktop image
sudo tasksel remove ubuntu-desktop || abort "Unable to remove desktop image"

# tell tasksel to start the server image setup
sudo tasksel install server || abort "Unable to tell tasksel to install server image"

# install the server images
sudo apt-get install linux-server linux-image-server || abort "Unable to install server image"

# remove lightdm
sudo apt-get purge lightdm || abort "Unable to remove lightdm"

# remove all packages no longer required (~400 MB)
sudo apt-get autoremove || abort "Unable to autoremove obsolete packages"

# we are done
echo "We are all done.. Enjoy!"

#Done
exit 0