# update-footer.ps1

# ---------- SETTINGS ----------
$htmlFiles = @(
    "index.html",
    "about.html",
    "academics.html",
    "admissions.html",
    "cells.html",
    "contact.html",
    "gallery.html",
    "infrastructure.html",
    "legacy.html"
)

# ---------- NEW FOOTER HTML (without <html>/<body> tags) ----------
$newFooter = @'
<!-- ===== FOLLOW US ===== -->
<section class="follow-section">
    <h2 class="follow-title">Follow Us</h2>
    <div class="social-top">
        <a href="https://www.facebook.com/" target="_blank" rel="noopener noreferrer" aria-label="Facebook"><i class="fa-brands fa-facebook-f"></i></a>
        <a href="https://www.instagram.com/" target="_blank" rel="noopener noreferrer" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
        <a href="https://x.com/" target="_blank" rel="noopener noreferrer" aria-label="X"><i class="fa-brands fa-x-twitter"></i></a>
        <a href="https://www.threads.net/" target="_blank" rel="noopener noreferrer" aria-label="Threads"><i class="fa-brands fa-threads"></i></a>
        <a href="https://www.youtube.com/" target="_blank" rel="noopener noreferrer" aria-label="YouTube"><i class="fa-brands fa-youtube"></i></a>
    </div>
</section>

<!-- ===== MAIN FOOTER ===== -->
<footer class="main-footer">
    <div class="footer-container">
        <!-- Brand -->
        <div class="footer-brand">
            <img src="IMG_7235.webp" alt="Chandra Shekhar Singh Ayurvedic Sansthan" class="footer-logo">
            <div class="footer-brand-name">Chandra Shekhar Singh<br>Ayurvedic Sansthan</div>
        </div>

        <!-- Get in Touch -->
        <div class="footer-column">
            <h3 class="footer-heading">Get in Touch</h3>
            <ul class="contact-list">
                <li>
                    <span class="contact-icon"><i class="fa-solid fa-phone"></i></span>
                    <span>
                        <a href="tel:+917524037425">+91-7524037425</a>,
                        <a href="tel:+917388810063">+91-7388810063</a>,
                        <a href="tel:+919956514123">+91-9956514123</a>
                    </span>
                </li>
                <li>
                    <span class="contact-icon"><i class="fa-regular fa-envelope"></i></span>
                    <span>
                        <a href="mailto:2015ayu0458@gmail.com">2015ayu0458@gmail.com</a><br>
                        <a href="mailto:cssas.allahabad@gmail.com">cssas.allahabad@gmail.com</a>
                    </span>
                </li>
                <li>
                    <span class="contact-icon"><i class="fa-solid fa-globe"></i></span>
                    <a href="https://www.cssas.org/" target="_blank" rel="noopener noreferrer">www.cssas.org</a>
                </li>
                <li>
                    <span class="contact-icon"><i class="fa-solid fa-location-dot"></i></span>
                    <a href="https://www.google.com/maps/search/?api=1&query=Chandra+Shekhar+Singh+Ayurvedic+Sansthan+Saiyad+Sarawa+Near+Puramufti+Koilaha+Kaushambi+Uttar+Pradesh+212213" target="_blank" rel="noopener noreferrer">
                        Saiyad Sarawa, Near Puramufti, Koilaha Kaushambi, Allahabad (U.P.) - 212213
                    </a>
                </li>
            </ul>
            <div class="footer-social">
                <a href="https://www.facebook.com/" target="_blank" rel="noopener noreferrer" aria-label="Facebook"><i class="fa-brands fa-facebook-f"></i></a>
                <a href="https://www.instagram.com/" target="_blank" rel="noopener noreferrer" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                <a href="https://x.com/" target="_blank" rel="noopener noreferrer" aria-label="X"><i class="fa-brands fa-x-twitter"></i></a>
                <a href="https://www.threads.net/" target="_blank" rel="noopener noreferrer" aria-label="Threads"><i class="fa-brands fa-threads"></i></a>
                <a href="https://www.youtube.com/" target="_blank" rel="noopener noreferrer" aria-label="YouTube"><i class="fa-brands fa-youtube"></i></a>
            </div>
        </div>

        <!-- Quick Links -->
        <div class="footer-column">
            <h3 class="footer-heading">Quick Links</h3>
            <ul class="footer-links">
                <li><a href="index.html">Home</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="contact.html">Contact Us</a></li>
                <li><a href="downloads.html">Download</a></li>
            </ul>
        </div>

        <!-- Academics -->
        <div class="footer-column">
            <h3 class="footer-heading">Academics</h3>
            <ul class="footer-links">
                <li><a href="courses.html">Courses</a></li>
                <li><a href="faculty.html">Faculty</a></li>
                <li><a href="departments.html">Departments</a></li>
                <li><a href="academic-calendar.html">Academic Calendar</a></li>
                <li><a href="eligibility.html">Eligibility</a></li>
                <li><a href="fees.html">Course Fee</a></li>
                <li><a href="admission.html">Admission</a></li>
            </ul>
        </div>

        <!-- Resources -->
        <div class="footer-column">
            <h3 class="footer-heading">Resources</h3>
            <ul class="footer-links">
                <li><a href="campus.html">Campus Facilities</a></li>
                <li><a href="library.html">Library</a></li>
                <li><a href="anti-ragging.html">Anti-Ragging Committee</a></li>
                <li><a href="grievance.html">Grievance Redressal Committee</a></li>
                <li><a href="alumni.html">Alumni</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <span>Copyright © Chandra Shekhar Singh Ayurvedic Sansthan 2026. All Rights Reserved.</span>
    </div>
