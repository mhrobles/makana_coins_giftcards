import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/ranking_page.dart';
import 'pages/profile_page.dart';

class MakanaShell extends StatefulWidget {
  const MakanaShell({super.key});
  @override
  State<MakanaShell> createState() => _MakanaShellState();
}

class _MakanaShellState extends State<MakanaShell> {
  int _index = 0;
  final _pages = const [HomePage(), RankingPage(), ProfilePage()];
  final _titles = const ['Inicio', 'Ranking', 'Mi Perfil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_index])),
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events_outlined),
            label: 'Ranking',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
