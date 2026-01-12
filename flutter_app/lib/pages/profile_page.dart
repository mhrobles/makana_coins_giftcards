import 'package:flutter/material.dart';
import '../ui/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mkCard(
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: const [
                _Stat('Cumplimiento semanal', '66%'),
                _Stat('Zonas tratadas', '7'),
                _Stat('Tiempo total', '51m'),
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
                  children: const [
                    _BadgeText('19638444-8'),
                    _BadgeText('+56991712991'),
                    _BadgeText('65.0 kg'),
                    _BadgeText('1.75 m'),
                    _BadgeText('Masculino'),
                  ],
                ),
              ],
            ),
          ),
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
