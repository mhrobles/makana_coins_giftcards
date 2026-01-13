import type { CoinsInfo, GiftcardCatalogStore, GiftcardItem } from '../types/giftcards';

// Import JSON params from workspace-level folder (bundled at build time)
import coinsJson from '../../../params/coins.json';
import catalogJson from '../../../params/giftcards_catalog.json';
import userGiftcardsJson from '../../../params/user_giftcards.json';

export const getCoinsInfo = (): CoinsInfo => coinsJson as CoinsInfo;
export const getGiftcardCatalog = (): GiftcardCatalogStore[] => (catalogJson as { stores: GiftcardCatalogStore[] }).stores;

// Merge static JSON with local confirmed exchanges for demo purposes
const EXTRA_KEY = 'mk_extra_giftcards';

export const getUserGiftcards = (): GiftcardItem[] => {
  const extras: GiftcardItem[] = JSON.parse(localStorage.getItem(EXTRA_KEY) || '[]');
  return [...(userGiftcardsJson as GiftcardItem[]), ...extras].sort((a,b) => new Date(b.issuedAt).getTime() - new Date(a.issuedAt).getTime());
};

export const appendGiftcardLocal = (item: GiftcardItem) => {
  const extras: GiftcardItem[] = JSON.parse(localStorage.getItem(EXTRA_KEY) || '[]');
  const next = [item, ...extras];
  localStorage.setItem(EXTRA_KEY, JSON.stringify(next));
};
