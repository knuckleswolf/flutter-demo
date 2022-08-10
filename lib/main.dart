import 'package:flutter/material.dart';
import 'package:places/gen/fonts.gen.dart';
import 'package:places/ui/res/constants/strings.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.title,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blueGrey,
        fontFamily: FontFamily.roboto,
      ),
      home: const SafeArea(
        child: SightListScreen(),
        // child: SightDetails(item: mocks[0]), // or SightListScreen()
      ),
    );
  }
}
