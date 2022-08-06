import 'package:flutter/material.dart';
import 'package:front_flutter/pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lottery DEMO',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.purpleAccent,
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
     ),
      routes: {
        '/': (context) => const HomePage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}