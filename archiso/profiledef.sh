#!/usr/bin/env bash
# archiso profile configuration for NeonPulse OS
# This file defines the ISO profile settings for mkarchiso

iso_name="neonpulse"
iso_label="NeonPulse"
iso_publisher="NeonPulse Project"
iso_version="1.0.0"
iso_checksum="sha256"
netinstall="no"
gpt_hybrid_mode="no"
efi_boot_loader="grub"
efi_secure_boot="no"

# Boot modes - REQUIRED by archiso
bootmodes=(
    'uefi-x64'
    'uefi-x64.esp'
    'uefi-x64.grub.esp'
    'bios.syslinux.mbr'
    'bios.syslinux.esp'
)

# Pacman configuration file
pacman_conf="pacman.conf"

# Compression used for the filesystem image
compression="zstd"

# Build output directory
output_dir="../out"
