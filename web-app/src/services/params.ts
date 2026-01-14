import type { CoinsInfo, GiftcardCatalogStore, GiftcardItem } from '../types/giftcards';

// Import JSON params from workspace-level folder (bundled at build time)
import coinsJson from '../../../params/coins.json';
import catalogJson from '../../../params/giftcards_catalog.json';
import userGiftcardsJson from '../../../params/user_giftcards.json';

const COINS_KEY = 'mk_coins_balance';

export const getCoinsInfo = (): CoinsInfo => {
  // Si hay un balance en localStorage, úsalo; si no, usa el del JSON
  const stored = localStorage.getItem(COINS_KEY);
  const balance = stored !== null ? Number(stored) : (coinsJson as CoinsInfo).balance;
  return {
    balance,
    explanation: (coinsJson as CoinsInfo).explanation,
  };
};
export const getGiftcardCatalog = (): GiftcardCatalogStore[] => (catalogJson as { stores: GiftcardCatalogStore[] }).stores;

// Merge static JSON with local confirmed exchanges for demo purposes
const EXTRA_KEY = 'mk_extra_giftcards';

export const getUserGiftcards = (): GiftcardItem[] => {
  const extras: GiftcardItem[] = JSON.parse(localStorage.getItem(EXTRA_KEY) || '[]');
  return [...(userGiftcardsJson as GiftcardItem[]), ...extras].sort((a,b) => new Date(b.issuedAt).getTime() - new Date(a.issuedAt).getTime());
};

export const appendGiftcardLocal = (item: GiftcardItem, costCoins?: number) => {
  const extras: GiftcardItem[] = JSON.parse(localStorage.getItem(EXTRA_KEY) || '[]');
  const next = [item, ...extras];
  localStorage.setItem(EXTRA_KEY, JSON.stringify(next));
  // Si se pasa costCoins, descuéntalo del balance
  if (typeof costCoins === 'number' && !isNaN(costCoins)) {
    const current = getCoinsInfo().balance;
    const updated = Math.max(0, current - costCoins);
    localStorage.setItem(COINS_KEY, String(updated));
  }
};
