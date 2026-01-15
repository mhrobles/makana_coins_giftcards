import Section from '../../components/ui/Section';
import { Title, Subtitle } from '../../components/ui/Title';
import Card from '../../components/ui/Card';
import Row from '../../components/ui/Row';
import Button from '../../components/ui/Button';
import { getExploreTags, getSuggestedRoutines } from '../../services/home';
import { getUserProfile } from '../../services/user';
import { formatMinutes } from '../../utils/format';

export default function HomePage() {
  const routines = getSuggestedRoutines();
  const tags = getExploreTags();
  const user = getUserProfile();

  return (
    <main className="main">
      <Section>
        <Title>Hola {user.name}</Title>
        <Card style={{marginTop:12}}>
          <div className="banner">Revisa el desafío de este mes!</div>
        </Card>

        <Subtitle>Rutinas pensadas para ti</Subtitle>
        <Row>
          {routines.map(r => (
            <Card key={r.id}>
              <Subtitle>{r.title}</Subtitle>
              <div className="muted">Sesión de {formatMinutes(r.durationMin)}</div>
              <Button>Empezar</Button>
            </Card>
          ))}
        </Row>

        <Card style={{marginTop:24}}>
          <Subtitle>Prueba algo diferente</Subtitle>
          <Row>
            {tags.map(t => <Button key={t}>{t}</Button>)}
          </Row>
        </Card>
      </Section>
    </main>
  );
}
