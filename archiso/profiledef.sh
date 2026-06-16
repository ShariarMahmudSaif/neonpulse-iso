#!/usr/bin/env bash
# archiso profile configuration for NeonPulse OS
# This file defines the ISO profile settings

# Profile name - used for directory structure
iso_name="neonpulse"

# Profile description
iso_label="NeonPulse"

# Installer mode - use 'offline' for complete bundled installation
iso_publisher="NeonPulse Project"

# ISO version
iso_version="1.0.0"

# ISO checksum type (md5, sha1, sha256, sha512)
checksum_type="sha256"

# Compression method: xz, zstd (zstd is faster, default)
# Using zstd for faster builds
compression="zstd"

# Page size for mksquashfs (default: 4096)
page_size="4096"

# Enable airootfs.erofs: set to true to use EROFS instead of squashfs
# erofs_enabled=false

# Pacman cache directory (relative to profile)
pacman_conf="pacman.conf"

# List of additional mkinitcpio modules to include
# Example: ("dm-crypt" "mdadm")
mkinitcpio_modules=()

# List of packages to exclude from base installation
# Leave empty to include all base packages
# Example: ("nano" "vi")
mkinitcpio_skipped_modules=()

# Build output directory
# This is where the ISO will be created
# Relative to the profile directory
# output_dir="../out"

# Set to true to sign the ISO with a GPG key
# gpg_key=''

# List of modules for mkinitcpio
# These are required for NeonPulse boot process
mkinitcpio_modules=("neonpulse-setup")

# Partition table type
# dos = MBR (BIOS)
# gpt = GPT (UEFI)
# hybrid = Both MBR and GPT
partition_table="gpt"

# Boot mode
# uefi = UEFI only
# bios = BIOS only
# both = Both UEFI and BIOS
boot_mode="both"

# Bootloader (isolinux or grub)
bootloader="grub"
