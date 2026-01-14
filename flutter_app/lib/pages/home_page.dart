import 'package:flutter/material.dart';
import '../ui/widgets.dart';
import 'coins_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hola Carlos',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          mkBanner('Revisa el desafío de este mes!'),
          const SizedBox(height: 24),
          const Text(
            'Rutinas pensadas para ti',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(child: _RoutineTile('Alivia tus\nTOBILLOS / PIES')),
              SizedBox(width: 12),
              Expanded(child: _RoutineTile('Alivia tu\nESPALDA BAJA')),
            ],
          ),
          const SizedBox(height: 24),
          mkCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Prueba algo diferente',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    mkPrimaryButton('Molestias'),
                    mkPrimaryButton('Tensión'),
                    mkPrimaryButton('Hinchazón'),
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

class _RoutineTile extends StatelessWidget {
  const _RoutineTile(this.title);
  final String title;
  @override
  Widget build(BuildContext context) => mkRoutineCard(title);
}
