#!/usr/bin/env bash

# Neovim Dotfiles Dependency Update Script
# This script updates plugin dependencies

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Neovim is available
check_neovim() {
    if ! command -v nvim >/dev/null 2>&1; then
        log_error "Neovim not found. Please install Neovim first."
        exit 1
    fi
}

# Update lazy-lock.json
update_lazy_lock() {
    log_info "Updating lazy-lock.json..."

    # Create a temporary directory for testing
    local temp_dir=$(mktemp -d)
    trap "rm -rf $temp_dir" EXIT

    # Copy config to temp directory
    cp -r . "$temp_dir/"
    cd "$temp_dir"

    # Run lazy sync to update lockfile
    if nvim --headless -c "lua require('lazy').sync()" -c "qall" 2>/dev/null; then
        # Copy updated lockfile back
        cp lazy-lock.json "$PROJECT_DIR/"
        log_success "lazy-lock.json updated successfully"
        return 0
    else
        log_error "Failed to update lazy-lock.json"
        return 1
    fi
}

# Check for changes
check_changes() {
    if git diff --quiet lazy-lock.json 2>/dev/null; then
        log_info "No changes to lazy-lock.json"
        return 1
    else
        log_info "lazy-lock.json has been updated"
        return 0
    fi
}

# Main function
main() {
    log_info "Updating Neovim plugin dependencies..."

    check_neovim

    local original_lockfile=$(cat lazy-lock.json 2>/dev/null || echo "")

    if update_lazy_lock; then
        if check_changes; then
            log_success "Dependencies updated successfully!"
            log_info "Please test the configuration and commit the changes."
            echo
            log_info "To commit the changes:"
            echo "  git add lazy-lock.json"
            echo "  git commit -m 'chore: update plugin dependencies'"
            echo "  git push"
        else
            log_info "No dependency updates needed."
        fi
    else
        log_error "Failed to update dependencies"
        exit 1
    fi
}

# Run main function
main "$@"