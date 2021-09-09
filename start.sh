#!/bin/bash



# Update & Upgrade
sudo apt -y update dist-upgrade

# NVIDIA drivers
nvidia-detector
sudo apt -y install nvidia-driver-470

# Python Installation
sudo apt install -y python2 python3 python3-dev python3-pip

# Virtual Environments Installations
sudo apt -y install virtualbox qemu qemu-system-arm qemu-system-mips docker

# Pwn Environment Installations
sudo apt -y install gdb gdbserver gcc-multilib ltrace strace valgrind gcc-multilib

sudo wget 'https://bootstrap.pypa.io/pip/2.7/get-pip.py' && sudo python2 get-pip.py
sudo apt-get -y install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install --upgrade pwntools
sudo apt-get -y install python python-dev git libssl-dev libffi-dev build-essential
sudo python2 -m pip install --upgrade pwntools

# AV & Security Installations
sudo apt -y install clamav openvas

# IDE
sudo apt -y install vim vim-youcompleteme

# Misc Installations
sudo apt -y install hddtemp hwinfo vlc evince eog

# RF Software
sudo apt -y install gnuradio gqrx-sdr

# Removals
sudo apt -y remove mintupdate
sudo apt -y remove mintinstall

# Fix Popping sound issue @ /etc/pulse/default.pa
sudo sed -i "s/load-module module-suspend-on-idle/#load-module module-suspend-on-idle/g" /etc/pulse/default.pa
exit

