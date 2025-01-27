#!/bin/bash

# Exit on any error
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOKS_DIR=~/.git-templates/hooks

echo "Creating global git hooks directory..."
mkdir -p "$HOOKS_DIR"

echo "Installing pre-push hook..."
# Copy from the same directory as this script
cp "$SCRIPT_DIR/pre-push.sh" "$HOOKS_DIR/pre-push"

echo "Setting executable permissions..."
chmod +x "$HOOKS_DIR/pre-push"

echo "Configuring git global template directory..."
git config --global init.templateDir ~/.git-templates

echo "Setup complete!"
echo "Note: For existing repositories, run 'git init' to install the hooks."

# for every new repo it will just work out of the box
# but for existing repos, you need to run 'git init' to copy the hooks to the repo
