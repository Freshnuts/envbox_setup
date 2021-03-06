#!/bin/bash

# .bashrc custom prompt
# PS1="\[\033[0;33m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[5;31m\]\360\237\222\200\033[1;31m\]dead\360\237\222\200\[\033[0;33m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;33m\]root\[\033[01;33m\]@\[\033[01;33m\]\h'; else echo -e '\[\033[1;92m\]\u\[\033[1;33m\]\U1f525'; fi)\[\033[0;33m\]]\342\224\200[\[\033[1;35m\]\w\[\033[0;33m\]]\n\[\033[0;33m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[1;36m\]\360\237\222\243 \[\e[0m\]"

# /etc/network/interfaces - timeout config
sudo sed -i s/timeout\ 300/timeout\ 10/g /etc/dhcp/dhclient.conf

# Fix sound issue @ /etc/pulse/default.pa
sudo sed -i "s/load-module module-suspend-on-idle/#load-module module-suspend-on-idle/g" /etc/pulse/default.pa

# Update & Upgrade
sudo apt -y update dist-upgrade

# NVIDIA drivers
nvidia=nvidia-detector
nvidia2=$(nvidia-detector)

if $nvidia
then
        sudo apt -y install $nvidia2
else
        echo 'nvidia-detector: failed.'
        
fi

# Python Installation
sudo apt -y install python2 python3 python3-dev python3-pip

# Virtual Environments Installations
sudo apt -y install virtualbox qemu qemu-system-arm qemu-system-mips docker

# Pwn Environment Installations
sudo apt -y install gdb gdbserver gcc-multilib ltrace strace valgrind radare2 afl++ openjdk-11-jdk gem
sudo gem install one_gadget
sudo gem install pedump
wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
echo source ~/.gdbinit-gef.py >> ~/.gdbinit

# Pwntools
sudo wget 'https://bootstrap.pypa.io/pip/2.7/get-pip.py' && sudo python2 get-pip.py
sudo apt-get -y install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install --upgrade pwntools
sudo apt-get -y install python python-dev git libssl-dev libffi-dev build-essential
sudo python2 -m pip install --upgrade pwntools

# Pentest
pip3 install -U pacu
sudo apt-y  install metasploit-framework nikto


# AV & Security Installations
sudo apt -y install clamav openvas

# LAMP
sudo apt -y install apache2 libapache2-mod-php mysql-server php7.4-common

# IDE
sudo apt -y install vim vim-youcompleteme sublime-text

# Misc Installations
sudo apt -y install hddtemp hwinfo vlc evince eog tmux

# Forensic
sudo apt -y install scalpel foremost testdisk autopsy smartmontools

# Networking
sudo apt -y install nmap masscan wireshark tcpdump iptables snort ufw screen hping3 ifenslave
sudo git clone 'https://github.com/rbsec/dnscan.git' /opt/dnscan
sudo git clone 'https://github.com/lanmaster53/recon-ng.git' /opt

# Discord
sudo apt -y install libgconf-2-4 libappindicator1 libc++1

# Wifi & RF Software
sudo apt -y install gnuradio gqrx-sdr aircrack-ng

# Android software
sudo apt -y install jmtpfs adb

# Cracking
sudo apt -y install hydra

# Web
sudo apt -y install dirb postgresql

# Removals
sudo apt -y remove mintupdate
sudo apt -y remove mintinstall

echo
echo
echo 'Pwnbox Environment Finished.'
exit

