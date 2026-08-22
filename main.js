// ============================================
// MAIN SITE SCRIPTS (for all pages)
// ============================================

// ===========================
// CENTRAL SITE DATA
// ===========================
const SITE = {
    faculty: [
        {
            name: 'Dr. Rajesh Pandey',
            title: 'Principal & Professor, Kayachikitsa',
            desc: 'MD (Kayachikitsa), 22 years of teaching and clinical experience.',
            img: 'https://picsum.photos/seed/faculty-ayur1/400/400'
        },
        {
            name: 'Dr. Sunita Vaidya',
            title: 'Professor, Panchakarma',
            desc: 'MD (Panchakarma), specialist in classical detox therapies.',
            img: 'https://picsum.photos/seed/faculty-ayur2/400/400'
        },
        {
            name: 'Dr. Anil Mishra',
            title: 'Associate Professor, Dravyaguna',
            desc: 'PhD (Pharmacology), expert in medicinal plant research.',
            img: 'https://picsum.photos/seed/faculty-ayur3/400/400'
        },
        {
            name: 'Vaidya Suresh Upadhyay',
            title: 'Senior Vaidya & Clinical Mentor',
            desc: '40 years of clinical practice, Padma Shri nominee.',
            img: 'https://picsum.photos/seed/faculty-ayur4/400/400'
        },
        {
            name: 'Dr. Meera Joshi',
            title: 'Assistant Professor, Shalya',
            desc: 'MS (Shalya), specialist in Kshara Sutra and Agni Karma.',
            img: 'https://picsum.photos/seed/faculty-ayur5/400/400'
        }
    ],
    testimonials: [
        {
            name: 'Dr. Amit Sharma',
            role: 'Alumnus, BAMS 2022',
            text: 'The clinical training at CSSAS gave me the confidence to start my own practice. The faculty are truly world-class.',
            rating: 5
        },
        {
            name: 'Priya Gupta',
            role: 'Final year BAMS student',
            text: 'The herbal garden and practical sessions are unmatched. I feel prepared and inspired every single day.',
            rating: 5
        },
        {
            name: 'Dr. Rohit Verma',
            role: 'MD Scholar, Panchakarma',
            text: 'The depth of knowledge here is incredible. Learning from vaidyas who have decades of experience is a privilege.',
            rating: 4
        },
        {
            name: 'Neha Singh',
            role: 'Alumna, BAMS 2021',
            text: 'CSSAS shaped my understanding of Ayurveda in a way that textbooks never could. Grateful for the holistic education.',
            rating: 5
        }
    ]
};

// ===========================
// FACULTY SLIDER (if present)
// ===========================
const facultyTrack = document.getElementById('facultyTrack');
if (facultyTrack) {
    const facultyDots = document.getElementById('facultyDots');
    let facultyIndex = 0;
    let facultyItems = [];

    SITE.faculty.forEach((f, i) => {
        const card = document.createElement('div');
        card.className = 'faculty-card';
        card.innerHTML = `
            <img src="${f.img}" alt="${f.name}" width="400" height="400" loading="lazy" />
            <h4>${f.name}</h4>
            <div class="title">${f.title}</div>
            <p>${f.desc}</p>
            <span class="caption">ð· placeholder â [INSERT VERIFIED PHOTO]</span>
        `;
        facultyTrack.appendChild(card);
        facultyItems.push(card);

        const dot = document.createElement('span');
        dot.dataset.index = i;
        if (i === 0) dot.classList.add('active');
        dot.addEventListener('click', () => goToFaculty(i));
        facultyDots.appendChild(dot);
    });

    function goToFaculty(index) {
        const total = facultyItems.length;
        if (index < 0) index = total - 1;
        if (index >= total) index = 0;
        facultyIndex = index;
        const width = facultyItems[0].offsetWidth + 28;
        facultyTrack.style.transform = `translateX(-${facultyIndex * width}px)`;
        document.querySelectorAll('#facultyDots span').forEach((d, i) => {
            d.classList.toggle('active', i === facultyIndex);
        });
    }

    const facultyPrev = document.getElementById('facultyPrev');
    const facultyNext = document.getElementById('facultyNext');
    if (facultyPrev) facultyPrev.addEventListener('click', () => goToFaculty(facultyIndex - 1));
    if (facultyNext) facultyNext.addEventListener('click', () => goToFaculty(facultyIndex + 1));

    let facResizeTimer;
    window.addEventListener('resize', () => {
        clearTimeout(facResizeTimer);
        facResizeTimer = setTimeout(() => goToFaculty(facultyIndex), 120);
    });
}

