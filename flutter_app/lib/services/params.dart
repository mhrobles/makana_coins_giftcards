const _coinsKey = 'mk_coins_balance';
// Modificado: getCoinsInfo ahora usa SharedPreferences para el balance
Future<CoinsInfo> getCoinsInfo() async {
  final prefs = await SharedPreferences.getInstance();
  final stored = prefs.getInt(_coinsKey);
  Map<String, dynamic> map;
  if (stored != null) {
    final fallback = jsonDecode(_coinsJson) as Map<String, dynamic>;
    map = {
      'balance': stored,
      'explanation': fallback['explanation'],
    };
  } else {
    try {
      if (kIsWeb) {
        map = jsonDecode(_coinsJson) as Map<String, dynamic>;
      } else {
        final file = File(p.join(_paramsDir(), 'coins.json'));
        final contents = await file.readAsString();
        map = jsonDecode(contents) as Map<String, dynamic>;
      }
    } catch (_) {
      map = jsonDecode(_coinsJson) as Map<String, dynamic>;
    }
    await prefs.setInt(_coinsKey, map['balance'] as int);
  }
  return CoinsInfo.fromJson(map);
}
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/giftcards.dart';

String _paramsDir() {
  // Assume app runs from flutter_app directory; params is at ../params
  final cwd = Directory.current.path;
  return p.normalize(p.join(cwd, '../params'));
}

Future<CoinsInfo> getCoinsInfo() async {
  try {
    Map<String, dynamic> map;
    if (kIsWeb) {
      map = jsonDecode(_coinsJson) as Map<String, dynamic>;
    } else {
      final file = File(p.join(_paramsDir(), 'coins.json'));
      final contents = await file.readAsString();
      map = jsonDecode(contents) as Map<String, dynamic>;
    }
    return CoinsInfo.fromJson(map);
  } catch (_) {
    return CoinsInfo.fromJson(jsonDecode(_coinsJson) as Map<String, dynamic>);
  }
}

Future<List<GiftcardCatalogStore>> getGiftcardCatalog() async {
  try {
    Map<String, dynamic> map;
    if (kIsWeb) {
      map = jsonDecode(_catalogJson) as Map<String, dynamic>;
    } else {
      final file = File(p.join(_paramsDir(), 'giftcards_catalog.json'));
      final contents = await file.readAsString();
      map = jsonDecode(contents) as Map<String, dynamic>;
    }
    final stores = (map['stores'] as List).map((e) => GiftcardCatalogStore.fromJson(e as Map<String, dynamic>)).toList();
    return stores;
  } catch (_) {
    final map = jsonDecode(_catalogJson) as Map<String, dynamic>;
    return (map['stores'] as List).map((e) => GiftcardCatalogStore.fromJson(e as Map<String, dynamic>)).toList();
  }
}

Future<List<GiftcardItem>> _getInitialUserGiftcards() async {
  try {
    List list;
    if (kIsWeb) {
      list = jsonDecode(_userGiftcardsJson) as List;
    } else {
      final file = File(p.join(_paramsDir(), 'user_giftcards.json'));
      final contents = await file.readAsString();
      list = jsonDecode(contents) as List;
    }
    return list.map((e) => GiftcardItem.fromJson(e as Map<String, dynamic>)).toList();
  } catch (_) {
    final list = jsonDecode(_userGiftcardsJson) as List;
    return list.map((e) => GiftcardItem.fromJson(e as Map<String, dynamic>)).toList();
  }
}

const _extraKey = 'mk_extra_giftcards';

Future<List<GiftcardItem>> getUserGiftcards() async {
  final base = await _getInitialUserGiftcards();
  final prefs = await SharedPreferences.getInstance();
  final extras = prefs.getStringList(_extraKey) ?? [];
  final extraItems = extras.map((s) => GiftcardItem.fromJson(jsonDecode(s) as Map<String, dynamic>));
  final all = [...base, ...extraItems];
  all.sort((a, b) => b.issuedAt.compareTo(a.issuedAt));
  return all;
}

Future<void> appendGiftcardLocal(GiftcardItem item, {int? costCoins}) async {
  final prefs = await SharedPreferences.getInstance();
  final extras = prefs.getStringList(_extraKey) ?? [];
  extras.insert(0, jsonEncode(item.toJson()));
  await prefs.setStringList(_extraKey, extras);
  // Si se pasa costCoins, descuéntalo del balance
  if (costCoins != null && costCoins > 0) {
    final current = prefs.getInt(_coinsKey) ?? 600;
    final updated = (current - costCoins).clamp(0, 1000000);
    await prefs.setInt(_coinsKey, updated);
  }
}

// Web fallbacks (mirror of params JSON)
const _coinsJson = '{"balance":600,"explanation":"Tus Makana Coins se generan por cumplimiento y participación. Puedes canjearlos por giftcards de tiendas asociadas."}';

const _catalogJson = '{"stores":[{"id":"unimarc","name":"Unimarc","denominations":[{"amountCLP":5000,"costCoins":50},{"amountCLP":10000,"costCoins":100},{"amountCLP":20000,"costCoins":200}]},{"id":"paris","name":"Paris","denominations":[{"amountCLP":5000,"costCoins":55},{"amountCLP":10000,"costCoins":110},{"amountCLP":20000,"costCoins":220}]},{"id":"falabella","name":"Falabella","denominations":[{"amountCLP":5000,"costCoins":60},{"amountCLP":10000,"costCoins":120},{"amountCLP":20000,"costCoins":240}]},{"id":"hugoboss","name":"Hugo Boss","denominations":[{"amountCLP":10000,"costCoins":140},{"amountCLP":20000,"costCoins":260},{"amountCLP":50000,"costCoins":600}]}]}';

const _userGiftcardsJson = '[{"storeId":"unimarc","storeName":"Unimarc","amountCLP":5000,"code":"UNI-5K-ABCD1234","issuedAt":"2025-12-01T10:00:00.000Z"},{"storeId":"falabella","storeName":"Falabella","amountCLP":10000,"code":"FALA-10K-XYZ9876","issuedAt":"2025-12-18T15:30:00.000Z"}]';
