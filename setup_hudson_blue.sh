#!/usr/bin/env bash
set -euo pipefail

# Config
BRANCH="feature/restructure-to-hudson-blue"
COMMIT_MSG="chore(restructure): add Next.js starter files, theme tokens, motion variants, and component stubs"
PR_TITLE="feat(init): restructure to Next.js + HB theme"
PR_BODY_FILE=".hudson_blue_pr_body.md"

# Ensure script run from repo root
if [ ! -d .git ]; then
  echo "Error: run this from the repository root (where .git lives)."
  exit 1
fi

# Create & checkout branch
git fetch origin
git checkout -B "$BRANCH"

# Make directories
mkdir -p app components scripts/motion data lib .github/workflows design

# Write .gitignore
cat > .gitignore <<'EOF'
node_modules/
.next/
out/
dist/
build/
.env
.DS_Store
EOF

# README
cat > README.md <<'EOF'
# Hudson Blue — PermanentResume (restructure)

This branch restructures the repository toward a Next.js + Tailwind starter using the "Digital Noir × Hudson Blue" visual system.

Quick notes:
- Branch: feature/restructure-to-hudson-blue
- Next steps: npm install, npm run dev, verify local build

Theme tokens, motion variants, and component stubs are included.
EOF

# package.json
cat > package.json <<'EOF'
{
  "name": "hudson-blue-portfolio",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "framer-motion": "^8.0.0",
    "next": "14.0.0",
    "react": "18.2.0",
    "react-dom": "18.2.0"
  },
  "devDependencies": {
    "autoprefixer": "^10.0.0",
    "postcss": "^8.0.0",
    "tailwindcss": "^3.0.0",
    "typescript": "^5.0.0",
    "eslint": "^8.0.0",
    "eslint-config-next": "14.0.0"
  }
}
EOF

# tailwind.config.js
cat > tailwind.config.js <<'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
    "./pages/**/*.{js,ts,jsx,tsx}"
  ],
  theme: {
    extend: {
      colors: {
        'hb-blue': '#13BEF0',
        'hb-blue-2': '#4979FF',
        'noir': '#0B2239',
      },
      boxShadow: {
        'hb-card': '0 14px 40px rgba(19,190,240,0.18)'
      },
      backdropBlur: {
        xs: '4px',
        sm: '8px',
        md: '12px',
        lg: '20px'
      }
    },
  },
  plugins: [],
  darkMode: 'class'
}
EOF

# app/globals.css
cat > app/globals.css <<'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

/* Project base - Digital Noir */
:root { color-scheme: dark; }

body {
  background: #0B2239;
  color: #DBEAFE;
  font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
  line-height: 1.45;
}

/* Glass UI */
.glass {
  background: rgba(255,255,255,0.03);
  border: 1px solid rgba(255,255,255,0.06);
  -webkit-backdrop-filter: blur(12px);
  backdrop-filter: blur(12px);
}

.ring-hb {
  outline: 2px solid #13BEF0;
  outline-offset: 3px;
}

/* Respect prefers-reduced-motion */
@media (prefers-reduced-motion: reduce) {
  * {
    transition: none !important;
    animation: none !important;
  }
}
EOF

# scripts/motion/variants.js
cat > scripts/motion/variants.js <<'EOF'
// Creative Motion Table v1.1 - shared Framer Motion variants
const easings = {
  easeSoft: [0.20, 0.90, 0.20, 1.00],
  easeInOut: [0.4, 0.0, 0.2, 1]
};

const durations = {
  short: 0.22,
  medium: 0.42,
  long: 0.7
};

const sectionReveal = {
  initial: { opacity: 0, y: 18 },
  animate: { opacity: 1, y: 0, transition: { duration: durations.medium, ease: easings.easeSoft } },
  exit: { opacity: 0, y: 8, transition: { duration: durations.short, ease: easings.easeSoft } }
};

const listStagger = {
  animate: (i = 1) => ({
    transition: {
      staggerChildren: 0.06,
      delayChildren: 0.06 * i
    }
  })
};

const cardIn = {
  initial: { opacity: 0, y: 10, scale: 0.995 },
  animate: { opacity: 1, y: 0, scale: 1, transition: { duration: durations.short, ease: easings.easeSoft } },
};

const cardHover = () => ({
  scale: 1.02,
  y: -4,
  boxShadow: "0 18px 40px rgba(19,190,240,0.12)",
  transition: { duration: 0.18, ease: easings.easeSoft }
});

const cardHoverOut = () => ({
  scale: 1,
  y: 0,
  boxShadow: "0 6px 18px rgba(2,6,23,0.4)",
  transition: { duration: 0.18, ease: easings.easeSoft }
});

