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
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(128.0),
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 40.0,
            bottom: 16.0,
          ),
          child: TextWithStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: _SightCards(),
      ),
    );
  }
}

class _SightCards extends StatelessWidget {
  const _SightCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      child: Wrap(
        runSpacing: 16,
        children: mocks
            .map(
              (item) => SightCard(item: item),
            )
            .toList(),
      ),
    );
  }
}
