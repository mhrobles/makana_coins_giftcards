import Section from '../../components/ui/Section';
import Card from '../../components/ui/Card';
import { Title, Subtitle } from '../../components/ui/Title';
import Button from '../../components/ui/Button';
import { Link } from 'react-router-dom';
import { getCoinsInfo } from '../../services/params';

import { useState, useEffect } from 'react';

export default function CoinsPage(){
  const [info, setInfo] = useState(getCoinsInfo());
  useEffect(() => {
    const handler = () => setInfo(getCoinsInfo());
    window.addEventListener('storage', handler);
    return () => window.removeEventListener('storage', handler);
  }, []);
  return (
    <main className="main">
      <Section>
        <Title>Makana Coins</Title>
        <Card>
          <Subtitle>Saldo disponible</Subtitle>
          <div style={{fontSize:28, fontWeight:800}}>{info.balance} coins</div>
          <p className="muted" style={{marginTop:8}}>{info.explanation}</p>
          <div style={{display:'flex', gap:12, marginTop:12, flexWrap:'wrap'}}>
            <Link to="/giftcards/catalog"><Button>Canjear coins</Button></Link>
            <Link to="/giftcards/mine"><Button>Mis giftcards</Button></Link>
          </div>
        </Card>
      </Section>
    </main>
  );
}