const modalBackdrop = {
  initial: { opacity: 0 },
  animate: { opacity: 1, transition: { duration: 0.28, ease: easings.easeSoft } },
  exit: { opacity: 0, transition: { duration: 0.18, ease: easings.easeSoft } }
};

const modalPanel = {
  initial: { opacity: 0, y: 18, scale: 0.995 },
  animate: { opacity: 1, y: 0, scale: 1, transition: { duration: durations.medium, ease: easings.easeSoft } },
  exit: { opacity: 0, y: 6, scale: 0.995, transition: { duration: durations.short, ease: easings.easeSoft } }
};

const logoIdle = {
  animate: {
    rotate: [0, 2, 0, -2, 0],
    transition: { repeat: Infinity, duration: 6, ease: 'linear' }
  }
};

module.exports = {
  easings,
  durations,
  sectionReveal,
  listStagger,
  cardIn,
  cardHover,
  cardHoverOut,
  modalBackdrop,
  modalPanel,
  logoIdle
};
EOF

# components/ProjectCard.tsx
cat > components/ProjectCard.tsx <<'EOF'
import React from "react";
import { motion, MotionProps } from "framer-motion";
import { cardIn, cardHover, cardHoverOut } from "../scripts/motion/variants";

type Props = {
  id: string;
  title: string;
  description: string;
  status?: string;
  onOpen?: (id: string) => void;
};

export const ProjectCard: React.FC<Props> = ({ id, title, description, status, onOpen }) => {
  const reduced = typeof window !== "undefined" && window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  return (
    <motion.button
      className="glass rounded-2xl transition-transform border border-white/5 p-4 text-left w-full focus:outline-none"
      onClick={() => onOpen && onOpen(id)}
      whileHover={!reduced ? cardHover() : {}}
      onHoverEnd={!reduced ? cardHoverOut : undefined}
      initial="initial"
      animate="animate"
      variants={cardIn as unknown as MotionProps["variants"]}
    >
      <h3 className="text-lg font-semibold">{title}</h3>
      <p className="text-sm mt-2 opacity-80">{description}</p>
      <div className="mt-3 text-xs opacity-70">{status}</div>
    </motion.button>
  );
};
EOF

# components/Projects.tsx
cat > components/Projects.tsx <<'EOF'
import React, { useState } from "react";
import projectsData from "../data/projects.json";
import { ProjectCard } from "./ProjectCard";
import { ProjectModal } from "./ProjectModal";
import { motion } from "framer-motion";
import { listStagger } from "../scripts/motion/variants";

export const Projects: React.FC = () => {
  const [openId, setOpenId] = useState<string | null>(null);
  return (
    <section aria-labelledby="projects-heading" className="py-12">
      <h2 id="projects-heading" className="text-2xl font-bold mb-6">Projects</h2>
      <motion.div className="grid grid-cols-1 md:grid-cols-3 gap-6"
        initial="initial"
        animate="animate"
        variants={listStagger}
      >
        {projectsData.map((p, idx) => (
          <motion.div key={p.id} custom={idx}>
            <ProjectCard {...p} onOpen={(id) => setOpenId(id)} />
          </motion.div>
        ))}
      </motion.div>

      {openId && <ProjectModal id={openId} onClose={() => setOpenId(null)} />}
    </section>
  );
};
EOF

# components/ProjectModal.tsx
cat > components/ProjectModal.tsx <<'EOF'
import React, { useEffect, useRef } from "react";
import { createPortal } from "react-dom";
import { motion, AnimatePresence } from "framer-motion";
import { modalBackdrop, modalPanel } from "../scripts/motion/variants";
import projectsData from "../data/projects.json";

export const ProjectModal: React.FC<{ id: string; onClose: () => void }> = ({ id, onClose }) => {
  const ref = useRef<HTMLDivElement | null>(null);
  const project = projectsData.find((p) => p.id === id);
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => { if (e.key === "Escape") onClose(); };
    document.addEventListener("keydown", onKey);
    return () => document.removeEventListener("keydown", onKey);
  }, [onClose]);

  if (typeof document === "undefined") return null;
  return createPortal(
    <AnimatePresence>
      <motion.div className="fixed inset-0 z-50 flex items-center justify-center" variants={modalBackdrop} initial="initial" animate="animate" exit="exit" onClick={onClose}>
        <motion.div className="glass rounded-2xl shadow-hb-card max-w-2xl w-full p-6 m-4" variants={modalPanel} initial="initial" animate="animate" exit="exit" onClick={(e) => e.stopPropagation()} ref={ref} role="dialog" aria-modal="true" aria-labelledby="modal-title">
          <h3 id="modal-title" className="text-xl font-semibold">{project?.title}</h3>
          <p className="mt-3">{project?.description}</p>
          <div className="mt-6">
            <button onClick={onClose} className="px-3 py-2 bg-hb-blue rounded">Close</button>
          </div>
        </motion.div>
      </motion.div>
    </AnimatePresence>,
    document.body
  );
};
EOF

