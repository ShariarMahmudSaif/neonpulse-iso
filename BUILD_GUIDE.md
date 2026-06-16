# 🌀 NeonPulse OS - Build Bootable ISO (Simple Steps)

**Read this if:** You want to build NeonPulse OS from start to having a bootable USB  
**Time:** ~35 minutes total  
**Difficulty:** Easy (just follow the steps)

---

## 📋 OVERVIEW

```
START
  ↓
[STEP 1] Get the files
  ↓
[STEP 2] Build ISO (takes 20-30 min)
  ↓
[STEP 3] Create bootable USB
  ↓
✅ DONE - USB ready to boot!
```

---

---

## STEP 1: GET THE FILES (2 minutes)

### On Linux/Mac Terminal:

```bash
# 1. Open terminal

# 2. Go to Downloads
cd ~/Downloads

# 3. Copy-paste this:
git clone https://github.com/shariarmahmudsaif/neonpulse-os.git
cd neonpulse-os

# 4. Verify you have these files
ls

# You should see:
# README.md
# SETUP_GUIDE.md
# INSTALLATION.md
# build.sh
# archiso/
# LICENSE
```

### On Windows:

```bash
# Option A: Use WSL2
# 1. Open PowerShell as Admin
# 2. Copy-paste above commands

# Option B: Use Git for Windows
# 1. Right-click folder → "Git Bash Here"
# 2. Copy-paste above commands
```

---

---

## STEP 2: BUILD ISO (20-30 minutes)

### Prerequisites: Install Build Tools

**On Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install archiso git build-essential
```

**On Fedora:**
```bash
sudo dnf install archiso git @development-tools
```

**On Arch:**
```bash
sudo pacman -S archiso git base-devel
```

**On macOS (if using Linux VM):**
- Use same commands as Linux inside the VM

### Build Command:

```bash
# Still in the neonpulse-os folder, run:
bash build.sh build

# This will print:
# [*] Checking dependencies...
# [✓] All dependencies found
# [*] Cleaning build directories...
# [*] Building NeonPulse OS ISO...
# This may take 10-30 minutes depending on system speed and internet

# Just wait. It will finish.
```

### Watch Progress (Optional):

Open **another terminal** in the same folder and run:

```bash
watch -n 2 'du -sh build/ out/'
```

(Press Ctrl+C to stop watching)

### When Done:

```bash
# Check output
ls -lh out/

# You should see:
# neonpulse-1.0.0-x86_64.iso  (about 750 MB)
# neonpulse-1.0.0-SHA256SUMS
# neonpulse-1.0.0-MD5SUMS
```

**✅ ISO is ready!**

---

---

## STEP 3: CREATE BOOTABLE USB (5 minutes)

**IMPORTANT:** You need:
- USB drive 8GB or bigger
- USB drive will be ERASED - back up files first!
- ISO file from Step 2

### Find Your USB Device

**Linux:**
```bash
lsblk

# Find your USB, example output:
# sda           8:0    1  119.5G  0 disk
# ├─sda1        8:1    1   512M  0 part /boot/efi
# └─sda2        8:2    1   119G  0 part /
# sdX           8:16   1   29.8G  0 disk  ← YOUR USB (probably looks like this)

# Remember the device name: /dev/sdX (could be sdb, sdc, sdd, etc.)
```

**macOS:**
```bash
diskutil list

# Find your USB in the list
# /dev/disk0: internal drive
# /dev/disk1: your USB ← (usually looks like this)

# Remember the name: /dev/diskX
```

**Windows:**
- Open Settings → System → Storage  
- Find your USB in the list
- Remember its letter (D:, E:, F:, etc.)

### Write ISO to USB

**Linux (Command Line):**

```bash
# Navigate to where ISO is
cd ~/Downloads/neonpulse-os/out

# ⚠️ IMPORTANT: Replace X with your device letter!
# Example: if USB is /dev/sdb, use /dev/sdb (NOT /dev/sdb1)

sudo dd if=neonpulse-1.0.0-x86_64.iso of=/dev/sdX bs=4M && sync

# Wait 3-5 minutes
# When done, it will print something like:
# 789+1 records in
# 789+1 records out
# 827850752 bytes (828 MB, 789 MiB) copied

# Eject:
sudo eject /dev/sdX
```

**Linux (GUI - Easier):**

```bash
# Install GNOME Disks if not already installed
sudo apt install gnome-disks      # Ubuntu
sudo pacman -S gnome-disks        # Arch

