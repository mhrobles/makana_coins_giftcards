import 'package:flutter/material.dart';
import '../models/leader_entry.dart';
import '../ui/widgets.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});
  static const List<LeaderEntry> top10 = [
    LeaderEntry('Usuario 1', 300),
    LeaderEntry('Usuario 2', 251),
    LeaderEntry('Usuario 3', 238),
    LeaderEntry('Usuario 4', 138),
    LeaderEntry('Usuario 5', 138),
    LeaderEntry('Usuario 6', 126),
    LeaderEntry('Usuario 7', 125),
    LeaderEntry('Usuario 8', 125),
    LeaderEntry('Usuario 9', 76),
    LeaderEntry('Usuario 10', 38),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        mkCard(
          gradient: const LinearGradient(
            colors: [Color(0xFF1560FF), Color(0xFF36A0FF)],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tu Posición', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 8),
              Text(
                '#10',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '38 pts',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Top 10',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        mkCard(
          child: Column(
            children: [
              for (var i = 0; i < top10.length; i++)
                mkLeaderItem(
                  left: i < 3 ? ['🥇', '🥈', '🥉'][i] : '#${i + 1}',
                  name: top10[i].name,
                  points: top10[i].points,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
