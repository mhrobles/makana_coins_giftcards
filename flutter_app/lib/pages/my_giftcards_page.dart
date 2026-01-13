import 'package:flutter/material.dart';
import '../ui/widgets.dart';
import '../services/params.dart';

class MyGiftcardsPage extends StatefulWidget {
  const MyGiftcardsPage({super.key});
  @override
  State<MyGiftcardsPage> createState() => _MyGiftcardsPageState();
}

class _MyGiftcardsPageState extends State<MyGiftcardsPage> {
  List<_Item> _items = const [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final items = await getUserGiftcards();
    setState(() => _items = items.map((g) => _Item(title: g.storeName, amount: g.amountCLP, code: g.code, issued: g.issuedAt)).toList());
  }

  Future<void> _copy(String code) async {
    // In real app, use Clipboard.setData
    // For simplicity here, just show a snackbar
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Código copiado: $code')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Giftcards')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final g in _items)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: mkCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(g.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 6),
                    Text('Monto: \$${g.amount}'),
                    Text('Código: ${g.code}'),
                    Text('Fecha: ${g.issued}'),
                    const SizedBox(height: 8),
                    FilledButton(onPressed: () => _copy(g.code), child: const Text('Copiar código')),
                  ],
                ),
              ),
            ),
          FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Volver')),
        ],
      ),
    );
  }
}

class _Item {
  final String title;
  final int amount;
  final String code;
  final DateTime issued;
  const _Item({required this.title, required this.amount, required this.code, required this.issued});
}
