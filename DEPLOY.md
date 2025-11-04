# Simplified Portfolio - Deployment Guide

## ✅ What I Built

A **clean, single-page portfolio** with:
- No bloated dependencies
- No complex state management
- No overcomplicated motion systems
- Just Next.js 14 + Tailwind CSS + clean code

**Live on branch:** `feature/simple-portfolio`

---

## 🚀 Quick Deploy to Vercel (2 minutes)

1. **Go to [Vercel](https://vercel.com)**
2. Click "Add New Project"
3. Import your GitHub repo: `adamolson11/PermanentResume`
4. Select branch: `feature/simple-portfolio`
5. Click "Deploy"

That's it! Vercel auto-detects Next.js and handles everything.

---

## 💻 Run Locally (if you have space)

```bash
# Clone or switch to the branch
git checkout feature/simple-portfolio

# Install (about 200-300MB)
npm install

# Run dev server
npm run dev
```

Open http://localhost:3000

---

## 📝 What You Get

### Hero Section
- Clean, gradient title effect
- Your name and title
- Professional tagline

### Skills Section
- Grid of your tech stack
- Hover effects
- Responsive layout

### Projects Section
- 3 project cards with:
  - Title & status badges
  - Description
  - Tech stack tags
  - Hover animations

### Contact Section
- Email and GitHub links
- Clean call-to-action buttons

---

## 🎨 Customize It

### Update Your Info
Edit `app/page.tsx`:

```typescript
const projects = [
  {
    title: "Your Project",
    description: "What it does",
    tech: ["React", "Node.js"],
    status: "Live"
  },
  // Add more...
];

const skills = [
  "Your", "Skills", "Here"
];
```

### Change Colors
Edit `app/globals.css`:

```css
:root {
  --noir: #0B2239;        /* Background */
  --hb-blue: #13BEF0;     /* Primary accent */
  --hb-blue-2: #4979FF;   /* Secondary accent */
}
```

### Update Contact
In `app/page.tsx`, find the contact section and update:
```typescript
<a href="mailto:your.email@example.com">Email Me</a>
<a href="https://github.com/yourusername">GitHub</a>
```

---

## 🎯 No More Complexity

**What I removed:**
- ❌ Framer Motion (overkill)
- ❌ Complex component structure
- ❌ Unnecessary state management
- ❌ Over-engineered motion systems
- ❌ Multi-agent coordination overhead

**What you have now:**
- ✅ Simple, single-page design
- ✅ Easy to understand code
- ✅ Fast to deploy
- ✅ Easy to customize
- ✅ Actually works

---

## 🔥 Deploy It Now

Branch is ready: `feature/simple-portfolio`

**Just push to Vercel and you're live in 2 minutes.**

No npm install needed on your machine if storage is tight — Vercel handles the build remotely.
