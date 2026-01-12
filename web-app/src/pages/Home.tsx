import './pages.css'

export default function Home() {
  return (
    <main className="main">
      <section className="section">
        <div className="title">Hola Carlos</div>
        <div className="card banner" style={{marginTop:12}}>Revisa el desafío de este mes!</div>

        <h2 className="subtitle" style={{marginTop:24}}>Rutinas pensadas para ti</h2>
        <div className="row" style={{marginTop:12}}>
          <div className="card">
            <div className="subtitle">Alivia tus TOBILLOS / PIES</div>
            <div className="muted" style={{marginTop:8}}>Sesión de 15 minutos</div>
            <button className="btn" style={{marginTop:12}}>Empezar</button>
          </div>
          <div className="card">
            <div className="subtitle">Alivia tu ESPALDA BAJA</div>
            <div className="muted" style={{marginTop:8}}>Sesión de 15 minutos</div>
            <button className="btn" style={{marginTop:12}}>Empezar</button>
          </div>
        </div>

        <div className="card" style={{marginTop:24}}>
          <h3 className="subtitle">Prueba algo diferente</h3>
          <div className="row" style={{marginTop:12}}>
            <button className="btn">Molestias</button>
            <button className="btn">Tensión</button>
            <button className="btn">Hinchazón</button>
          </div>
        </div>
      </section>
    </main>
  )
}
