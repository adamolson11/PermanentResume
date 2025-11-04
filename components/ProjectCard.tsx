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
