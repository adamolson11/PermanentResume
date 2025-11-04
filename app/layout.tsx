import type { Metadata } from 'next'
import './globals.css'

export const metadata: Metadata = {
  title: 'Adam Olson | Full-Stack Developer',
  description: 'Technical Product Specialist & Problem Solver',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
