import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({super.key});

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class TextSettings {
  static const TextStyle style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );

  static const String title = 'Список интересных мест';
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Text(
          TextSettings.title,
          style: TextSettings.style,
        ),
      ),
    );
  }
}
