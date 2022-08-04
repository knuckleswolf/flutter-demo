import 'package:flutter/material.dart';
import 'package:places/gen/colors.gen.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/constants/strings.dart';
import 'package:places/ui/res/constants/typography.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({super.key});

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class TextWithStyle extends StatelessWidget {
  const TextWithStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      SightListScreenStrings.title,
      style: AppTypography.largeTitle.copyWith(
        color: ColorName.secondary,
      ),
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
        child: _SightCards(),
      ),
    );
  }
}

class _SightCards extends StatelessWidget {
  const _SightCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: mocks
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: SightCard(item: item),
            ),
          )
          .toList(),
    );
  }
}
