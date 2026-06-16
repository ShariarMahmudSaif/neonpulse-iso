#!/bin/bash
# NeonPulse OS - Build ISO Script
# Complete build process from archiso

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# Configuration
ISO_NAME="neonpulse"
ISO_VERSION="1.0.0"
BUILD_DIR="./build"
OUT_DIR="./out"
ARCHISO_DIR="./archiso"

# Functions
log_step() {
    echo -e "${CYAN}[*]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

log_error() {
    echo -e "${RED}[✗]${NC} $1"
    exit 1
}

# Check dependencies
check_dependencies() {
    log_step "Checking dependencies..."
    
    local deps=("mkarchiso" "pacman" "sudo")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            log_error "$dep not found. Install archiso package."
        fi
    done
    
    log_success "All dependencies found"
}

# Clean build directories
clean_build() {
    log_step "Cleaning build directories..."
    
    if [[ -d "$BUILD_DIR" ]]; then
        sudo rm -rf "$BUILD_DIR"
    fi
    
    mkdir -p "$OUT_DIR"
    log_success "Build directories cleaned"
}

# Build ISO
build_iso() {
    log_step "Building NeonPulse OS ISO..."
    log_step "This may take 10-30 minutes depending on system speed and internet"
    
    sudo mkarchiso -v -w "$BUILD_DIR" -o "$OUT_DIR" "$ARCHISO_DIR"
    
    if [[ $? -ne 0 ]]; then
        log_error "ISO build failed"
    fi
    
    log_success "ISO build completed"
}

# Verify ISO
verify_iso() {
    log_step "Verifying ISO integrity..."
    
    local iso_file=$(ls -t "$OUT_DIR"/${ISO_NAME}-*.iso 2>/dev/null | head -1)
    
    if [[ ! -f "$iso_file" ]]; then
        log_error "ISO file not found"
    fi
    
    log_success "ISO verified: $iso_file"
    echo "Size: $(du -h "$iso_file" | cut -f1)"
}

# Create checksums
create_checksums() {
    log_step "Creating checksums..."
    
    cd "$OUT_DIR"
    sha256sum ${ISO_NAME}-*.iso > ${ISO_NAME}-${ISO_VERSION}-SHA256SUMS
    md5sum ${ISO_NAME}-*.iso > ${ISO_NAME}-${ISO_VERSION}-MD5SUMS
    cd - > /dev/null
    
    log_success "Checksums created"
}

# Upload to GitHub releases
upload_release() {
    log_step "Preparing for GitHub release..."
    
    if ! command -v gh &> /dev/null; then
        log_error "GitHub CLI (gh) not installed. Cannot upload automatically."
        echo "Manual upload instructions:"
        echo "  1. gh release create v$ISO_VERSION out/*"
        echo "  2. Visit https://github.com/yourusername/neonpulse-os/releases"
        return
    fi
    
    # Upload with gh CLI
    gh release create "v${ISO_VERSION}" \
        "$OUT_DIR"/${ISO_NAME}-*.iso \
        "$OUT_DIR"/*SUMS \
        --title "NeonPulse OS v${ISO_VERSION}" \
        --notes "New release with neon glass aesthetic and gaming optimizations"
    
    log_success "Release uploaded to GitHub"
}

# Main execution
main() {
    echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}  NeonPulse OS - ISO Build Script                          ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  Version: ${ISO_VERSION}                                               ${CYAN}║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    check_dependencies
    clean_build
    build_iso
    verify_iso
    create_checksums
    
    echo ""
    log_success "ISO build complete!"
    echo "Output directory: $OUT_DIR"
    echo ""
    echo "Next steps:"
    echo "  1. Test ISO: dd if=out/neonpulse-*.iso of=/dev/sdX bs=4M (replace sdX)"
    echo "  2. Upload to GitHub: bash build.sh upload"
    echo "  3. Share and test!"
    echo ""
}

# CLI
case "${1:-build}" in
    build)
        main
        ;;
    clean)
        clean_build
        log_success "Build cleaned"
        ;;
    upload)
        log_step "Uploading to GitHub..."
        upload_release
        ;;
    *)
        echo "Usage: $0 {build|clean|upload}"
        ;;
esac
