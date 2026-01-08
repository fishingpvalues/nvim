#!/usr/bin/env bash

# Neovim Dotfiles CI/CD Helper Script
# This script helps with local testing and validation

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

# Test configuration loading
test_config_loading() {
    log_info "Testing configuration loading..."
    if command_exists nvim; then
        if timeout 10s nvim --headless -c "lua require('init')" -c "qall" 2>/dev/null; then
            log_success "Configuration loads successfully"
            return 0
        else
            log_error "Configuration failed to load"
            return 1
        fi
    else
        log_warning "Neovim not found, skipping config loading test"
        return 0
    fi
}

# Test Lua syntax
test_lua_syntax() {
    log_info "Testing Lua syntax..."
    local failed=0
    while IFS= read -r -d '' file; do
        if ! lua -e "loadfile('$file')()" 2>/dev/null; then
            log_error "Syntax error in $file"
            failed=1
        fi
    done < <(find lua -name "*.lua" -print0)
    if [ $failed -eq 0 ]; then
        log_success "All Lua files have valid syntax"
    fi
    return $failed
}

# Run luacheck if available
run_luacheck() {
    if command_exists luacheck; then
        log_info "Running luacheck..."
        if luacheck lua/ --config .luacheckrc; then
            log_success "Luacheck passed"
            return 0
        else
            log_warning "Luacheck found issues"
            return 1
        fi
    else
        log_warning "luacheck not installed, skipping"
        return 0
    fi
}

# Run tests with busted if available
run_tests() {
    if command_exists busted; then
        log_info "Running tests..."
        if [ -d "spec" ] && [ "$(find spec -name "*_spec.lua" | wc -l)" -gt 0 ]; then
            if busted --verbose; then
                log_success "All tests passed"
                return 0
            else
                log_error "Some tests failed"
                return 1
            fi
        else
            log_warning "No test files found"
            return 0
        fi
    else
        log_warning "busted not installed, skipping tests"
        return 0
    fi
}

# Validate file structure
validate_structure() {
    log_info "Validating file structure..."
    local failed=0

    # Check required files
    local required_files=("init.lua" "lua/plugins/" "lazy-lock.json")
    for file in "${required_files[@]}"; do
        if [ ! -e "$file" ]; then
            log_error "Required file missing: $file"
            failed=1
        fi
    done

    # Check plugin files
    if [ -d "lua/plugins" ]; then
        local plugin_count=$(find lua/plugins -name "*.lua" | wc -l)
        log_info "Found $plugin_count plugin configuration files"
        if [ "$plugin_count" -lt 5 ]; then
            log_warning "Very few plugin files found ($plugin_count)"
        fi
    else
        log_error "lua/plugins directory not found"
        failed=1
    fi

    if [ $failed -eq 0 ]; then
        log_success "File structure is valid"
    fi
    return $failed
}

# Main function
main() {
    local all_passed=true

    log_info "Starting Neovim dotfiles CI/CD validation..."

    validate_structure || all_passed=false
    test_lua_syntax || all_passed=false
    run_luacheck || all_passed=false
    run_tests || all_passed=false
    test_config_loading || all_passed=false

    echo
    if [ "$all_passed" = true ]; then
        log_success "All validation checks passed!"
        exit 0
    else
        log_error "Some validation checks failed!"
        exit 1
    fi
}

# Run main function
main "$@"