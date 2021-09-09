#!/bin/bash



# Update & Upgrade
sudo apt update
sudo -y apt 

# NVIDIA drivers
nvidia-detector


# Installations
sudo apt install vim vim-youcompleteme gcc-multilib hddtemp clamav gdb gdbserver

# Removals
sudo apt remove mintupdate
sudo apt remove


# Fix Popping sound issue @ /etc/pulse/default.pa
sudo su
sed -i "s/load-module module-suspend-on-idle/#load-module module-suspend-on-idle/g" /etc/pulse/default.pa
exit

