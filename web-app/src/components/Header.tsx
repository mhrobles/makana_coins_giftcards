import { Link, NavLink } from 'react-router-dom'
import './header.css'

export default function Header() {
  return (
    <header className="mk-header">
      <div className="mk-container">
        <Link to="/" className="mk-brand">makana</Link>
        <nav className="mk-nav">
          <NavLink to="/" end className={({ isActive }) => isActive ? 'active' : ''}>Inicio</NavLink>
          <NavLink to="/ranking" className={({ isActive }) => isActive ? 'active' : ''}>Ranking</NavLink>
          <NavLink to="/perfil" className={({ isActive }) => isActive ? 'active' : ''}>Perfil</NavLink>
        </nav>
      </div>
    </header>
  )
}
