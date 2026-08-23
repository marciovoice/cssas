# change-footer-color.ps1
# This script replaces the footer orange color (#ff8c00) with your chosen color.

# ---------- USER INPUT ----------
# Change this to your desired hex color code (e.g., #ff5733, #00ff00, #3498db)
$newColor = "#ff5733"

# ---------- VALIDATE COLOR ----------
if ($newColor -notmatch '^#[0-9a-fA-F]{6}$' -and $newColor -notmatch '^#[0-9a-fA-F]{3}$') {
    Write-Host "ERROR: Invalid hex color. Use format like #ff5733 or #f53." -ForegroundColor Red
    exit 1
}

# ---------- FILES TO PROCESS ----------
$files = @(
    "index.html",
    "about.html",
    "academics.html",
    "academic-calendar.html",
    "admission.html",
    "admissions.html",
    "alumni.html",
    "anti-ragging.html",
    "campus.html",
    "cells.html",
    "contact.html",
    "courses.html",
    "departments.html",
    "downloads.html",
    "eligibility.html",
    "faculty.html",
    "fees.html",
    "gallery.html",
    "grievance.html",
    "infrastructure.html",
    "legacy.html",
    "library.html"
)

Write-Host "Changing footer color to: $newColor" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Magenta

$updated = 0
$scanned = 0

foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        continue
    }
    $scanned++

    $content = Get-Content $file -Raw -Encoding UTF8

    # Check if orange color exists
    if ($content -match '#ff8c00') {
        # Create backup
        Copy-Item $file "$file.bak" -Force

        # Replace all occurrences
        $content = $content -replace '#ff8c00', $newColor

        # Write file
        Set-Content -Path $file -Value $content -Encoding UTF8 -NoNewline

        Write-Host "Updated: $file" -ForegroundColor Green
        $updated++
    } else {
        Write-Host "Skipped: $file (no #ff8c00 found)" -ForegroundColor Yellow
    }
}

Write-Host "========================================" -ForegroundColor Magenta
Write-Host "Done. Files scanned: $scanned, Files updated: $updated" -ForegroundColor Green
Write-Host "Backup copies saved as .bak" -ForegroundColor Yellow