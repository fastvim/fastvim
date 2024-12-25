function Show-Progress {
    param (
        [int]$PercentComplete
    )
    Write-Progress -Activity "Installation in progress..." -PercentComplete $PercentComplete
}

function Error {
    param (
        [string]$Message
    )
    Write-Host "❌ $Message" -ForegroundColor Red
    exit 1
}

Write-Host "🚀 Installing Fastvim..."

# Check for Git installation
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Error "Git is not installed. Please install Git and try again."
}

# Define Neovim configuration path
$NvimConfigPath = "$env:LOCALAPPDATA\nvim"

Write-Host "📁 Checking directories..."
if (Test-Path -Path $NvimConfigPath) {
    Write-Host "🗑️ Removing old Neovim installation..."
    Remove-Item -Recurse -Force $NvimConfigPath -ErrorAction Stop
} else {
    Write-Host "Directory $NvimConfigPath does not exist. Skipping removal."
}

# Clone Fastvim repository
Write-Host "⬇️ Downloading Fastvim..."
git clone https://github.com/BrunoCiccarino/fastvim $NvimConfigPath -ErrorAction Stop

# Install dependencies
$Progress = 0
Show-Progress -PercentComplete $Progress

Write-Host "⬇️ Installing system dependencies..."
Start-Job -ScriptBlock {
    winget install --id Microsoft.VisualStudioCode -e --source winget
    winget install --id Git.Git -e --source winget
} | Wait-Job
$Progress += 25
Show-Progress -PercentComplete $Progress

Write-Host "⬇️ Installing Golang..."
Start-Job -ScriptBlock {
    winget install --id golang.Go -e --source winget
} | Wait-Job
$Progress += 25
Show-Progress -PercentComplete $Progress

Write-Host "⬇️ Installing Node.js and npm..."
Start-Job -ScriptBlock {
    winget install --id OpenJS.Nodejs -e --source winget
} | Wait-Job
$Progress += 25
Show-Progress -PercentComplete $Progress

Write-Host "⬇️ Installing live-server globally..."
npm install -g live-server
$Progress += 25
Show-Progress -PercentComplete $Progress

Write-Host "✅ Fastvim and dependencies installed successfully!" -ForegroundColor Green
Write-Host "➡️ Open Neovim to complete the setup." -ForegroundColor Green

