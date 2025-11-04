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
