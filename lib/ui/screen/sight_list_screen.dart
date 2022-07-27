import 'package:flutter/material.dart';
import 'package:places/gen/colors.gen.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({super.key});

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class TextSettings {
  static const TextStyle style = TextStyle(
    height: 1.125,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: ColorName.main,
  );

  static const String title = 'Список \nинтересных мест';
}

class TextWithStyle extends StatelessWidget {
  const TextWithStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      TextSettings.title,
      style: TextSettings.style,
      textAlign: TextAlign.start,
    );
  }
}

class RichTextWithStyle extends StatelessWidget {
  const RichTextWithStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextSettings.style,
        children: [
          TextSpan(
            text: 'С',
            style: TextStyle(
              color: ColorName.green,
            ),
          ),
          TextSpan(
            text: 'писок \n',
          ),
          TextSpan(
            text: 'и',
            style: TextStyle(
              color: ColorName.yellow,
            ),
          ),
          TextSpan(
            text: 'нтересных мест',
          ),
        ],
      ),
    );
  }
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 112.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const TextWithStyle(), // or const RichTextWithStyle()
      ),
    );
  }
}