# Open Disks application (search in apps)
# Steps:
# 1. Find your USB in left panel
# 2. Click ⋮ menu (three dots)
# 3. Click "Restore Disk Image"
# 4. Select neonpulse-1.0.0-x86_64.iso
# 5. Click "Start Restoring"
# 6. Wait 3-5 minutes
```

**macOS:**

```bash
# Navigate to ISO
cd ~/Downloads/neonpulse-iso/out

# Unmount USB (but don't eject)
diskutil unmountDisk /dev/diskX

# Write ISO (replace X)
sudo dd if=neonpulse-1.0.0-x86_64.iso of=/dev/rdiskX bs=4m

# When done, eject
diskutil eject /dev/diskX
```

**Windows (Easy Method - Rufus):**

```
1. Download Rufus: https://rufus.ie/
2. Insert USB drive
3. Open Rufus
4. Device: Select your USB
5. Boot selection: Select neonpulse-1.0.0-x86_64.iso
6. Click START
7. Wait 3-5 minutes
```

### Verify USB is Bootable

**Linux:**
```bash
sudo file /dev/sdX
# Should show: DOS/MBR boot sector
```

**macOS:**
```bash
sudo file /dev/rdiskX
# Should show: DOS/MBR boot sector
```

**✅ USB is ready!**

---

---

## NEXT: INSTALL ON YOUR COMPUTER

### Insert USB and Boot

1. Insert USB into computer
2. Restart computer
3. During startup, press: **F2, F10, F12, or Del** (depends on brand)
4. Select **Boot from USB**
5. You should see NeonPulse OS boot menu

### Choose Installation

**Option 1: Quick Install (Easiest)**
```
Select: "Install"
Follow the wizard (archinstall)
Answer questions:
  - Locale: English (US)
  - Keyboard: us
  - Select disk: Your main drive (⚠️ WILL ERASE IT)
  - Partition method: Auto
  - Bootloader: GRUB
Done in ~10 minutes!
```

**Option 2: Live Desktop (Test First)**
```
Select: "Start Hyprland (Desktop)"
Test the system
No changes to your computer
Remove USB when done
```

---

---

## ✅ CHECKLIST

- [x] Files downloaded (git clone)
- [x] Dependencies installed (archiso, git)
- [x] ISO built (bash build.sh build)
- [x] USB prepared
- [x] ISO written to USB
- [x] Verified USB is bootable

**You're ready to install NeonPulse OS!** 🚀

---

---

## 🚨 TROUBLESHOOTING

### "ISO build failed"
```
Solution: 
1. Make sure archiso is installed: sudo pacman -S archiso
2. Make sure you have 50GB free disk space
3. Try again: bash build.sh build
```

### "Permission denied on /dev/sdX"
```
Solution:
1. Use sudo: sudo dd if=...
2. Check you have right device: lsblk
3. Don't use numbers: /dev/sdX not /dev/sdX1
```

### "USB won't boot"
```
Solution:
1. Try writing again with sudo
2. Use GUI tool (gnome-disks) instead
3. Try different USB port
4. Update USB device firmware (if option available)
```

### "Build takes too long"
```
Normal! It takes 15-30 minutes depending on:
- Internet speed (downloading 150+ packages)
- CPU speed
- Disk speed

Just let it finish.
```

### "Out of space during build"
```
Solution:
1. Need 50GB minimum free disk
2. Clean up other files first
3. Run: bash build.sh clean
4. Try again
```

---

---

## 🎯 QUICK COMMAND COPY-PASTE

### Copy these commands in order:

**Get files:**
```bash
cd ~/Downloads
git clone https://github.com/shariarmahmudsaif/neonpulse-os.git
cd neonpulse-os
```

**Build ISO:**
```bash
bash build.sh build
```

**Create bootable USB (Linux):**
```bash
cd out/
sudo dd if=neonpulse-1.0.0-x86_64.iso of=/dev/sdX bs=4M && sync
sudo eject /dev/sdX
```

(Replace `/dev/sdX` with your USB device name!)

---

## 📞 NEED HELP?

- **GitHub Issues**: https://github.com/shariarmahmudsaif/neonpulse-os/issues
- **Full Guide**: See SETUP_GUIDE.md
- **Advanced Topics**: See INSTALLATION.md

---

**You've got this! Build NeonPulse OS! 🔥**
