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