</footer>

<!-- ===== FLOATING BUTTONS ===== -->
<div class="floating-buttons">
    <a class="float-btn" href="tel:+917524037425" aria-label="Call Chandra Shekhar Singh Ayurvedic Sansthan">
        <i class="fa-solid fa-phone"></i>
    </a>
    <a class="float-btn" href="https://wa.me/917524037425" target="_blank" rel="noopener noreferrer" aria-label="WhatsApp Chandra Shekhar Singh Ayurvedic Sansthan">
        <i class="fa-brands fa-whatsapp"></i>
    </a>
</div>
'@

# ---------- FONT AWESOME CDN LINK ----------
$fontAwesomeLink = '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">'

# ---------- PROCESS EACH FILE ----------
foreach ($file in $htmlFiles) {
    if (-not (Test-Path $file)) {
        Write-Host "Skipping $file (not found)" -ForegroundColor Yellow
        continue
    }

    Write-Host "Processing $file ..." -ForegroundColor Cyan

    # Read file
    $content = Get-Content $file -Raw -Encoding UTF8

    # Backup original
    Copy-Item $file "$file.bak" -Force

    # 1. Add Font Awesome if not already present
    if ($content -notmatch '<link[^>]*font-awesome[^>]*>') {
        # Insert after <head> or before </head>
        if ($content -match '<head>') {
            $content = $content -replace '<head>', "<head>`n    $fontAwesomeLink"
        } elseif ($content -match '</head>') {
            $content = $content -replace '</head>', "    $fontAwesomeLink`n</head>"
        } else {
            Write-Host "  Could not find <head> tag in $file, skipping Font Awesome addition." -ForegroundColor Yellow
        }
    }

    # 2. Replace old footer section
    # Find the marker "<!-- OLD FOOTER RESTORED -->" – if not found, try to find the last <footer> tag
    $marker = '<!-- OLD FOOTER RESTORED -->'
    $startIndex = $content.IndexOf($marker)

    if ($startIndex -eq -1) {
        # Fallback: find the last <footer> tag
        $lastFooterStart = $content.LastIndexOf('<footer>')
        if ($lastFooterStart -eq -1) {
            Write-Host "  Could not find old footer marker or <footer> tag in $file. Skipping." -ForegroundColor Red
            continue
        }
        $startIndex = $lastFooterStart
    }

    # Find the closing </body>
    $endIndex = $content.LastIndexOf('</body>')
    if ($endIndex -eq -1) {
        Write-Host "  Could not find </body> in $file. Skipping." -ForegroundColor Red
        continue
    }

    # Extract everything before the start of the old footer
    $beforeFooter = $content.Substring(0, $startIndex)

    # Build new content: before + newFooter + closing </body> and </html> (if present)
    $newContent = $beforeFooter + "`n" + $newFooter + "`n"

    # Append the original closing tags (</body> and maybe </html>)
    $closingTags = $content.Substring($endIndex)
    $newContent += $closingTags

    # Write updated content
    Set-Content -Path $file -Value $newContent -Encoding UTF8 -NoNewline

    Write-Host "  Updated $file successfully." -ForegroundColor Green
}

Write-Host "`nAll files processed. Backup copies are saved as .bak." -ForegroundColor Magenta