// ===========================
// TESTIMONIALS SLIDER (if present)
// ===========================
const testiTrack = document.getElementById('testiTrack');
if (testiTrack) {
    const testiDots = document.getElementById('testiDots');
    let testiIndex = 0;
    let testiItems = [];

    SITE.testimonials.forEach((t, i) => {
        const card = document.createElement('div');
        card.className = 'testi-card';
        const stars = 'â'.repeat(t.rating) + 'â'.repeat(5 - t.rating);
        card.innerHTML = `
            <div class="stars">${stars}</div>
            <blockquote>â${t.text}â</blockquote>
            <div class="author">${t.name}</div>
            <div class="role">${t.role}</div>
        `;
        testiTrack.appendChild(card);
        testiItems.push(card);

        const dot = document.createElement('span');
        dot.dataset.index = i;
        if (i === 0) dot.classList.add('active');
        dot.addEventListener('click', () => goToTesti(i));
        testiDots.appendChild(dot);
    });

    function goToTesti(index) {
        const total = testiItems.length;
        if (index < 0) index = total - 1;
        if (index >= total) index = 0;
        testiIndex = index;
        const width = testiItems[0].offsetWidth + 28;
        testiTrack.style.transform = `translateX(-${testiIndex * width}px)`;
        document.querySelectorAll('#testiDots span').forEach((d, i) => {
            d.classList.toggle('active', i === testiIndex);
        });
    }

    const testiPrev = document.getElementById('testiPrev');
    const testiNext = document.getElementById('testiNext');
    if (testiPrev) testiPrev.addEventListener('click', () => goToTesti(testiIndex - 1));
    if (testiNext) testiNext.addEventListener('click', () => goToTesti(testiIndex + 1));

    let testiResizeTimer;
    window.addEventListener('resize', () => {
        clearTimeout(testiResizeTimer);
        testiResizeTimer = setTimeout(() => goToTesti(testiIndex), 120);
    });
}

// ===========================
// TABS (if present)
// ===========================
const tabButtons = document.querySelectorAll('.tab-btn');
if (tabButtons.length > 0) {
    const tabPanels = document.querySelectorAll('.tab-panel');
    tabButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            tabButtons.forEach(b => b.setAttribute('aria-selected', 'false'));
            tabPanels.forEach(p => p.classList.remove('active'));
            btn.setAttribute('aria-selected', 'true');
            const panelId = btn.getAttribute('aria-controls');
            document.getElementById(panelId).classList.add('active');
        });
    });
}

// ===========================
// ACCORDION (if present)
// ===========================
const accordionHeaders = document.querySelectorAll('.accordion-header');
accordionHeaders.forEach(header => {
    header.addEventListener('click', () => {
        const item = header.closest('.accordion-item');
        const isOpen = item.classList.contains('open');
        const accordionGroup = item.parentElement;
        accordionGroup.querySelectorAll('.accordion-item').forEach(el => el.classList.remove('open'));
        accordionGroup.querySelectorAll('.accordion-header').forEach(h => h.setAttribute('aria-expanded', 'false'));
        if (!isOpen) {
            item.classList.add('open');
            header.setAttribute('aria-expanded', 'true');
        }
    });
});

// ===========================
// SCROLL ANIMATIONS (REVERSIBLE)
// ===========================
const fadeEls = document.querySelectorAll('.fade-up');
if (fadeEls.length > 0) {
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            } else {
                entry.target.classList.remove('visible');
            }
        });
    }, { threshold: 0.10, rootMargin: '0px 0px -30px 0px' });
    fadeEls.forEach(el => observer.observe(el));
}

// ===========================
// COUNT-UP STATS (if present)
// ===========================
const statNumbers = document.querySelectorAll('.stat-item .number');
if (statNumbers.length > 0) {
    let counted = false;
    const countObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting && !counted) {
                counted = true;
                statNumbers.forEach(el => {
                    const target = parseInt(el.dataset.count, 10);
                    let current = 0;
                    const step = Math.ceil(target / 50);
                    const interval = setInterval(() => {
                        current += step;
                        if (current >= target) {
                            el.textContent = target + '+';
                            clearInterval(interval);
                        } else {
                            el.textContent = current;
                        }
                    }, 25);
                });
            }
        });
    }, { threshold: 0.3 });
    countObserver.observe(statNumbers[0].closest('.stats'));
}

