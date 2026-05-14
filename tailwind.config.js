/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        "./src/**/*.{html,js}",
        "./views/**/*.{html,ejs}"
    ],
    theme: {
        extend: {
            screens: {
                '3xl': '1700px',
            },
            colors: {
                slate: {
                    950: '#0f172a',
                    900: '#0f172a',
                    850: '#1e293b',
                    800: '#1e293b',
                    700: '#334155',
                    600: '#475569',
                    500: '#64748b',
                    400: '#94a3b8',
                    300: '#cbd5e1',
                    200: '#e2e8f0',
                    100: '#f1f5f9',
                    50: '#f8fafc',
                },
            },
            fontFamily: {
                sans: ['Plus Jakarta Sans', 'system-ui', '-apple-system', 'sans-serif'],
                mono: ['Geist Mono', 'monospace'],
            },
        },
    },
    plugins: [
        require("@tailwindcss/forms"),
        require("@tailwindcss/typography")
    ]
}

