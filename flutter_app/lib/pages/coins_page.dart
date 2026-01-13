import 'package:flutter/material.dart';
import '../ui/widgets.dart';
import '../services/params.dart';
import 'giftcards_catalog_page.dart';
import 'my_giftcards_page.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});
  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  int _balance = 0;
  String _explanation = '';

  @override
  void initState() {
    super.initState();
    getCoinsInfo().then((info) => setState(() { _balance = info.balance; _explanation = info.explanation; }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Makana Coins')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          mkCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Saldo disponible', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Text('$_balance coins', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                Text(_explanation, style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 12),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  FilledButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GiftcardsCatalogPage())),
                    child: const Text('Canjear coins'),
                  ),
                  FilledButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MyGiftcardsPage())),
                    child: const Text('Mis giftcards'),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
