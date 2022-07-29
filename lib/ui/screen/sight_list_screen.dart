import 'package:flutter/material.dart';
import 'package:places/gen/colors.gen.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';

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

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 112.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const TextWithStyle(),
      ),
      body: const SingleChildScrollView(
        child: SightCards(),
      ),
    );
  }
}

class SightCards extends StatelessWidget {
  const SightCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: _buildMyWidget,
    );
  }

  Widget _buildMyWidget(BuildContext _) {
    return Column(
      children: mocks
          .map(
            (item) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SightCard(item: item),
            ),
          )
          .toList(),
    );
  }
}
