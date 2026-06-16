# 🌀 NeonPulse OS - Complete Setup Guide
## From Start to Bootable in 30 Minutes

---

## 📋 TABLE OF CONTENTS
1. [Overview](#overview)
2. [Option A: Quick Start (Download ISO)](#option-a-quick-start-download-iso)
3. [Option B: Build ISO from Source](#option-b-build-iso-from-source)
4. [Create Bootable USB](#create-bootable-usb)
5. [Installation Methods](#installation-methods)
6. [First Boot Setup](#first-boot-setup)
7. [Verification & Testing](#verification--testing)
8. [Troubleshooting](#troubleshooting)

---

## OVERVIEW

**NeonPulse OS** is a custom Arch Linux distribution with:
- ✅ Hyprland (Wayland desktop)
- ✅ Gaming optimizations (Steam, Proton-GE, Lutris)
- ✅ Creative tools (Blender, Kdenlive, GIMP)
- ✅ Smart resource limiting (Resource Guard)
- ✅ Security daemon (ClamAV + AppArmor)

**Two ways to get it:**
1. **Download pre-built ISO** (30 seconds) - Easy
2. **Build ISO yourself** (30 minutes) - Full control

---

---

# OPTION A: QUICK START (Download ISO)

## ⏱️ TIME: 5 minutes

### Step 1: Download

```bash
# Visit GitHub releases page
https://github.com/shariarmahmudsaif/neonpulse-os/releases

# Download latest:
# neonpulse-1.0.0-x86_64.iso (~750 MB)
# neonpulse-1.0.0-SHA256SUMS
```

### Step 2: Verify (Optional but recommended)

```bash
# Verify ISO integrity
sha256sum -c neonpulse-1.0.0-SHA256SUMS

# Output should show: OK
```

### Step 3: Create Bootable USB
👉 [Skip to "Create Bootable USB" section](#create-bootable-usb)

---

---

# OPTION B: BUILD ISO FROM SOURCE

## ⏱️ TIME: 30 minutes (plus internet speed)

### Prerequisites

#### On Linux (Ubuntu/Debian/Fedora/Arch)

```bash
# Ubuntu/Debian users
sudo apt-get update
sudo apt-get install -y archiso git build-essential

# Fedora users
sudo dnf install -y archiso git @development-tools

# Arch Linux users (already have everything)
sudo pacman -S archiso git base-devel
```

#### On macOS (if you have Linux VM)
- Use UTM or VMware to run Arch Linux
- Then follow Linux instructions above

#### On Windows
- Use WSL2 with Ubuntu/Debian
- Or use VirtualBox with Arch Linux
- Then follow instructions

### Step 1: Clone Repository

```bash
# Create working directory
mkdir -p ~/projects
cd ~/projects

# Clone NeonPulse OS
git clone https://github.com/shariarmahmudsaif/neonpulse-os.git
cd neonpulse-os

# Verify structure
ls -la
```

**Expected output:**
```
archiso/              ← Build configuration
build.sh              ← Build script
INSTALLATION.md       ← Installation guide
LICENSE               ← GPL v3
README.md             ← Project overview
SETUP_GUIDE.md        ← This file
```

### Step 2: Verify Prerequisites

```bash
# Check if archiso is installed
archiso --version
# Output: archiso v70 (or newer)

# Check git
git --version
# Output: git version 2.x

# Check if user is in sudoers
sudo -v
# Should succeed without password (or ask for password once)
```

### Step 3: Run Build Script

```bash
# Navigate to project directory
cd ~/projects/neonpulse-os

# Run build
bash build.sh build

# This will:
# ✓ Check dependencies
# ✓ Clean old builds
# ✓ Create ISO (takes 15-30 minutes)
# ✓ Verify ISO
# ✓ Create checksums
```

### Step 4: Monitor Build Progress

```bash
# In ANOTHER terminal, watch progress:
cd ~/projects/neonpulse-os

# Watch build directory grow
watch -n 2 'du -sh build/ out/'
# Press Ctrl+C to stop watching

# Or check system resources
htop
```

### Step 5: Build Completes

```bash
# After 15-30 minutes, check output
ls -lh out/

# You should see:
# neonpulse-1.0.0-x86_64.iso  (750 MB)
# neonpulse-1.0.0-SHA256SUMS
# neonpulse-1.0.0-MD5SUMS
```

**Success!** Now go to [Create Bootable USB](#create-bootable-usb)

---

---

# CREATE BOOTABLE USB

## ⏱️ TIME: 5 minutes

### What You Need

- ✅ ISO file (neonpulse-1.0.0-x86_64.iso)
- ✅ USB drive (8GB minimum, 16GB recommended)
- ✅ USB drive will be ERASED - back up any files first!

### Method 1: Linux (Command Line)

```bash
# 1. Insert USB drive and identify it
lsblk
# Look for your device: /dev/sdX or /dev/nvmeXnXpX
# Example: /dev/sdb, /dev/sdc

# 2. IMPORTANT: Make sure you have the RIGHT device!
# The device path should be like /dev/sdX (not /dev/sdX1, /dev/sdX2)
# NOT /dev/sdX1 or /dev/nvme0n1p1 (those are partitions)

# 3. Write ISO to USB
sudo dd if=~/projects/neonpulse-iso/out/neonpulse-1.0.0-x86_64.iso of=/dev/sdX bs=4M && sync

# This will:
# - Write ISO to USB
# - Sync filesystem (important!)
# - Take 2-5 minutes

# 4. When done, eject safely
sudo eject /dev/sdX
```

### Method 2: Linux (GUI Tool - Easier)

```bash
# Install tool (if not installed)
sudo pacman -S gnome-disks    # Arch
sudo apt install gnome-disks  # Ubuntu/Debian

# Open Disks application
gnome-disks

# Steps:
# 1. Select USB drive from left panel
# 2. Click menu (⋮) → Restore Disk Image
# 3. Select neonpulse-1.0.0-x86_64.iso
# 4. Click Start Restoring
# 5. Wait 2-5 minutes
```

### Method 3: macOS

```bash
# 1. Insert USB drive
# 2. Identify device
diskutil list

# 3. Unmount (but don't eject)
diskutil unmountDisk /dev/diskX

# 4. Write ISO
sudo dd if=~/neonpulse-1.0.0-x86_64.iso of=/dev/rdiskX bs=4m && sync

# 5. Eject
diskutil eject /dev/diskX
```

### Method 4: Windows (Using Rufus)

```
1. Download Rufus: https://rufus.ie/
2. Insert USB drive
3. Open Rufus
4. Select Device: Your USB drive
5. Select Boot selection: neonpulse-1.0.0-x86_64.iso
6. Click START
7. Wait 3-5 minutes
```

### ✅ Verify USB is Bootable

```bash
# On Linux, check USB was written correctly
sudo file /dev/sdX
# Should show: DOS/MBR boot sector

# On macOS
sudo file /dev/rdiskX
# Should show: DOS/MBR boot sector
```

---

---

# INSTALLATION METHODS

## Choose ONE method below:

---

## METHOD 1: Easiest - archinstall (Automatic)

### ⏱️ TIME: 10 minutes

```bash
# 1. Boot USB and choose "Install"
# 2. System launches archinstall wizard automatically

# 3. Follow prompts:
#    - Locale: English (US) - UTC
#    - Keyboard: us
#    - Mirror region: Auto or your region
#    - Disk: Select your target drive (⚠️ WILL ERASE IT)
#    - Partition: Use default (bootloader, root, home)
#    - Filesystem: btrfs or ext4
#    - Encryption: Optional
#    - Bootloader: GRUB
#    - Network: dhcp (auto)
#    - Timezone: America/New_York (or yours)
#    - Sudo: Set up sudo user
#    - Desktop Profile: (none - already installed)
#    - Additional packages: Hit Enter (none needed)

# 4. Review settings and confirm
# 5. Wait for installation (~5 minutes)
# 6. Choose "Install bootloader" → Yes
# 7. Reboot
```

**That's it! System is installed.**

---

## METHOD 2: Manual - Full Control (Advanced)

### ⏱️ TIME: 30 minutes

```bash
# 1. Boot ISO and select "Run live"
# 2. You now have root terminal

# PARTITION DISK
lsblk                    # See drives
sudo cfdisk /dev/nvme0n1 # Partition tool

# Create 3 partitions (UEFI):
# - 512MB EFI (type: EFI System)
# - Rest   Root (type: Linux Filesystem)

# Format
sudo mkfs.fat -F32 /dev/nvme0n1p1
sudo mkfs.btrfs /dev/nvme0n1p2

# Mount
sudo mount /dev/nvme0n1p2 /mnt
sudo mkdir -p /mnt/boot/efi
sudo mount /dev/nvme0n1p1 /mnt/boot/efi

# INSTALL BASE SYSTEM
sudo pacstrap /mnt base linux-zen linux-zen-headers linux-firmware \
    base-devel git networkmanager grub efibootmgr amd-ucode intel-ucode

# Generate fstab
sudo genfstab -U /mnt >> /mnt/etc/fstab

# Enter new system
sudo arch-chroot /mnt

# CONFIGURE (inside chroot)
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "neonpulse" > /etc/hostname

# Enable multilib (32-bit gaming)
sed -i "/^\[multilib\]/,/^$/s/^#//" /etc/pacman.conf

# Update
pacman -Syu

# Install packages
pacman -S --needed hyprland waybar kitty brave steam git neovim

# INSTALL BOOTLOADER
grub-install --target=x86_64-efi --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

# CREATE USER
passwd  # Set root password

useradd -m -G wheel -s /bin/bash username
passwd username

visudo  # Uncomment: %wheel ALL=(ALL) ALL

# ENABLE SERVICES
systemctl enable NetworkManager

# EXIT AND REBOOT
exit
sudo umount -R /mnt
sudo reboot
```

---

## METHOD 3: Test in Virtual Machine First

### Before installing on real hardware, test in VM:

```bash
# QEMU/KVM method
qemu-img create -f qcow2 neonpulse-test.qcow2 50G

qemu-system-x86_64 \
    -enable-kvm \
    -m 4096 \
    -cpu host \
    -smp 4 \
    -hda neonpulse-test.qcow2 \
    -cdrom neonpulse-1.0.0-x86_64.iso \
    -boot d \
    -net nic,model=virtio \
    -net user

# VirtualBox method
# 1. New VM → NeonPulse
# 2. RAM: 4096 MB
# 3. Storage: 50 GB (dynamic)
# 4. Optical: neonpulse-1.0.0-x86_64.iso
# 5. Boot → Install → Follow archinstall
```

---

---

# FIRST BOOT SETUP

## ⏱️ TIME: 5 minutes (automatic)

### What Happens Automatically

On first boot, NeonPulse OS runs automatic setup:

```
✓ Detects your GPU (NVIDIA/AMD/Intel)
✓ Installs correct drivers
✓ Creates config directories
✓ Installs AUR packages (Proton-GE, MangoHud, Heroic)
✓ Enables system services
✓ Starts daemons (Resource Guard, Security)
✓ Sets up terminal colors
✓ Configures gaming environment
```

### Check Setup Status

```bash
# View first-boot logs
tail -100 ~/.local/share/neonpulse/first-boot.log

# Manually run if needed
neonpulse-first-boot
```

### Post-Installation Checklist

```bash
# Update system
sudo pacman -Syu
yay -Syu

# Check GPU
nvidia-smi           # NVIDIA
radeontop           # AMD
glxinfo | grep "OpenGL renderer"

# Check services
systemctl --user status pipewire
systemctl status NetworkManager
neonpulse-resource-guard status
neonpulse-security-daemon status
```

---

---

# VERIFICATION & TESTING

## ✅ Desktop Environment

```bash
# Check Hyprland is running
ps aux | grep -i hyprland

# Check Waybar (top panel)
ps aux | grep -i waybar

# Check audio
pactl info

# Check WiFi
nmcli device show
```

## 🎮 Gaming Setup

```bash
# Launch Steam
steam

# Download a free game (Proton-GE handles Windows games)
# Play and check FPS with MangoHud: Ctrl+Shift+M

# Check gamemode
gamemoded
```

## 📊 System Information

```bash
neofetch                    # System info with logo
inxi -Fxxx                  # Full hardware details
lsb_release -a              # Distro info
uname -a                    # Kernel info
```

## 🔒 Security & Resources

```bash
# Check Resource Guard
neonpulse-resource-guard status
neonpulse-resource-guard logs

# Check Security Daemon
neonpulse-security-daemon status
neonpulse-security-daemon logs

# Scan home directory
neonpulse-security-daemon scan /home
```

---

---

# TROUBLESHOOTING

## ❌ Hyprland won't start

```bash
# Check errors
HYPRLAND_LOG_WLR=1 Hyprland 2>&1 | tail -50

# Try with debug flags
HYPRLAND_NO_RT_SCHED=1 Hyprland

# Check if GPU drivers loaded
lspci -k | grep -A 3 VGA
```

## ❌ No WiFi

```bash
# Restart NetworkManager
sudo systemctl restart NetworkManager

# Manual connect
nmcli device wifi list
nmcli device wifi connect "SSID" password "PASSWORD"

# Or use GUI
nmtui
```

## ❌ No Sound

```bash
# Check audio
pactl list short sinks
pactl list short sources

# Restart PipeWire
systemctl --user restart pipewire wireplumber

# Open mixer
pavucontrol-qt
```

## ❌ GPU Drivers Missing

```bash
# NVIDIA
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils
nvidia-smi  # Verify

# AMD
sudo pacman -S mesa lib32-mesa vulkan-radeon
radeontop   # Verify

# Intel
sudo pacman -S mesa lib32-mesa vulkan-intel
glxinfo | grep "OpenGL renderer"
```

## ❌ Games crash or low FPS

```bash
# Enable gamemode
gamemoded

# Run game with gamemode
gamemoderun steam

# Check temperature
watch -n 1 'sensors'

# Enable FPS overlay
MANGOHUD=1 steam
```

## ❌ ISO won't boot

```bash
# Verify USB was written correctly
sudo file /dev/sdX
# Should show: DOS/MBR boot sector

# Re-write if needed
sudo dd if=neonpulse-1.0.0-x86_64.iso of=/dev/sdX bs=4M status=progress && sync
```

---

---

# 🎉 SUCCESS!

You now have NeonPulse OS running!

## Next Steps

1. **Customize Hyprland**
   ```bash
   nano ~/.config/hypr/hyprland.conf
   # Edit keybinds, animations, etc.
   # Reload: Super+Alt+R
   ```

2. **Customize Waybar**
   ```bash
   nano ~/.config/waybar/config
   nano ~/.config/waybar/style.css
   # killall waybar && waybar &
   ```

3. **Set Wallpaper**
   ```bash
   cp wallpaper.jpg ~/.local/share/backgrounds/
   # Edit hyprland.conf to load it
   ```

4. **Install More Apps**
   ```bash
   sudo pacman -S app-name     # Official repos
   yay -S app-name            # AUR (community)
   ```

5. **Share Your Desktop**
   - Join communities: r/unixporn, r/linux_gaming
   - Share screenshots!

---

## 📚 Documentation

- **README.md** - Feature overview
- **INSTALLATION.md** - Detailed installation steps
- **SETUP_GUIDE.md** - This file (quickstart)
- **GitHub Issues** - Report bugs
- **GitHub Discussions** - Ask questions

---

## 🔗 Links

- **GitHub**: https://github.com/shariarmahmudsaif/neonpulse-os
- **Issues**: https://github.com/shariarmahmudsaif/neonpulse-os/issues
- **Discussions**: https://github.com/shariarmahmudsaif/neonpulse-os/discussions

---

**Happy creating! 🔥**

---

**Last Updated:** 2026-06-16  
**Version:** 1.0.0  
**License:** GPL v3
