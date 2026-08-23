# create-missing-pages.ps1
# Fixed version – no syntax errors

# ---------- SETTINGS ----------
$templateFile = "about.html"

if (-not (Test-Path $templateFile)) {
    Write-Host "ERROR: $templateFile not found. Please make sure about.html exists." -ForegroundColor Red
    exit 1
}

# ---------- PAGES TO CREATE ----------
$pages = @(
    @{ Name = "downloads"; Title = "Downloads"; Desc = "Download admission forms, brochures, and other important documents." },
    @{ Name = "courses"; Title = "Courses"; Desc = "Explore our comprehensive Ayurvedic courses including BAMS, MD/MS, and certificate programs." },
    @{ Name = "faculty"; Title = "Faculty"; Desc = "Our esteemed faculty members bring decades of experience in Ayurvedic education and practice." },
    @{ Name = "departments"; Title = "Departments"; Desc = "We have various academic departments covering all branches of Ayurveda." },
    @{ Name = "academic-calendar"; Title = "Academic Calendar"; Desc = "Stay updated with important dates, exams, and events throughout the academic year." },
    @{ Name = "eligibility"; Title = "Eligibility"; Desc = "Check the eligibility criteria for our BAMS, MD/MS, and certificate courses." },
    @{ Name = "fees"; Title = "Course Fee"; Desc = "Detailed fee structure for all programs including tuition, hostel, and other charges." },
    @{ Name = "admission"; Title = "Admission"; Desc = "Information about the admission process, important dates, and application forms." },
    @{ Name = "campus"; Title = "Campus Facilities"; Desc = "Our campus is equipped with modern facilities to support a holistic learning environment." },
    @{ Name = "library"; Title = "Library"; Desc = "A well-stocked library with classical texts, journals, and digital resources." },
    @{ Name = "anti-ragging"; Title = "Anti-Ragging Committee"; Desc = "We are committed to providing a ragging-free campus. Details of our Anti-Ragging Committee." },
    @{ Name = "grievance"; Title = "Grievance Redressal Committee"; Desc = "A transparent mechanism to address student and staff grievances." },
    @{ Name = "alumni"; Title = "Alumni"; Desc = "Our alumni network spans across the globe, making a difference in healthcare." }
)

# ---------- READ TEMPLATE ----------
$templateContent = Get-Content $templateFile -Raw -Encoding UTF8

$mainStart = $templateContent.IndexOf('<!-- MAIN ABOUT CONTENT -->')
if ($mainStart -eq -1) {
    $mainStart = $templateContent.IndexOf('<div class="section-padding"')
}

if ($mainStart -eq -1) {
    Write-Host "ERROR: Could not find main content start in $templateFile." -ForegroundColor Red
    exit 1
}

$footerStart = $templateContent.IndexOf('<!-- ===== FOLLOW US ===== -->')
if ($footerStart -eq -1) {
    $footerStart = $templateContent.IndexOf('<footer class="main-footer">')
}

if ($footerStart -eq -1) {
    Write-Host "ERROR: Could not find footer in $templateFile." -ForegroundColor Red
    exit 1
}

$prefix = $templateContent.Substring(0, $mainStart)
$suffix = $templateContent.Substring($footerStart)

# ---------- CREATE EACH PAGE ----------
Write-Host "Creating missing pages..." -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Magenta

foreach ($page in $pages) {
    $fileName = $page.Name + ".html"
    $title = $page.Title
    $desc = $page.Desc

    if (Test-Path $fileName) {
        Write-Host "⚠️  $fileName already exists. Creating backup..." -ForegroundColor Yellow
        Copy-Item $fileName "$fileName.bak" -Force
    }

    Write-Host "📄 Creating $fileName ..." -ForegroundColor Cyan

    $customContent = @"
<!-- MAIN CONTENT -->
<div class="section-padding">
    <div class="container">
        <div class="text-center">
            <h2 class="section-title">$title</h2>
            <p class="section-sub">$desc</p>
        </div>
        <div class="program-details" style="margin-top: 30px;">
            <p>📌 This page is under development. Please check back later for detailed information.</p>
            <p style="margin-top: 10px; color: #5a4f4a;">
                For any queries, feel free to <a href="contact.html" style="color: var(--maroon);">contact us</a>.
            </p>
        </div>
    </div>
</div>
"@

    $newPageContent = $prefix + "`n" + $customContent + "`n" + $suffix
    Set-Content -Path $fileName -Value $newPageContent -Encoding UTF8 -NoNewline

    Write-Host "✅ Created $fileName successfully." -ForegroundColor Green
}

Write-Host "========================================" -ForegroundColor Magenta
Write-Host "All missing pages created successfully!" -ForegroundColor Green
Write-Host "Backup copies (.bak) saved for any existing files." -ForegroundColor Yellow