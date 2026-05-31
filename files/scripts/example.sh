#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.

echo 'Installing ProtonVPN'
dnf install -y https://repo.protonvpn.com/fedora-44-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.4-1.noarch.rpm
# The install errors out unless we do it like this.
dnf install -y proton-vpn-gtk-app --setopt=install_weak_deps=False || true

echo 'Enabling RPMFusion'
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo 'Installing extras'
dnf install -y libavcodec-freeworld --no-allow-downgrade
dnf install -y mesa-va-drivers-freeworld.x86_64 --no-allow-downgrade
dnf swap -y mesa-vulkan-drivers mesa-vulkan-drivers-freeworld