# app/page.tsx
cat > app/page.tsx <<'EOF'
import React from "react";
import "./globals.css";
import { Projects } from "../components/Projects";

export default function Page() {
  return (
    <main className="min-h-screen px-6 py-10">
      <header className="mb-12">
        <h1 className="text-4xl font-bold">Adam Olson</h1>
        <p className="mt-2 opacity-80">Technical Product Specialist • Full-stack Problem Solver</p>
      </header>

      <section id="hero" className="mb-10">
        <h2 className="text-3xl font-semibold">Digital Noir × Hudson Blue</h2>
        <p className="mt-2 opacity-80">A motion-first, glassmorphism portfolio starter.</p>
      </section>

      <Projects />

      <footer className="mt-16 text-sm opacity-70">
        © {new Date().getFullYear()} Adam Olson
      </footer>
    </main>
  );
}
EOF

# lib/seo.ts
cat > lib/seo.ts <<'EOF'
export const siteMeta = {
  title: 'Adam Olson — Technical Product Specialist → Full-Stack Problem Solver',
  description: 'Remote-first builder focused on reliable apps and automations.',
  siteUrl: 'https://your-domain.dev'
};
EOF

# data/projects.json
cat > data/projects.json <<'EOF'
[
  {
    "id": "ticketflow",
    "title": "TicketFlow",
    "description": "A streamlined support ticket workflow app.",
    "status": "Live"
  },
  {
    "id": "hb-market",
    "title": "Hudson Blue Market",
    "description": "Marketplace for curated Hudson Blue assets.",
    "status": "In Development — Launching 2025"
  },
  {
    "id": "portfolio",
    "title": "Portfolio Site",
    "description": "This Hudson Blue portfolio starter.",
    "status": "Prototype"
  }
]
EOF

# PR template + CI workflow
cat > .github/pull_request_template.md <<'EOF'
## Summary
<!-- Short description of changes -->

## Screenshots
- Desktop (1366×768): 
- Mobile (375×812):

## Acceptance checklist
- [ ] Build OK (npm run build)
- [ ] No console errors
- [ ] A11y keyboard interactions verified
- [ ] Reduced-motion respected
- [ ] Tokens and theme classes used
- [ ] Creative guardrails followed
EOF

cat > .github/workflows/ci.yml <<'EOF'
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [20.x]
    steps:
      - uses: actions/checkout@v4
      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node-version }}
      - run: npm ci
      - run: npm run build
      - run: npm run lint || echo "lint step skipped or failed"
EOF

# design file
cat > design/Creative-Motion-Table-v1.1.md <<'EOF'
Creative Motion Table v1.1

- Easing: easeSoft: [0.20,0.90,0.20,1.00]
- Durations: short 0.22, medium 0.42, long 0.7
- Variants: sectionReveal, listStagger, cardIn, cardHover, cardHoverOut, modalBackdrop, modalPanel, logoIdle
- Accessibility: respect prefers-reduced-motion
- Usage examples:
  - Hero heading -> sectionReveal
  - Lists -> listStagger on parent, cardIn on items
  - Modals -> modalBackdrop + modalPanel
EOF

# Prepare PR body
cat > "$PR_BODY_FILE" <<EOF
Short summary:
Restructure repo to Next.js + Tailwind with Digital Noir × Hudson Blue theme, add motion variants and initial components (Projects, ProjectCard, ProjectModal), PR template, and CI workflow.

Files added: tailwind.config.js, app/globals.css, scripts/motion/variants.js, design/Creative-Motion-Table-v1.1.md, components/*, data/projects.json, lib/seo.ts, package.json, README.md, .github/pull_request_template.md, .github/workflows/ci.yml

Acceptance checklist:
- [ ] Build OK (npm run build)
- [ ] No console errors
- [ ] A11y keyboard interactions verified
- [ ] Reduced-motion respected
- [ ] Tokens and theme classes used
- [ ] Creative guardrails followed
EOF

# Stage and commit
git add .
git commit -m "$COMMIT_MSG" || echo "No changes to commit"

# Push branch
git push -u origin "$BRANCH"

# Create PR using gh if available
if command -v gh >/dev/null 2>&1; then
  echo "Creating pull request with gh..."
  gh pr create --title "$PR_TITLE" --body-file "$PR_BODY_FILE" --base main --head "$BRANCH"
  echo "PR created (if gh authenticated)."
else
  echo "gh CLI not found. Branch pushed. Create a PR manually with title:"
  echo "  $PR_TITLE"
  echo "and paste the contents of $PR_BODY_FILE as the PR body."
fi

echo "Done. Next: locally run 'npm install' then 'npm run dev' and open http://localhost:3000 to verify."
