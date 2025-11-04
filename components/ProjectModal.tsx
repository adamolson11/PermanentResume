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
