#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.

#echo 'Installing ProtonVPN'
#dnf install -y https://repo.protonvpn.com/fedora-44-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.4-1.noarch.rpm
# The install errors out unless we do it like this.
#dnf install -y proton-vpn-gnome-desktop --setopt=install_weak_deps=False || true

#fix ffmpeg
echo 'Enabling Terra'
dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release terra-gpg-keys terra-release-mesa
dnf -y distro-sync
