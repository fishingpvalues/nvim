#!/bin/bash
# Run healthchecks for specific modules
echo "=== VIM LSP Health ==="
timeout 30 nvim --headless -c 'checkhealth vim.lsp' -c 'quit!' 2>&1 | grep -v "^Running" | head -50

echo ""
echo "=== Provider Health ==="
timeout 30 nvim --headless -c 'checkhealth provider' -c 'quit!' 2>&1 | grep -v "^Running" | head -50

echo ""
echo "=== Lazy Health ==="
timeout 30 nvim --headless -c 'checkhealth lazy' -c 'quit!' 2>&1 | grep -v "^Running" | head -50
