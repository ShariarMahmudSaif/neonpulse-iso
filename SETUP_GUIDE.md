# 🌆 NeonPulse OS - Post-Installation Setup Guide

Welcome to the neon-drenched grid of **NeonPulse OS**. Follow this manual step-by-step to initialize your cyberpunk environment, scale your graphical pipeline, and learn the core window matrix interactions.

---

## 📡 Step 1: Wire into the Grid (Network Setup)

NeonPulse OS uses a minimal baseline stack. If your internet wasn't provisioned automatically during the core image flashing step, connect to your router manually:

1. Open your terminal window and launch the interactive network module:
   ```bash
   nmtui
   ```
2. Select **Activate a connection**.
3. Highlight your local Wi-Fi SSID network, enter your password, and select **Quit**.
4. Verify your uplink status:
   ```bash
   ping -c 3 google.com
   ```

---

## 🖥️ Step 2: Initialize Your Screen Parameters (Monitor Scaling)

Because NeonPulse runs a highly performant **Wayland-native Hyprland** core compositor, monitor layouts are configured inside your primary state template file.

1. Open your central compositor system script layout:
   ```bash
   nano ~/.config/hypr/hyprland.conf
   ```
2. Locate the monitors layout region near the top:
   ```text
   monitor=,preferred,auto,1
   ```
3. To configure a high-resolution display matrix (like a 2K or 4K laptop screen), update the scale factor at the very end of the string (e.g., change `1` to `1.25` or `1.5` for balanced blurred glass scaling metrics).
4. Save your parameters using `Ctrl + O`, hit `Enter`, and exit using `Ctrl + X`.

---

## 🎹 Step 3: Master the Cyberpunk Window Matrix (Keybindings)

NeonPulse moves away from bloated traditional mouse menus. Memory-efficient workflow navigation uses specific mechanical keyboard hooks.

### 🛡️ Core Infrastructure Binds
*   `Super + Q` ── Launch **Kitty** (Your primary cyberpunk terminal engine)
*   `Super + C` ── Terminate / Kill the active focused window space
*   `Super + M` ── Force exit the current Hyprland Wayland environment session
*   `Super + E` ── Toggle your window splitting alignment layout (Horizontal / Vertical)
*   `Super + Space` ── Launch **Rofi** (Your interactive fuzzy application launcher portal)

### 🔲 Focus Grid Matrix Navigation
Hold your system **`Super`** key (Windows key) and use these key sequences to shift focus instantly across splitting windows without a trackpad:
*   `Super + H` ── Focus Left
*   `Super + L` ── Focus Right
*   `Super + K` ── Focus Up
*   `Super + J` ── Focus Down

---

## ⚡ Step 4: Tune Your Custom Resource Guard (Performance Tuning)

NeonPulse includes custom cgroups v2 profiling and memory compression hooks optimized for smoother operation on tightly resourced laptop hardware.

1. **Verify your zram tracking capacity:**
   ```bash
   zramctl
   ```
   *(This ensures your system is actively compressing background background cache to keep your memory footprint low).*
2. **Review background EarlyOOM safe switches:**
   ```bash
   systemctl status earlyoom
   ```
   *(This utility actively monitors resource spikes during high-load asset building tasks, protecting your active core system layer from memory lockups).*

---

## 🎨 Step 5: Refresh the Graphical Asset Matrix
If you want to cycle your background cyberpunk glass panels or adjust Waybar layouts on the fly, tap `Super + Shift + R` to instantly trigger a hot-reload of your background environmental variables!
