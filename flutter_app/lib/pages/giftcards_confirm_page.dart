import 'package:flutter/material.dart';
import '../ui/widgets.dart';
import '../services/params.dart';
import '../models/giftcards.dart';
import 'my_giftcards_page.dart';

class GiftcardsConfirmPage extends StatefulWidget {
  const GiftcardsConfirmPage({super.key, required this.storeId, required this.storeName, required this.amountCLP, required this.costCoins});
  final String storeId;
  final String storeName;
  final int amountCLP;
  final int costCoins;
  @override
  State<GiftcardsConfirmPage> createState() => _GiftcardsConfirmPageState();
}

class _GiftcardsConfirmPageState extends State<GiftcardsConfirmPage> {
  int _balance = 0;
  bool _confirmed = false;

  @override
  void initState() {
    super.initState();
    getCoinsInfo().then((info) => setState(() => _balance = info.balance));
  }

  Future<void> _confirm() async {
    final item = GiftcardItem(
      storeId: widget.storeId,
      storeName: widget.storeName,
      amountCLP: widget.amountCLP,
      code: '${widget.storeId.toUpperCase()}-${widget.amountCLP}-${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}',
      issuedAt: DateTime.now(),
    );
    await appendGiftcardLocal(item);
    setState(() => _confirmed = true);
  }

  @override
  Widget build(BuildContext context) {
    final canAfford = _balance >= widget.costCoins;
    return Scaffold(
      appBar: AppBar(title: const Text('Confirmación de Canje')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          mkCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Resumen', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Text('Tienda: ${widget.storeName}'),
                Text('Monto: \$${widget.amountCLP}'),
                Text('Costo: ${widget.costCoins} coins'),
                Text('Saldo actual: $_balance coins'),
                const SizedBox(height: 12),
                if (!_confirmed) ...[
                  if (canAfford)
                    FilledButton(onPressed: _confirm, child: const Text('Confirmar canje'))
                  else
                    const Text('Saldo insuficiente', style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 8),
                  FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Volver al catálogo')),
                ] else ...[
                  mkBanner('¡Canje confirmado!'),
                  const SizedBox(height: 12),
                  Wrap(spacing: 8, children: [
                    FilledButton(
                      onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MyGiftcardsPage())),
                      child: const Text('Ver mis giftcards'),
                    ),
                    FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Volver')),
                  ]),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
