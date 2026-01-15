import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import '../models/user_profile.dart';

const _userProfileJson = '{"id":"19638444-8","name":"Carlos","email":"carlos@email.com","phone":"+56991712991","weightKg":65.0,"heightM":1.75,"gender":"Masculino","joinedAt":"2025-01-10T12:00:00Z","weeklyCompliancePct":66,"zonesTreated":7,"totalMinutes":51,"points":38,"rankingPosition":10}';

String _paramsDir() {
  final cwd = Directory.current.path;
  return p.normalize(p.join(cwd, '../params'));
}

Future<UserProfile> getUserProfile() async {
  try {
    Map<String, dynamic> map;
    if (kIsWeb) {
      map = jsonDecode(_userProfileJson) as Map<String, dynamic>;
    } else {
      final file = File(p.join(_paramsDir(), 'user_profile.json'));
      final contents = await file.readAsString();
      map = jsonDecode(contents) as Map<String, dynamic>;
    }
    return UserProfile.fromJson(map);
  } catch (_) {
    return UserProfile.fromJson(jsonDecode(_userProfileJson) as Map<String, dynamic>);
  }
}