// ===========================
// MOBILE HAMBURGER + DROPDOWNS
// ===========================
const hamburger = document.getElementById('hamburger');
const nav = document.getElementById('nav');
const dropdowns = document.querySelectorAll('.dropdown');

if (hamburger) {
    hamburger.addEventListener('click', () => {
        nav.classList.toggle('open');
        hamburger.innerHTML = nav.classList.contains('open') ? '<span>â</span>' : '<span>â°</span>';
    });

    nav.querySelectorAll('a').forEach(link => {
        link.addEventListener('click', () => {
            nav.classList.remove('open');
            hamburger.innerHTML = '<span>â°</span>';
        });
    });

    dropdowns.forEach(drop => {
        const dropLink = drop.querySelector('a');
        dropLink.addEventListener('click', (e) => {
            if (window.innerWidth <= 820) {
                e.preventDefault();
                drop.classList.toggle('open');
            }
        });
    });
}

// ===========================
// FORM VALIDATION (if form exists)
// ===========================
const form = document.getElementById('admissionForm');
if (form) {
    const nameInput = document.getElementById('fullName');
    const phoneInput = document.getElementById('phone');
    const emailInput = document.getElementById('email');
    const programInput = document.getElementById('program');

    const nameErr = document.getElementById('nameErr');
    const phoneErr = document.getElementById('phoneErr');
    const emailErr = document.getElementById('emailErr');
    const programErr = document.getElementById('programErr');
    const successDiv = document.getElementById('formSuccess');

    function validateField(input, errorEl, condition, msg) {
        if (!condition) {
            errorEl.textContent = msg;
            errorEl.classList.add('visible');
            return false;
        }
        errorEl.classList.remove('visible');
        return true;
    }

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        let valid = true;
        valid &= validateField(nameInput, nameErr, nameInput.value.trim().length >= 2, 'Please enter your full name.');
        valid &= validateField(phoneInput, phoneErr, /^[\+\d\s\-\(\)]{10,15}$/.test(phoneInput.value.trim()), 'Enter a valid phone number (10-15 digits).');
        valid &= validateField(emailInput, emailErr, /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput.value.trim()), 'Please enter a valid email address.');
        valid &= validateField(programInput, programErr, programInput.value !== '', 'Please select a program of interest.');

        if (valid) {
            successDiv.classList.add('visible');
            form.reset();
            setTimeout(() => {
                successDiv.classList.remove('visible');
            }, 6000);
        }
    });

    [nameInput, phoneInput, emailInput, programInput].forEach((input, idx) => {
        input.addEventListener('blur', () => {
            const errors = [nameErr, phoneErr, emailErr, programErr];
            const conds = [
                nameInput.value.trim().length >= 2,
                /^[\+\d\s\-\(\)]{10,15}$/.test(phoneInput.value.trim()),
                /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput.value.trim()),
                programInput.value !== ''
            ];
            const msgs = ['Please enter your full name.', 'Enter a valid phone number.', 'Please enter a valid email address.', 'Please select a program.'];
            validateField(input, errors[idx], conds[idx], msgs[idx]);
        });
    });
}

// ===========================
// JSON-LD STRUCTURED DATA (inject once on all pages)
// ===========================
const ld = document.createElement('script');
ld.type = 'application/ld+json';
ld.textContent = JSON.stringify({
    "@context": "https://schema.org",
    "@type": "CollegeOrUniversity",
    "name": "Chandra Shekhar Singh Ayurvedic Sansthan",
    "description": "Ayurvedic medical college in Varanasi offering BAMS, MD/MS, and certificate courses in Panchakarma and Yoga.",
    "image": "https://picsum.photos/seed/cssas-og/1200/630",
    "address": {
        "@type": "PostalAddress",
        "streetAddress": "12, Ayurveda Marg",
        "addressLocality": "Varanasi",
        "addressRegion": "Uttar Pradesh",
        "postalCode": "221005",
        "addressCountry": "IN"
    },
    "telephone": "+919876543210",
    "email": "info@cssas.org",
    "url": "https://cssas.org"
});
document.head.appendChild(ld);

console.log('ð¿ Chandra Shekhar Singh Ayurvedic Sansthan Â· main scripts loaded.');
