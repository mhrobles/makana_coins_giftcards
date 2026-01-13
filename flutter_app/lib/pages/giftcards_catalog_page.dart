import 'package:flutter/material.dart';
import '../ui/widgets.dart';
import '../services/params.dart';
import '../models/giftcards.dart';
import 'giftcards_confirm_page.dart';

class GiftcardsCatalogPage extends StatefulWidget {
  const GiftcardsCatalogPage({super.key});
  @override
  State<GiftcardsCatalogPage> createState() => _GiftcardsCatalogPageState();
}

class _GiftcardsCatalogPageState extends State<GiftcardsCatalogPage> {
  int _balance = 0;
  List<GiftcardCatalogStore> _stores = const [];

  @override
  void initState() {
    super.initState();
    getCoinsInfo().then((info) => setState(() => _balance = info.balance));
    getGiftcardCatalog().then((stores) => setState(() => _stores = stores));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Giftcards')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Saldo: $_balance coins', style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 12),
          for (final s in _stores)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: mkCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    for (final d in s.denominations)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Text('\$${d.amountCLP.toString()}', style: const TextStyle(fontWeight: FontWeight.w700)),
                              const SizedBox(width: 6),
                              Text('(${d.costCoins} coins)', style: const TextStyle(color: Colors.black54)),
                            ]),
                            _balance >= d.costCoins
                              ? FilledButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => GiftcardsConfirmPage(
                                        storeId: s.id,
                                        storeName: s.name,
                                        amountCLP: d.amountCLP,
                                        costCoins: d.costCoins,
                                      ),
                                    ),
                                  ),
                                  child: const Text('Elegir'),
                                )
                              : const Text('Saldo insuficiente', style: TextStyle(color: Colors.black54)),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Volver'),
          )
        ],
      ),
    );
  }
}
