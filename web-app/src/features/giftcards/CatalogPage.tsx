import Section from '../../components/ui/Section';
import Card from '../../components/ui/Card';
import { Title, Subtitle } from '../../components/ui/Title';
import Button from '../../components/ui/Button';
import Row from '../../components/ui/Row';
import { getCoinsInfo, getGiftcardCatalog } from '../../services/params';
import type { GiftcardCatalogStore, GiftcardDenomination } from '../../types/giftcards';
import { Link, useNavigate } from 'react-router-dom';

const canAfford = (balance: number, d: GiftcardDenomination) => balance >= d.costCoins;

export default function CatalogPage(){
  const nav = useNavigate();
  const balance = getCoinsInfo().balance;
  const stores = getGiftcardCatalog();

  const goConfirm = (store: GiftcardCatalogStore, d: GiftcardDenomination) => {
    const params = new URLSearchParams({ store: store.id, name: store.name, amount: String(d.amountCLP), coins: String(d.costCoins) });
    nav(`/giftcards/confirm?${params.toString()}`);
  };

  return (
    <main className="main">
      <Section>
        <Title>Catálogo de Giftcards</Title>
        <p className="muted">Saldo: <strong>{balance} coins</strong></p>
        <Row>
          {stores.map(s => (
            <Card key={s.id}>
              <Subtitle>{s.name}</Subtitle>
              <div style={{display:'grid', gap:8, marginTop:8}}>
                {s.denominations.map(d => (
                  <div key={d.amountCLP} style={{display:'flex', justifyContent:'space-between', alignItems:'center'}}>
                    <div>
                      <strong>${d.amountCLP.toLocaleString('es-CL')}</strong> <span className="muted">({d.costCoins} coins)</span>
                    </div>
                    {canAfford(balance, d)
                      ? <Button onClick={() => goConfirm(s, d)}>Elegir</Button>
                      : <span className="muted">Saldo insuficiente</span>}
                  </div>
                ))}
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
