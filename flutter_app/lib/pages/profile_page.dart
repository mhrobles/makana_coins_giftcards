import 'package:flutter/material.dart';
import '../ui/widgets.dart';
import 'coins_page.dart';
import '../services/user_profile.dart';
import '../models/user_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserProfile? user;

  @override
  void initState() {
    super.initState();
    getUserProfile().then((u) => setState(() => user = u));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilledButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CoinsPage()),
            ),
            child: const Text('Mis Coins'),
          ),
          const SizedBox(height: 12),
          if (user != null) ...[
            mkCard(
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _Stat('Cumplimiento semanal', '${user!.weeklyCompliancePct}%'),
                  _Stat('Zonas tratadas', '${user!.zonesTreated}'),
                  _Stat('Tiempo total', '${user!.totalMinutes}m'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            mkCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Información Personal',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _BadgeText(user!.id),
                      _BadgeText(user!.phone),
                      _BadgeText('${user!.weightKg.toStringAsFixed(1)} kg'),
                      _BadgeText('${user!.heightM.toStringAsFixed(2)} m'),
                      _BadgeText(user!.gender),
                    ],
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 12),
          mkCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Tu PLAN',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                Text(
                  'No has reportado molestias considerables, por lo que te recomendamos pasar por el servicio 2 veces por semana para PREVENIR molestias en el futuro. RECUERDA que tu cuerpo es tu principal herramienta de trabajo!',
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _BadgeText('MUÑECA / MANO'),
                    _BadgeText('PIERNAS / GLÚTEOS'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat(this.title, this.value);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) => mkStatTile(title, value);
}

class _BadgeText extends StatelessWidget {
  const _BadgeText(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => mkBadge(text);
}
