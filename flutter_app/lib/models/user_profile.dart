class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phone;
  final double weightKg;
  final double heightM;
  final String gender;
  final DateTime joinedAt;
  final int weeklyCompliancePct;
  final int zonesTreated;
  final int totalMinutes;
  final int points;
  final int rankingPosition;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.weightKg,
    required this.heightM,
    required this.gender,
    required this.joinedAt,
    required this.weeklyCompliancePct,
    required this.zonesTreated,
    required this.totalMinutes,
    required this.points,
    required this.rankingPosition,
  });

  factory UserProfile.fromJson(Map<String, dynamic> j) => UserProfile(
    id: j['id'] as String,
    name: j['name'] as String,
    email: j['email'] as String,
    phone: j['phone'] as String,
    weightKg: (j['weightKg'] as num).toDouble(),
    heightM: (j['heightM'] as num).toDouble(),
    gender: j['gender'] as String,
    joinedAt: DateTime.parse(j['joinedAt'] as String),
    weeklyCompliancePct: j['weeklyCompliancePct'] as int,
    zonesTreated: j['zonesTreated'] as int,
    totalMinutes: j['totalMinutes'] as int,
    points: j['points'] as int,
    rankingPosition: j['rankingPosition'] as int,
  );
}
