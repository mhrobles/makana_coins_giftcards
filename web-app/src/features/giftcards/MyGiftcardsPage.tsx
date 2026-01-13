import Section from '../../components/ui/Section';
import Card from '../../components/ui/Card';
import { Title, Subtitle } from '../../components/ui/Title';
import Button from '../../components/ui/Button';
import Row from '../../components/ui/Row';
import { getUserGiftcards } from '../../services/params';
import { Link } from 'react-router-dom';

const copyCode = async (code: string) => {
  try { await navigator.clipboard.writeText(code); alert('Código copiado'); } catch {}
};

export default function MyGiftcardsPage(){
  const items = getUserGiftcards();
  return (
    <main className="main">
      <Section>
        <Title>Mis Giftcards</Title>
        <Row>
          {items.map((g,i) => (
            <Card key={i}>
              <Subtitle>{g.storeName}</Subtitle>
              <div style={{display:'grid', gap:6}}>
                <div><strong>Monto:</strong> ${g.amountCLP.toLocaleString('es-CL')}</div>
                <div><strong>Código:</strong> {g.code}</div>
                <div className="muted">Fecha: {new Date(g.issuedAt).toLocaleString('es-CL')}</div>
              </div>
              <div style={{marginTop:8}}>
                <Button onClick={() => copyCode(g.code)}>Copiar código</Button>
              </div>
            </Card>
          ))}
        </Row>
        <div style={{marginTop:20}}>
          <Link to="/coins"><Button>Volver</Button></Link>
        </div>
      </Section>
    </main>
  );
}
