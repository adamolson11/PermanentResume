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
