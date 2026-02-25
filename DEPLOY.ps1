Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  SpineRip Posts - GitHub Deployment  " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$username = Read-Host "Enter your GitHub username"

Write-Host ""
Write-Host "Opening GitHub to create repository..." -ForegroundColor Yellow
Write-Host ""
Write-Host "Create a new repo named: spinerip-posts" -ForegroundColor Cyan
Write-Host "Make it PUBLIC" -ForegroundColor Cyan
Write-Host "Do NOT initialize with README" -ForegroundColor Red
Write-Host ""

Start-Process "https://github.com/new"
Start-Sleep -Seconds 3

$created = Read-Host "Repository created? (y/n)"

if ($created -eq "y") {
    Write-Host ""
    Write-Host "Setting up remote..." -ForegroundColor Yellow
    
    git remote remove origin 2>$null
    git remote add origin "https://github.com/$username/spinerip-posts.git"
    git branch -M main
    
    Write-Host ""
    Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
    git push -u origin main
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "  SUCCESS!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Now enable GitHub Pages:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. Go to Settings > Pages" -ForegroundColor White
    Write-Host "2. Source: main branch" -ForegroundColor White
    Write-Host "3. Save" -ForegroundColor White
    Write-Host ""
    Write-Host "Your site will be at:" -ForegroundColor Yellow
    Write-Host "https://$username.github.io/spinerip-posts" -ForegroundColor Green
    Write-Host ""
    
    $openSettings = Read-Host "Open GitHub Pages settings? (y/n)"
    if ($openSettings -eq "y") {
        Start-Process "https://github.com/$username/spinerip-posts/settings/pages"
    }
    
    Write-Host ""
    Write-Host "DONE! " -ForegroundColor Green
    Write-Host ""
}
else {
    Write-Host ""
    Write-Host "Please create the repository first!" -ForegroundColor Yellow
}
