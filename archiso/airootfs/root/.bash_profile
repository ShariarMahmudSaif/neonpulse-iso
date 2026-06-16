#!/bin/bash
# NeonPulse OS - Automatic first-boot on Live ISO
# Runs when root logs in or on first boot

# Add this to /root/.bash_profile or create a systemd service that calls this

if [[ $- == *i* ]]; then
    # Interactive shell
    
    # Show NeonPulse welcome
    cat << 'EOF'
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║         🌀  NEONPULSE OS - LIVE ISO  🌀                     ║
║                                                              ║
║      Creator-First • Gaming-Optimized • Cyberpunk Aesthetic ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝

Welcome to NeonPulse OS Live Environment!

Available options:
  1. Start Hyprland (Desktop Environment)
  2. Run installation (Install to disk)
  3. Open terminal
  4. System info
  5. Exit

Type the number to proceed:
EOF
    
    read -p "> " choice
    
    case "$choice" in
        1)
            echo "Starting Hyprland..."
            startx /usr/bin/Hyprland
            ;;
        2)
            echo "Starting NeonPulse Installer..."
            # Launch installation script
            archinstall
            ;;
        3)
            echo "Opening terminal..."
            exec bash
            ;;
        4)
            echo "System Information:"
            neofetch
            exec bash
            ;;
        5)
            exit 0
            ;;
        *)
            echo "Invalid choice"
            exec bash
            ;;
    esac
fi
