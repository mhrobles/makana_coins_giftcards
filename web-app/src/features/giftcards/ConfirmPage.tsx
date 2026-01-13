import Section from '../../components/ui/Section';
import Card from '../../components/ui/Card';
import { Title, Subtitle } from '../../components/ui/Title';
import Button from '../../components/ui/Button';
import { useMemo, useState } from 'react';
import { useSearchParams, Link, useNavigate } from 'react-router-dom';
import { appendGiftcardLocal, getCoinsInfo } from '../../services/params';

export default function ConfirmPage(){
  const [sp] = useSearchParams();
  const nav = useNavigate();
  const info = getCoinsInfo();

  const sel = useMemo(() => ({
    storeId: sp.get('store') || '',
    storeName: sp.get('name') || '',
    amountCLP: Number(sp.get('amount') || 0),
    costCoins: Number(sp.get('coins') || 0),
  }), [sp]);

  const [confirmed, setConfirmed] = useState(false);

  const confirm = () => {
    appendGiftcardLocal({
      storeId: sel.storeId,
      storeName: sel.storeName,
      amountCLP: sel.amountCLP,
      code: `${sel.storeId.toUpperCase()}-${sel.amountCLP}-` + Math.random().toString(36).slice(2,10).toUpperCase(),
      issuedAt: new Date().toISOString(),
    });
    setConfirmed(true);
  };

  const canAfford = info.balance >= sel.costCoins;

  return (
    <main className="main">
      <Section>
        <Title>Confirmación de Canje</Title>
        <Card>
          <Subtitle>Resumen</Subtitle>
          <div style={{display:'grid', gap:8}}>
            <div><strong>Tienda:</strong> {sel.storeName}</div>
            <div><strong>Monto:</strong> ${sel.amountCLP.toLocaleString('es-CL')}</div>
            <div><strong>Costo:</strong> {sel.costCoins} coins</div>
            <div><strong>Saldo actual:</strong> {info.balance} coins</div>
          </div>
          {!confirmed ? (
            <div style={{display:'flex', gap:12, marginTop:12, flexWrap:'wrap'}}>
              {canAfford ? <Button onClick={confirm}>Confirmar canje</Button> : <span className="muted">Saldo insuficiente</span>}
              <Link to="/giftcards/catalog"><Button>Volver al catálogo</Button></Link>
            </div>
          ) : (
            <div style={{marginTop:12}}>
              <div className="banner">¡Canje confirmado!</div>
              <div style={{display:'flex', gap:12, marginTop:12, flexWrap:'wrap'}}>
                <Button onClick={() => nav('/giftcards/mine')}>Ver mis giftcards</Button>
                <Link to="/coins"><Button>Ir a Coins</Button></Link>
              </div>
            </div>
          )}
        </Card>
      </Section>
    </main>
  );
}
