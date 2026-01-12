import 'package:flutter/material.dart';

// Functional, reusable UI builders
Widget mkCard({required Widget child, Gradient? gradient}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: gradient == null ? Colors.white : null,
      gradient: gradient,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Color(0x14000000),
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
      border: Border.all(color: const Color(0xFFE5E7EB)),
    ),
    child: child,
  );
}

Widget mkBanner(String text) => mkCard(
  gradient: const LinearGradient(
    colors: [Color(0xFF1560FF), Color(0xFF36A0FF)],
  ),
  child: Text(
    text,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  ),
);

Widget mkRoutineCard(String title) => mkCard(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 8),
      const Text(
        'Sesión de 15 minutos',
        style: TextStyle(color: Colors.black54),
      ),
      const SizedBox(height: 12),
      const FilledButton(onPressed: null, child: Text('Empezar')),
    ],
  ),
);

Widget mkPrimaryButton(String label) =>
    FilledButton(onPressed: () {}, child: Text(label));

Widget mkLeaderItem({
  required String left,
  required String name,
  required int points,
}) => Padding(
  padding: const EdgeInsets.symmetric(vertical: 8),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Text(left),
          const SizedBox(width: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
      Row(
        children: [
          Text('$points', style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(width: 4),
          const Text('pts', style: TextStyle(color: Colors.black54)),
        ],
      ),
    ],
  ),
);

Widget mkStatTile(String title, String value) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(title, style: const TextStyle(color: Colors.black54)),
    const SizedBox(height: 4),
    Text(
      value,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    ),
  ],
);

Widget mkBadge(String text) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  decoration: BoxDecoration(
    color: const Color(0xFFF3F6FB),
    border: Border.all(color: const Color(0xFFE5E7EB)),
    borderRadius: BorderRadius.circular(999),
  ),
  child: Text(text),
);
