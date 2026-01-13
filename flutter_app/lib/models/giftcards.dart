class GiftcardDenomination {
  final int amountCLP;
  final int costCoins;
  const GiftcardDenomination(this.amountCLP, this.costCoins);
  factory GiftcardDenomination.fromJson(Map<String, dynamic> j) => GiftcardDenomination(j['amountCLP'] as int, j['costCoins'] as int);
}

class GiftcardCatalogStore {
  final String id;
  final String name;
  final List<GiftcardDenomination> denominations;
  const GiftcardCatalogStore(this.id, this.name, this.denominations);
  factory GiftcardCatalogStore.fromJson(Map<String, dynamic> j) => GiftcardCatalogStore(
    j['id'] as String,
    j['name'] as String,
    (j['denominations'] as List).map((e) => GiftcardDenomination.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

class GiftcardItem {
  final String storeId;
  final String storeName;
  final int amountCLP;
  final String code;
  final DateTime issuedAt;
  GiftcardItem({required this.storeId, required this.storeName, required this.amountCLP, required this.code, required this.issuedAt});
  factory GiftcardItem.fromJson(Map<String, dynamic> j) => GiftcardItem(
    storeId: j['storeId'] as String,
    storeName: j['storeName'] as String,
    amountCLP: j['amountCLP'] as int,
    code: j['code'] as String,
    issuedAt: DateTime.parse(j['issuedAt'] as String),
  );
  Map<String, dynamic> toJson() => {
    'storeId': storeId,
    'storeName': storeName,
    'amountCLP': amountCLP,
    'code': code,
    'issuedAt': issuedAt.toIso8601String(),
  };
}

class CoinsInfo {
  final int balance;
  final String explanation;
  const CoinsInfo(this.balance, this.explanation);
  factory CoinsInfo.fromJson(Map<String, dynamic> j) => CoinsInfo(j['balance'] as int, j['explanation'] as String);
}
