# 🌀 NeonPulse OS - Creator-First Linux Distro

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![GitHub Release](https://img.shields.io/github/release/shariarmahmudsaif/neonpulse-os.svg)](https://github.com/shariarmahmudsaif/neonpulse-os/releases)
[![GitHub Issues](https://img.shields.io/github/issues/shariarmahmudsaif/neonpulse-os.svg)](https://github.com/shariarmahmudsaif/neonpulse-os/issues)

**NeonPulse OS** is a custom Arch Linux distribution optimized for creators, gamers, and multimedia enthusiasts. Featuring a stunning glassmorphic cyberpunk aesthetic with vibrant neon colors, smart resource management, and pre-installed professional tools.

> **Status**: Beta v1.0.0 | **Base**: Arch Linux | **Desktop**: Hyprland (Wayland)

---

## 🚀 GET STARTED (Pick One)

| Option | Time | Difficulty |
|--------|------|-----------|
| **[📥 Download ISO](https://github.com/shariarmahmudsaif/neonpulse-os/releases)** | 5 min | ⭐ Easiest |
| **[🔨 Build from Source](BUILD_GUIDE.md)** | 35 min | ⭐⭐ Easy |
| **[📖 Full Setup Guide](SETUP_GUIDE.md)** | Detailed | Complete |

👉 **New to NeonPulse?** → Start with [BUILD_GUIDE.md](BUILD_GUIDE.md) (step-by-step instructions)

---

## 🎨 Key Features

### 🌈 Aesthetic
- **Glassmorphic UI** - Frosted glass panels with heavy blur effects
- **Neon Cyberpunk Theme** - Vibrant magenta, cyan, purple, and hot pink on deep dark backgrounds
- **Hyprland Desktop** - Wayland compositor optimized for glass effects and smooth animations
- **Waybar Top Panel** - Customizable frosted glass top bar with neon glows and system monitoring

### 🚀 Performance & Optimization
- **Smart Resource Guard** - Per-app resource limiting using cgroups v2
  - Focused window gets full resources
  - Unfocused apps get limited CPU/Memory
  - Creative apps (Blender, Kdenlive) get aggressive limits when minimized
  - Media players never limited
- **EarlyOOM + zram** - Intelligent memory management and compression
- **Linux-zen Kernel** - Optimized for desktop responsiveness

### 🎮 Gaming Excellence
- **Steam + Proton-GE** - Play 10,000+ Windows games on Linux
- **Lutris & Heroic** - Alternative game launchers with full support
- **Gamemode Integration** - Automatic CPU/GPU optimization during gaming
- **MangoHud** - In-game performance overlay
- **Full GPU Support**
  - NVIDIA (Proprietary + CUDA + 32-bit gaming)
  - AMD (Open-source drivers - discrete & APU/iGPU)
  - Intel iGPU
  - AMD iGPU/APU (Ryzen 5000G/7000G series)

### 🎬 Creator Tools (Pre-installed)
- **Video** - Kdenlive, Shotcut, OBS Studio, FFmpeg
- **Audio** - Audacity, Audacious, Lollypop
- **Graphics** - Blender, Krita, GIMP
- **Brave Browser** - Privacy-focused with Web3 support
- **All major applications** - VLC, Steam, Lutris, and more

### 🔒 Security (Non-Intrusive)
- **ClamAV** - Real-time malware scanning
- **AppArmor** - Mandatory access control
- **Firejail** - Application sandboxing
- **Smart Protection** - Never interrupts gaming/video playback
- **Network Monitoring** - Breach detection and threat alerts
- **Flatpak Support** - Containerized application security

---

## 📥 Installation

### Quick Start (Boot from ISO)

1. **Download Latest ISO**
   ```bash
   # Visit: https://github.com/shariarmahmudsaif/neonpulse-os/releases
   # Download: neonpulse-1.0.0-x86_64.iso
   ```

2. **Create Bootable USB**
   ```bash
   # Linux/Mac
   sudo dd if=neonpulse-1.0.0-x86_64.iso of=/dev/sdX bs=4M && sync
   
   # Windows
   # Use Balena Etcher or Rufus
   ```

3. **Boot & Install**
   - Boot from USB (hold F2, F12, or Del during startup)
   - Choose "Start Hyprland (Desktop)"
   - Run `archinstall` for guided installation
   - Or use manual `fdisk` + `pacstrap`

### System Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| CPU | 2 cores | 6+ cores (Intel/AMD) |
| RAM | 4 GB | 16 GB |
| Storage | 30 GB SSD | 100 GB+ NVMe |
| GPU | Any (Intel iGPU, AMD APU) | NVIDIA/AMD discrete |
| Bootloader | UEFI | UEFI (Secure Boot optional) |

---

## 🎯 First Boot Setup

When you log in for the first time, NeonPulse OS automatically runs setup:

```bash
# This runs automatically but can be re-run:
neonpulse-first-boot
```

Setup includes:
- ✓ GPU driver detection & configuration
- ✓ System service enablement
- ✓ Daemon initialization (Resource Guard, Security)
- ✓ Terminal customization
- ✓ Gaming optimization
- ✓ AUR package installation (Proton-GE, MangoHud, Heroic)

---

## ⌨️ Essential Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Super + Return` | Open Terminal (Kitty) |
| `Super + B` | Open Brave Browser |
| `Super + E` | File Manager (Thunar) |
| `Super + Space` | Application Menu |
| `Super + Q` | Close Window |
| `Super + F` | Toggle Fullscreen |
| `Super + V` | Toggle Floating |
| `Super + {1-10}` | Switch Workspace |
| `Super + Shift + {1-10}` | Move Window to Workspace |
| `Super + Arrow Keys` | Focus/Move Windows |
| `Super + Shift + L` | Lock Screen |
| `Print` | Screenshot (Flameshot) |
| `Super + R` | Show Resource Guard Status |

---

## 🎮 Gaming Guide

### Graphics APIs Supported
NeonPulse OS includes **complete graphics API support**:

- ✅ **DirectX 12** (vkd3d-proton) - Latest AAA games
- ✅ **DirectX 11** (DXVK) - Most Windows games  
- ✅ **Vulkan** (Native) - Modern Linux games
- ✅ **OpenGL** (Native) - Legacy games
- ✅ **NVIDIA OptiX** (Ray Tracing) - RTX games
- ✅ **AMD RDNA Ray Tracing** - RDNA GPU acceleration

**See [GAMING_GRAPHICS_GUIDE.md](GAMING_GRAPHICS_GUIDE.md) for complete graphics API details, ray tracing setup, and game compatibility list.**

### Quick Gaming Setup

1. **Steam**
   ```bash
   # Steam will auto-launch and install Proton-GE
   steam
   ```

2. **Lutris** (More games, GOG, Epic, etc.)
   ```bash
   lutris
   ```

3. **Heroic Games Launcher** (GOG, Epic, Amazon)
   ```bash
   heroic
   ```

### Enable MangoHud (In-Game Stats)
- Automatically installed
- Toggle in-game: `Ctrl+Shift+M`
- Configure: `~/.config/mangohud/MangoHud.conf`

### Supported Games Examples
- ✅ **Elden Ring** (DirectX 12 + Ray Tracing)
- ✅ **Cyberpunk 2077** (DirectX 12 + Ray Tracing + DLSS)
- ✅ **Starfield** (DirectX 12 + Ray Tracing)
- ✅ **The Witcher 3** (DirectX 11 optimized)
- ✅ **Fortnite** (DirectX 12 + DirectX Raytracing)
- ✅ **Counter-Strike 2** (Vulkan native)
- ✅ **Apex Legends** (Vulkan native)
- ❌ **Valorant** (Requires Windows kernel anti-cheat - impossible on Linux)

### Performance Tips
- **Close background apps** - Waybar shows CPU/Memory usage
- **Run `gamemode gamemoded`** - Boost CPU/GPU during gaming
- **Check thermal**: `sensors` - If >85°C, improve cooling
- **NVIDIA Users with RTX**: Ray tracing automatically works in supported games
- **AMD Users with RDNA**: Enable ray tracing in game graphics settings

---

## 🛠️ Resource Guard - Smart Resource Limiting

Monitor resource usage and view active limits:

```bash
# Show current status
neonpulse-resource-guard status

# View logs
neonpulse-resource-guard logs

# Start daemon (runs on boot automatically)
neonpulse-resource-guard daemon

# Stop daemon
neonpulse-resource-guard stop
```

**How it works:**
- Focused window: 100% CPU, 100% RAM
- Unfocused normal apps: 50% CPU, 60% RAM
- Minimized creative apps: 20% CPU, 30% RAM
- Media players: Always full resources
- Gaming apps: Always full resources

---

## 🔒 Security Daemon - Non-Intrusive Protection

```bash
# Check security status
neonpulse-security-daemon status

# Scan home directory for threats
neonpulse-security-daemon scan /home

# View security logs
neonpulse-security-daemon logs

# Manual threat database update
neonpulse-security-daemon check-breach
```

**Context-Aware Features:**
- ✓ Never interrupts fullscreen gaming
- ✓ Pauses checks during video playback
- ✓ Downloads auto-scanned with ClamAV
- ✓ Breach database monitoring
- ✓ DNS hijack detection

---

## 🎨 Customization

### Hyprland Configuration
Edit `~/.config/hypr/hyprland.conf` to customize:
- Window behavior & animations
- Keyboard bindings
- Monitor/workspace configuration
- App-specific rules (borders, opacity, etc.)

### Waybar Top Bar
Edit `~/.config/waybar/config` and `~/.config/waybar/style.css`:
- Module positions and order
- Neon colors & glow effects
- Font & sizing
- Update intervals

### Terminal (Kitty)
Edit `~/.config/kitty/kitty.conf`:
- Font, colors, transparency
- Window padding & margins
- Wayland-specific options

### Themes & Colors
- **Color scheme**: Neon magenta/cyan/purple
- **GTK theme**: Kvantum with neon colors
- **Qt theme**: qt5ct configured
- **Wallpaper**: `~/.local/share/backgrounds/`

---

## 📚 System Information

### Check System Details
```bash
# Beautiful system info
neofetch

# Detailed hardware info
inxi -Fxxx

# GPU status
nvidia-smi          # NVIDIA
radeontop           # AMD
lspci | grep VGA    # All GPUs

# CPU & Memory monitoring
htop                # Classic
btop                # Modern with graphs

# Thermal info
sensors
watch -n 1 sensors  # Real-time
```

### Installed Packages by Category

**Desktop & Window Manager**
- hyprland, hyprlock, hypridle, hyprpaper

**Panel & Theme**
- waybar, kvantum, qt5ct, gtk-engine-murrine

**Browsers**
- brave-browser (with Web3 & max security)

**Multimedia**
- vlc, mpv, lollypop, audacious, ffmpeg

**Creative Suite**
- blender, kdenlive, shotcut, krita, gimp, audacity, obs-studio

**Gaming**
- steam, proton-ge-custom-bin, lutris, heroic-games-launcher-bin, gamemode, mangohud

**Development**
- git, neovim, code, nodejs, python, jdk-openjdk

**System Tools**
- btop, htop, lm-sensors, fwupd, flatpak, docker

---

## 🐛 Troubleshooting

### Hyprland won't start
```bash
# Check for errors
Hyprland -c ~/.config/hypr/hyprland.conf

# Use Xwayland fallback
export LIBGL_ALWAYS_SOFTWARE=1
Hyprland
```

### Low FPS in games
```bash
# Check thermal throttling
watch -n 1 'sensors | grep Core'

# Enable Gamemode
gamemoded -t 0

# Disable Wayland compositor for game
HYPRLAND_NO_RT_SCHED=1 steam
```

### WiFi not connecting
```bash
# Restart NetworkManager
sudo systemctl restart NetworkManager

# Check status
nmtui  # TUI interface

# Or connect via terminal
nmcli device wifi list
nmcli device wifi connect "SSID" password "PASSWORD"
```

### NVIDIA: Proprietary drivers not working
```bash
# Reinstall NVIDIA drivers
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils

# Regenerate GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Reboot
sudo reboot
```

### ClamAV database update fails
```bash
# Update manually
sudo freshclam

# Check status
clamscan --version
```

---

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for:
- Bug reports
- Feature requests
- Code contributions
- Documentation improvements
- Theme/wallpaper submissions

---

## 📋 Community & Support

- **GitHub Issues**: [Report bugs](https://github.com/shariarmahmudsaif/neonpulse-os/issues)
- **Discussions**: [Ask questions](https://github.com/shariarmahmudsaif/neonpulse-os/discussions)
- **Reddit**: [r/unixporn](https://reddit.com/r/unixporn), [r/linux_gaming](https://reddit.com/r/linux_gaming)
- **Discord**: Join our community [discord-invite-link]

---

## 📜 License

NeonPulse OS is released under the **GNU General Public License v3.0**.
- Free to use, modify, and distribute
- Derivative works must remain open-source
- See [LICENSE](LICENSE) for details

**Attribution**: Built on Arch Linux, Hyprland, and community projects.

---

## 🗺️ Roadmap

### v1.0.0 (Current - Beta)
- ✓ Base system setup
- ✓ Hyprland + Waybar theming
- ✓ Resource Guard
- ✓ Security Daemon
- ✓ Pre-installed apps

### v1.1.0 (Planned)
- Custom ISO installer GUI
- Hardware compatibility list
- Official distrowatch registration
- Dedicated Discord server
- Enhanced theming & wallpaper pack

### v1.2.0+ (Future)
- AppStore/package manager GUI
- Advanced gaming profiles
- System recovery tools
- Official Arch Linux recognition

---

## 📖 Additional Resources

- **Arch Linux Wiki**: https://wiki.archlinux.org
- **Hyprland Docs**: https://wiki.hyprland.org
- **Waybar Config**: https://github.com/Alexays/Waybar
- **Gaming on Linux**: https://lutris.net, https://protondb.com

---

## 👏 Credits & Thanks

- **Arch Linux** - Base distribution
- **Hyprland** - Wayland compositor
- **Waybar** - System bar
- **Community** - Themes, wallpapers, feedback

---

## ✨ Show Your Support

⭐ **Star this repository** on GitHub to show support!

🎨 Share your NeonPulse OS setup:
- Post screenshots on [r/unixporn](https://reddit.com/r/unixporn)
- Tag us: `#NeonPulseOS`
- Share your configs!

🐛 Report bugs and suggest features via Issues.

---

**Made with 💜 for creators, gamers, and Linux enthusiasts.**

*NeonPulse OS - Creator-First • Gaming-Optimized • Cyberpunk Aesthetic* 🔥
