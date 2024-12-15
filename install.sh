#!/bin/bash

function error {
    echo "❌ $1" >&2
    exit 1
}

echo "🚀 Installing Fastvim..."

if ! command -v git &> /dev/null; then
    error "Git is not installed. Please install Git and try again."
fi

echo "📁 Checking directories..."
mkdir -p ~/.config || error "Error creating the ~/.config directory."

if [ -d ~/.config/nvim ]; then
    echo "🗑️ Removing old Neovim installation..."
    rm -rf ~/.config/nvim || error "Error removing the ~/.config/nvim directory."
fi

echo "⬇️ Downloading Fastvim..."
git clone https://github.com/BrunoCiccarino/fastvim ~/.config/nvim || error "Error cloning the repository."

echo "✅ Fastvim installed successfully!"
echo "➡️ Open Neovim to complete the setup."
