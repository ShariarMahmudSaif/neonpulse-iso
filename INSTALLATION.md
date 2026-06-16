# NeonPulse OS - Installation Guide

> **For complete step-by-step setup instructions, see [SETUP_GUIDE.md](SETUP_GUIDE.md)**

This document covers advanced installation options.

---

## Quick Links

- **New to NeonPulse?** → [SETUP_GUIDE.md](SETUP_GUIDE.md) (Start here!)
- **Just want to download?** → https://github.com/shariarmahmudsaif/neonpulse-os/releases
- **Want to build from source?** → [SETUP_GUIDE.md - Option B](SETUP_GUIDE.md#option-b-build-iso-from-source)

---

## Installation Methods

### Method 1: Automatic Installation (archinstall) ⭐ Recommended

The easiest method - fully automated:

```bash
# Boot from NeonPulse ISO
# Select "Install" from menu
# Follow on-screen prompts (wizard)
# Done in ~10 minutes
```

See [SETUP_GUIDE.md](SETUP_GUIDE.md#method-1-easiest---archinstall-automatic) for full details.

---

### Method 2: Manual Installation (Advanced)

Full control over partitioning and installation:

```bash
# Boot from ISO, open terminal
# Manually partition disk
# Run pacstrap to install base system
# Configure bootloader manually
# ~30 minutes of work
```

See [SETUP_GUIDE.md](SETUP_GUIDE.md#method-2-manual---full-control-advanced) for step-by-step instructions.

---

### Method 3: Virtual Machine (Testing)

Test NeonPulse before installing on real hardware:

```bash
# QEMU/KVM, VirtualBox, or Hyper-V
# ~15 minutes to test
# Safe way to try it first
```

See [SETUP_GUIDE.md](SETUP_GUIDE.md#method-3-test-in-virtual-machine-first) for setup.

---

## Post-Installation

### Automatic Setup

NeonPulse runs automatic first-boot setup:

```
✓ GPU driver detection & installation
✓ AUR package installation (Proton-GE, MangoHud, etc.)
✓ Service enablement
✓ Daemon initialization
✓ Configuration file creation
```

This happens automatically on first login.

### Manual Setup (if needed)

```bash
# Re-run first-boot setup
neonpulse-first-boot

# View setup logs
tail -50 ~/.local/share/neonpulse/first-boot.log

# Check daemon status
neonpulse-resource-guard status
neonpulse-security-daemon status
```

---

## Customization

### Edit Hyprland Configuration

```bash
nano ~/.config/hypr/hyprland.conf

# Key sections to edit:
# - $mod = Super key
# - monitor = Display settings
# - bind = Keyboard shortcuts
# - workspace = Virtual desktops

# Reload without restart: Super+Alt+R
```

### Edit Waybar (Top Panel)

```bash
# Configuration
nano ~/.config/waybar/config

# Styling (CSS)
nano ~/.config/waybar/style.css

# Restart: killall waybar && waybar &
```

### Set Wallpaper

```bash
# Copy image to backgrounds folder
cp ~/Pictures/wallpaper.jpg ~/.local/share/backgrounds/

# Add to ~/.config/hypr/hyprland.conf:
# exec-once = hyprpaper
```

### Install Additional Packages

```bash
# From official repositories
sudo pacman -S package-name

# From AUR (community-maintained)
yay -S package-name

# Update everything
sudo pacman -Syu
yay -Syu
```

---

## Verification

### System Information

```bash
neofetch                    # Beautiful system info
inxi -Fxxx                  # Detailed hardware info
uname -a                    # Kernel details
lsb_release -a              # Distro info
```

### Desktop Environment Status

```bash
# Check Hyprland
ps aux | grep -i hyprland

# Check Waybar
ps aux | grep -i waybar

# Check audio (PipeWire)
pactl info

# Check network
nmcli device show
```

### GPU & Graphics

```bash
# Display information
lspci | grep -i "vga\|3d"

# NVIDIA verification
nvidia-smi

# AMD verification
radeontop

# OpenGL check
glxinfo | grep "OpenGL renderer"
```

### Resource Guard & Security

```bash
# Resource Guard status
neonpulse-resource-guard status
neonpulse-resource-guard logs

# Security Daemon status
neonpulse-security-daemon status
neonpulse-security-daemon logs

# Manual security scan
neonpulse-security-daemon scan /home
```

---

## Troubleshooting

### Common Issues

#### Hyprland won't start

```bash
# Enable debug output
export HYPRLAND_LOG_WLR=1
Hyprland -c ~/.config/hypr/hyprland.conf 2>&1 | head -50

# Try without RT scheduling
export HYPRLAND_NO_RT_SCHED=1
Hyprland
```

#### No WiFi Connection

```bash
# Restart network manager
sudo systemctl restart NetworkManager

# List available networks
nmcli device wifi list

# Connect to network
nmcli device wifi connect "SSID" password "PASSWORD"

# Or use interactive menu
nmtui
```

#### No Sound

```bash
# Check audio devices
pactl list short sinks
pactl list short sources

# Restart audio service
systemctl --user restart pipewire
systemctl --user restart wireplumber

# Open volume mixer
pavucontrol-qt
```

#### GPU Drivers Not Loading

```bash
# For NVIDIA
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils
sudo mkinitcpio -P
sudo reboot

# For AMD
sudo pacman -S mesa lib32-mesa vulkan-radeon
sudo mkinitcpio -P
sudo reboot

# For Intel iGPU
sudo pacman -S mesa lib32-mesa vulkan-intel
sudo reboot
```

#### Games Not Running or Low FPS

```bash
# Enable gamemode
gamemoded

# Run game with gamemode
gamemoderun steam

# Check system temperature
watch -n 1 'sensors | grep -i core'

# Show FPS overlay in game
MANGOHUD=1 steam
```

#### ClamAV/Security Issues

```bash
# Update threat database
sudo freshclam

# Scan home directory
clamscan -r ~/

# Check ClamAV daemon status
systemctl status clamav-daemon
```

### Getting More Help

- **GitHub Issues**: https://github.com/shariarmahmudsaif/neonpulse-os/issues
- **GitHub Discussions**: https://github.com/shariarmahmudsaif/neonpulse-os/discussions
- **r/NeonPulseOS** (coming soon)

---

## Building & Releasing

### Build New Version

```bash
# 1. Update version number
nano archiso/profiledef.sh

# 2. Build ISO
bash build.sh build

# 3. Output located in ./out/
ls -lh out/

# 4. Create GitHub release
cd out/
gh release create v1.1.0 \
    neonpulse-1.1.0-x86_64.iso \
    neonpulse-1.1.0-SHA256SUMS \
    --title "NeonPulse OS v1.1.0" \
    --notes "Release notes here"
```

---

## Next Steps

✅ System installed and configured?

1. **Customize your desktop** - Edit configs to your taste
2. **Install favorite apps** - `yay -S app-name`
3. **Share screenshots** - Join r/unixporn, r/linux_gaming
4. **Report issues** - Help improve NeonPulse OS
5. **Contribute** - Submit themes, fixes, or features

---

## Documentation Files

- **README.md** - Feature overview and highlights
- **SETUP_GUIDE.md** - Complete setup & build instructions (start here!)
- **INSTALLATION.md** - This file (advanced options)
- **LICENSE** - GPL v3

---

**Version:** 1.0.0  
**Last Updated:** 2026-06-16  
**License:** GPL v3

👉 **For the complete beginner-friendly guide, see [SETUP_GUIDE.md](SETUP_GUIDE.md)**
