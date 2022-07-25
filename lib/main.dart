import 'package:flutter/material.dart';
import 'package:places/gen/fonts.gen.dart';

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
        primarySwatch: Colors.blue,
      ),
      // home: const MyFirstWidget(title: 'Main page title'),
      home: const MyHomePage(title: 'My home page'),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  final String title;

  const MyFirstWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // title
      ),
      body: Center(
        child: Text(
          'Hello! Title - $title', // title
          style: const TextStyle(
            fontFamily: FontFamily.roboto,
          ),
        ),
      ),
    );
  }

  // void showContext() {
  // debugPrint('context: ${context.runtimeType}'); // context not found
  // }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    showContext(); // it's worked

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void showContext() {
    debugPrint('context: ${context.runtimeType}');
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
