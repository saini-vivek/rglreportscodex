import React from 'react';
import { createRoot } from 'react-dom/client';
import '../css/app.css';

function App() {
    return (
        <main className="shell">
            <section className="panel">
                <p className="eyebrow">Laravel + React + MySQL</p>
                <h1>RGL Reports</h1>
                <p>
                    The project skeleton is ready for shared development across your
                    Rocky Linux PC and office Mac.
                </p>
            </section>
        </main>
    );
}

createRoot(document.getElementById('root')).render(
    <React.StrictMode>
        <App />
    </React.StrictMode>,
);
