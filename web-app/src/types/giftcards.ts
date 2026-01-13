export type GiftcardDenomination = {
  amountCLP: number;
  costCoins: number;
};

export type GiftcardCatalogStore = {
  id: string;
  name: string;
  denominations: GiftcardDenomination[];
};

export type GiftcardItem = {
  storeId: string;
  storeName: string;
  amountCLP: number;
  code: string;
  issuedAt: string; // ISO
};

export type CoinsInfo = {
  balance: number;
  explanation: string;
};
