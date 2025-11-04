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
