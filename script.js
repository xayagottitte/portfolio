  // Project filtering
  const filterButtons = document.querySelectorAll('.filter-btn');
  const projects = document.querySelectorAll('.project-card');

  filterButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      filterButtons.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      const filter = btn.getAttribute('data-filter');

      projects.forEach(card => {
        const match = card.classList.contains(filter) || filter === "all";
        card.style.display = match ? "block" : "none";
      });
    });
  });

  // Dark mode toggle
  const toggleBtn = document.getElementById("toggleDark");
  const body = document.body;
  const cards = document.querySelectorAll('.card');
  const projectsSection = document.getElementById("projects");
  const aboutSection = document.getElementById("about");
  const skillsSection = document.getElementById("skills");

  toggleBtn.addEventListener("click", function () {
    const isDark = body.classList.toggle("bg-dark");
    body.classList.toggle("text-light");

    [projectsSection, aboutSection, skillsSection].forEach(section => {
      if (section) {
        section.classList.toggle("bg-dark");
        section.classList.toggle("text-light");
      }
    });

    cards.forEach(card => {
      card.classList.toggle("bg-dark");
      card.classList.toggle("text-light");
      card.classList.toggle("border-light");
    });

    toggleBtn.innerHTML = isDark ? "☀️ Light Mode" : "🌙 Dark Mode";
  });

  // Contact form validation
  const contactForm = document.getElementById("contactForm");
  contactForm.addEventListener("submit", function(event) {
    if (!contactForm.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
    }
    contactForm.classList.add("was-validated");
  });