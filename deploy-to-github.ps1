# SpineRip Trader - Automated GitHub Deployment Script
# This script will guide you through deploying to GitHub Pages

Write-Host ""
Write-Host "=============================================================================" -ForegroundColor Cyan
Write-Host "🚀 SPINERIP TRADER - GITHUB DEPLOYMENT TOOL" -ForegroundColor Green
Write-Host "=============================================================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Get GitHub username
Write-Host "📋 STEP 1: GitHub Account Setup" -ForegroundColor Yellow
Write-Host "-------------------------------------------" -ForegroundColor Gray
Write-Host ""

$username = Read-Host "Enter your GitHub username"

if ([string]::IsNullOrWhiteSpace($username)) {
    Write-Host "❌ Error: Username cannot be empty!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "✅ Username: $username" -ForegroundColor Green
Write-Host ""

# Step 2: Check if repo exists
Write-Host "📋 STEP 2: Create GitHub Repository" -ForegroundColor Yellow
Write-Host "-------------------------------------------" -ForegroundColor Gray
Write-Host ""
Write-Host "Please create a new repository on GitHub:" -ForegroundColor White
Write-Host ""
Write-Host "1. Go to: https://github.com/new" -ForegroundColor Cyan
Write-Host ""
Write-Host "2. Fill in:" -ForegroundColor White
Write-Host "   Repository name: spinerip-trader" -ForegroundColor Gray
Write-Host "   Description: AI-Powered Day Trading Platform" -ForegroundColor Gray
Write-Host "   Visibility: Public" -ForegroundColor Gray
Write-Host ""
Write-Host "3. ❌ DO NOT initialize with README, .gitignore, or license" -ForegroundColor Red
Write-Host ""
Write-Host "4. Click 'Create repository'" -ForegroundColor White
Write-Host ""

$created = Read-Host "Have you created the repository? (y/n)"

if ($created -ne "y") {
    Write-Host ""
    Write-Host "Please create the repository first, then run this script again." -ForegroundColor Yellow
    Write-Host ""
    exit 0
}

Write-Host ""
Write-Host "✅ Repository created!" -ForegroundColor Green
Write-Host ""

# Step 3: Set up remote
Write-Host "📋 STEP 3: Connect to GitHub" -ForegroundColor Yellow
Write-Host "-------------------------------------------" -ForegroundColor Gray
Write-Host ""

$repoUrl = "https://github.com/$username/spinerip-trader.git"

Write-Host "Adding remote: $repoUrl" -ForegroundColor Cyan
Write-Host ""

# Check if remote already exists
$remoteExists = git remote get-url origin 2>$null
if ($remoteExists) {
    Write-Host "⚠️  Remote 'origin' already exists. Removing..." -ForegroundColor Yellow
    git remote remove origin
}

git remote add origin $repoUrl

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Error: Failed to add remote!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Remote added successfully!" -ForegroundColor Green
Write-Host ""

# Step 4: Rename branch to main
Write-Host "📋 STEP 4: Prepare Branch" -ForegroundColor Yellow
Write-Host "-------------------------------------------" -ForegroundColor Gray
Write-Host ""

git branch -M main

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Error: Failed to rename branch!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Branch renamed to 'main'" -ForegroundColor Green
Write-Host ""

# Step 5: Push to GitHub
Write-Host "📋 STEP 5: Push to GitHub" -ForegroundColor Yellow
Write-Host "-------------------------------------------" -ForegroundColor Gray
Write-Host ""
Write-Host "⚠️  You may be prompted for your GitHub credentials" -ForegroundColor Yellow
Write-Host ""

$push = Read-Host "Ready to push? This will upload your code to GitHub (y/n)"

if ($push -ne "y") {
    Write-Host ""
    Write-Host "Push cancelled. Run this script again when ready." -ForegroundColor Yellow
    Write-Host ""
    exit 0
}

Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "❌ Error: Push failed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Possible issues:" -ForegroundColor Yellow
    Write-Host "  • Authentication failed (check GitHub credentials)" -ForegroundColor Gray
    Write-Host "  • Repository doesn't exist" -ForegroundColor Gray
    Write-Host "  • Network connection issue" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Try:" -ForegroundColor White
    Write-Host "  1. Check your GitHub username: $username" -ForegroundColor Gray
    Write-Host "  2. Make sure the repo exists: https://github.com/$username/spinerip-trader" -ForegroundColor Gray
    Write-Host "  3. Run: git push -u origin main (manually)" -ForegroundColor Gray
    Write-Host ""
    exit 1
}

Write-Host ""
Write-Host "✅ Code pushed successfully!" -ForegroundColor Green
Write-Host ""

# Step 6: Enable GitHub Pages
Write-Host "=============================================================================" -ForegroundColor Cyan
Write-Host "🎉 SUCCESS! Code is on GitHub!" -ForegroundColor Green
Write-Host "=============================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 FINAL STEP: Enable GitHub Pages" -ForegroundColor Yellow
Write-Host "-------------------------------------------" -ForegroundColor Gray
Write-Host ""
Write-Host "1. Go to: https://github.com/$username/spinerip-trader/settings/pages" -ForegroundColor Cyan
Write-Host ""
Write-Host "2. Under 'Source':" -ForegroundColor White
Write-Host "   • Branch: main" -ForegroundColor Gray
Write-Host "   • Folder: / (root)" -ForegroundColor Gray
Write-Host "   • Click 'Save'" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Wait 2-3 minutes for deployment" -ForegroundColor White
Write-Host ""
Write-Host "4. Your website will be live at:" -ForegroundColor White
Write-Host "   https://$username.github.io/spinerip-trader" -ForegroundColor Green
Write-Host ""

# Open browser
$openBrowser = Read-Host "Open GitHub Pages settings in browser? (y/n)"

if ($openBrowser -eq "y") {
    Start-Process "https://github.com/$username/spinerip-trader/settings/pages"
}

Write-Host ""
Write-Host "=============================================================================" -ForegroundColor Cyan
Write-Host "✅ DEPLOYMENT COMPLETE!" -ForegroundColor Green
Write-Host "=============================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Enable GitHub Pages (link opened in browser)" -ForegroundColor White
Write-Host "  2. Wait 2-3 minutes" -ForegroundColor White
Write-Host "  3. Visit: https://$username.github.io/spinerip-trader" -ForegroundColor Cyan
Write-Host "  4. Share your URL and start selling! 💰" -ForegroundColor White
Write-Host ""
Write-Host "Support:" -ForegroundColor Yellow
Write-Host "  Email: justinhawpetoss7@gmail.com" -ForegroundColor Gray
Write-Host "  Payment: Cash App `$JustinHawpetoss7" -ForegroundColor Gray
Write-Host ""
Write-Host "=============================================================================" -ForegroundColor Cyan
Write-Host ""
