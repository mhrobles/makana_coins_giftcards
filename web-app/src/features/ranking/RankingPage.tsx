import Card from '../../components/ui/Card';
import Section from '../../components/ui/Section';
import { Title, Subtitle } from '../../components/ui/Title';
import LeaderItem from '../../components/LeaderItem';
import { getTopLeaders } from '../../services/ranking';
import { getUserProfile } from '../../services/user';

export default function RankingPage(){
  const leaders = getTopLeaders();
  const user = getUserProfile();
  const userPosition = user.rankingPosition;
  const userPoints = user.points;

  return (
    <main className="main">
      <Section>
        <Title>Ranking</Title>
        <Card style={{marginTop:12, background:'linear-gradient(135deg,#1560ff,#36a0ff)', color:'#fff'}}>
          <div className="muted">Tu Posición</div>
          <div style={{fontSize:28, fontWeight:800}}>#{userPosition}</div>
          <div style={{marginTop:8, fontSize:22, fontWeight:700}}>{userPoints} pts</div>
        </Card>

        <Subtitle>Top 10</Subtitle>
        <Card style={{marginTop:8}}>
          {leaders.map((entry, i) => (
            <LeaderItem key={entry.name} entry={entry} index={i} />
          ))}
        </Card>
      </Section>
    </main>
  );
}
