#!/bin/bash
# NeonPulse OS - Setup script for Archiso
# Runs inside the archiso environment during build

set -e

msg() {
    echo "[neonpulse] $@"
}

msg "Applying NeonPulse OS configurations..."

# Set hostname
echo "neonpulse" > /etc/hostname

# Locale
sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen

# Enable multilib
sed -i "/^\[multilib\]/,/^$/s/^#//" /etc/pacman.conf

# Enable AUR (yay)
msg "Building yay from AUR..."
git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
cd /tmp/yay-bin
makepkg -si --noconfirm 2>/dev/null || true

# Initialize system
pacman-key --init
pacman-key --populate archlinux

# Make first-boot executable
chmod +x /usr/local/bin/neonpulse-first-boot
chmod +x /usr/local/bin/neonpulse-resource-guard
chmod +x /usr/local/bin/neonpulse-security-daemon

msg "NeonPulse OS configuration complete"
