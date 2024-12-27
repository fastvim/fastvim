#!/bin/bash

function error {
    echo "❌ $1" >&2
    exit 1
}

function progress_bar {
    local delay=0.1
    local spinstr='|/-\'
    local i=0
    while kill -0 $1 2>/dev/null; do
        i=$(( (i + 1) % 4 ))
        printf "\r%s" "${spinstr:$i:1}"
        sleep $delay
    done
    printf "\r"
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


echo "⬇️ Installing system dependencies..."
{
    sudo apt-get update && sudo apt-get install -y libgit2-1.7 libgit2-dev
} &
progress_bar $!
[ $? -ne 0 ] && error "Error installing system dependencies."

echo "⬇️ Installing Golang..."
{
    sudo apt-get install -y golang
} &
progress_bar $!
[ $? -ne 0 ] && error "Error installing Go."

echo "⬇️ Installing Node.js and npm..."
{
    sudo apt-get install -y nodejs npm
} &
progress_bar $!
[ $? -ne 0 ] && error "Error installing Node.js and npm."

echo "⬇️ Installing live-server globally..."
{
    sudo npm install -g live-server
} &
progress_bar $!
[ $? -ne 0 ] && error "Error installing live-server."

echo "✅ Fastvim and dependencies installed successfully!"
echo "➡️ Open Neovim to complete the setup."

