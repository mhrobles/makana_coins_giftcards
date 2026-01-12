import './pages.css'

const top10 = [
  { name: 'Usuario 1', points: 300 },
  { name: 'Usuario 2', points: 251 },
  { name: 'Usuario 3', points: 238 },
  { name: 'Usuario 4', points: 138 },
  { name: 'Usuario 5', points: 138 },
  { name: 'Usuario 6', points: 126 },
  { name: 'Usuario 7', points: 125 },
  { name: 'Usuario 8', points: 125 },
  { name: 'Usuario 9', points: 76 },
  { name: 'Usuario 10', points: 38 },
]

export default function Ranking(){
  return (
    <main className="main">
      <section className="section">
        <h1 className="title">Ranking</h1>
        <div className="card" style={{marginTop:12, background:'linear-gradient(135deg,#1560ff,#36a0ff)', color:'#fff'}}>
          <div className="muted">Tu Posición</div>
          <div style={{fontSize:28, fontWeight:800}}>#10</div>
          <div style={{marginTop:8, fontSize:22, fontWeight:700}}>38 pts</div>
        </div>

        <h2 className="subtitle" style={{marginTop:16}}>Top 10</h2>
        <div className="card" style={{marginTop:8}}>
          {top10.map((x, i) => (
            <div key={i} className="leader-item">
              <div>
                {i < 3 ? ['🥇','🥈','🥉'][i] : `#${i+1}`} &nbsp;
                <strong>{x.name}</strong>
              </div>
              <div>
                <strong>{x.points}</strong> <span className="muted">pts</span>
              </div>
            </div>
          ))}
        </div>
      </section>
    </main>
  )
}
