#!/usr/bin/env bash

# Neovim Dotfiles Setup Script
# This script helps set up the development environment

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

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Setup Lua environment
setup_lua() {
    log_info "Setting up Lua environment..."

    if ! command_exists luarocks; then
        log_info "Installing luarocks..."
        if command_exists apt-get; then
            sudo apt-get update
            sudo apt-get install -y luarocks
        elif command_exists brew; then
            brew install luarocks
        else
            log_warning "luarocks not available via package manager"
            return 1
        fi
    fi

    # Install required Lua packages
    luarocks install busted
    luarocks install luacheck

    log_success "Lua environment setup complete"
}

# Setup Neovim
setup_neovim() {
    log_info "Checking Neovim installation..."

    if ! command_exists nvim; then
        log_warning "Neovim not found. Please install Neovim first."
        log_info "Visit: https://github.com/neovim/neovim/releases"
        return 1
    fi

    local version=$(nvim --version | head -n1 | cut -d' ' -f2)
    log_info "Neovim version: $version"
}

# Setup git hooks
setup_git_hooks() {
    log_info "Setting up git hooks..."

    mkdir -p .git/hooks

    # Pre-commit hook for running tests
    cat > .git/hooks/pre-commit << 'EOF'
#!/usr/bin/env bash
set -e

echo "Running pre-commit checks..."

# Run our test script
if [ -f "scripts/test.sh" ]; then
    ./scripts/test.sh
else
    echo "Test script not found, skipping checks"
fi
EOF

    chmod +x .git/hooks/pre-commit

    log_success "Git hooks setup complete"
}

# Main setup function
main() {
    log_info "Setting up Neovim dotfiles development environment..."

    setup_neovim
    setup_lua
    setup_git_hooks

    log_success "Development environment setup complete!"
    echo
    log_info "Next steps:"
    echo "  1. Run './scripts/test.sh' to validate your setup"
    echo "  2. Make changes to your config"
    echo "  3. Commit changes (pre-commit hooks will run tests)"
    echo "  4. Push to GitHub (CI will run automatically)"
}

# Run main function
main "$@"