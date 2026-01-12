import './pages.css'

export default function Perfil(){
  return (
    <main className="main">
      <section className="section">
        <h1 className="title">Mi Perfil</h1>

        <div className="card" style={{marginTop:12}}>
          <div style={{display:'grid', gridTemplateColumns:'repeat(auto-fit,minmax(140px,1fr))', gap:12}}>
            <div>
              <div className="muted">Cumplimiento semanal</div>
              <div style={{fontSize:24, fontWeight:700}}>66%</div>
            </div>
            <div>
              <div className="muted">Zonas tratadas</div>
              <div style={{fontSize:24, fontWeight:700}}>7</div>
            </div>
            <div>
              <div className="muted">Tiempo total</div>
              <div style={{fontSize:24, fontWeight:700}}>51m</div>
            </div>
          </div>
        </div>

        <div className="card" style={{marginTop:12}}>
          <h3 className="subtitle">Información Personal</h3>
          <div style={{display:'grid', gridTemplateColumns:'repeat(auto-fit,minmax(160px,1fr))', gap:10, marginTop:10}}>
            <span className="badge">19638444-8</span>
            <span className="badge">+56991712991</span>
            <span className="badge">65.0 kg</span>
            <span className="badge">1.75 m</span>
            <span className="badge">Masculino</span>
          </div>
        </div>

        <div className="card" style={{marginTop:12}}>
          <h3 className="subtitle">Tu PLAN</h3>
          <p className="muted" style={{marginTop:8}}>
            No has reportado molestias considerables, por lo que te recomendamos
            pasar por el servicio 2 veces por semana para PREVENIR molestias en
            el futuro. RECUERDA que tu cuerpo es tu principal herramienta de trabajo!
          </p>
          <div style={{marginTop:12, display:'flex', gap:8, flexWrap:'wrap'}}>
            <span className="badge">MUÑECA / MANO</span>
            <span className="badge">PIERNAS / GLÚTEOS</span>
          </div>
        </div>
      </section>
    </main>
  )
}
