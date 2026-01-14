import Section from '../../components/ui/Section';
import { Title, Subtitle } from '../../components/ui/Title';
import Card from '../../components/ui/Card';
import Badge from '../../components/ui/Badge';
import { getPersonalInfo, getPlanPriorities, getProfileStats } from '../../services/profile';
import { formatMinutes, formatPercent } from '../../utils/format';
import Button from '../../components/ui/Button';
import { Link } from 'react-router-dom';

export default function ProfilePage(){
  const stats = getProfileStats();
  const personal = getPersonalInfo();
  const priorities = getPlanPriorities();

  return (
    <main className="main">
      <Section>
        <Title>Mi Perfil</Title>
        <div style={{margin:'12px 0'}}>
          <Link to="/coins"><Button>Mis Coins</Button></Link>
        </div>

        <Card>
          <div style={{display:'grid', gridTemplateColumns:'repeat(auto-fit,minmax(140px,1fr))', gap:12}}>
            <div>
              <div className="muted">Cumplimiento semanal</div>
              <div style={{fontSize:24, fontWeight:700}}>{formatPercent(stats.weeklyCompliancePct)}</div>
            </div>
            <div>
              <div className="muted">Zonas tratadas</div>
              <div style={{fontSize:24, fontWeight:700}}>{stats.zonesTreated}</div>
            </div>
            <div>
              <div className="muted">Tiempo total</div>
              <div style={{fontSize:24, fontWeight:700}}>{formatMinutes(stats.totalMinutes)}</div>
            </div>
          </div>
        </Card>

        <Card style={{marginTop:12}}>
          <Subtitle>Información Personal</Subtitle>
          <div style={{display:'grid', gridTemplateColumns:'repeat(auto-fit,minmax(160px,1fr))', gap:10, marginTop:10}}>
            <Badge>{personal.id}</Badge>
            <Badge>{personal.phone}</Badge>
            <Badge>{personal.weightKg.toFixed(1)} kg</Badge>
            <Badge>{personal.heightM.toFixed(2)} m</Badge>
            <Badge>{personal.gender}</Badge>
          </div>
        </Card>

        <Card style={{marginTop:12}}>
          <Subtitle>Tu PLAN</Subtitle>
          <p className="muted" style={{marginTop:8}}>
            No has reportado molestias considerables, por lo que te recomendamos
            pasar por el servicio 2 veces por semana para PREVENIR molestias en
            el futuro. RECUERDA que tu cuerpo es tu principal herramienta de trabajo!
          </p>
          <div style={{marginTop:12, display:'flex', gap:8, flexWrap:'wrap'}}>
            {priorities.map(p => <Badge key={p}>{p}</Badge>)}
          </div>
        </Card>
      </Section>
    </main>
  );
}
