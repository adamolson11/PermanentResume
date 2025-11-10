export default function Home() {
  const projects = [
    {
      title: "TicketFlow",
      description: "Streamlined support ticket workflow application",
      tech: ["React", "Node.js", "MongoDB"],
      status: "Live"
    },
    {
      title: "Hudson Blue Market",
      description: "Curated marketplace for design assets",
      tech: ["Next.js", "Tailwind", "TypeScript"],
      status: "In Development"
    },
    {
      title: "Portfolio Site",
      description: "Personal portfolio with modern stack",
      tech: ["Next.js", "Tailwind CSS"],
      status: "Live"
    }
  ];

  const skills = [
    "JavaScript/TypeScript", "React and Next.js", "Node.js",
    "Python", "MongoDB", "PostgreSQL",
    "Git and GitHub", "REST APIs", "Tailwind CSS"
  ];

  return (
    <main className="min-h-screen">
      {/* Hero Section */}
      <section className="hero-section">
        <div className="container">
          <h1 className="hero-title">Adam Olson</h1>
          <p className="hero-subtitle">Technical Product Specialist • Full-Stack Developer</p>
          <p className="hero-description">
            Building reliable products that scale, automate, and make life easier for teams.
          </p>
        </div>
      </section>

      {/* Skills Section */}
      <section className="section">
        <div className="container">
          <h2 className="section-title">Skills</h2>
          <div className="skills-grid">
            {skills.map((skill) => (
              <div key={skill} className="skill-tag">
                {skill}
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Projects Section */}
      <section className="section section-alt">
        <div className="container">
          <h2 className="section-title">Projects</h2>
          <div className="projects-grid">
            {projects.map((project) => (
              <div key={project.title} className="project-card">
                <div className="project-header">
                  <h3 className="project-title">{project.title}</h3>
                  <span className="project-status">{project.status}</span>
                </div>
                <p className="project-description">{project.description}</p>
                <div className="project-tech">
                  {project.tech.map((tech) => (
                    <span key={tech} className="tech-tag">{tech}</span>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Contact Section */}
      <section className="section">
        <div className="container text-center">
          <h2 className="section-title">Let&apos;s Connect</h2>
          <p className="contact-text">
            Interested in working together? Reach out and let&apos;s build something great.
          </p>
          <div className="contact-links">
            <a href="mailto:adam.olson11@gmail.com" className="contact-button">
              Email Me
            </a>
            <a href="https://github.com/adamolson11" target="_blank" rel="noopener noreferrer" className="contact-button">
              GitHub
            </a>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="footer">
        <div className="container">
          <p>© {new Date().getFullYear()} Adam Olson. All rights reserved.</p>
        </div>
      </footer>
    </main>
  );
}
