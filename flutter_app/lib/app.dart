import 'package:flutter/material.dart';
import 'shell.dart';

class MakanaApp extends StatelessWidget {
  const MakanaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'makana',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E66FF)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MakanaShell(),
    );
  }
}
