import 'package:flutter/material.dart';
import 'package:places/gen/fonts.gen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        fontFamily: FontFamily.roboto,
      ),
      home: const SafeArea(
        child: SightListScreen(),
      ),
    );
  }
}
