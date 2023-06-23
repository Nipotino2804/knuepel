import 'package:flutter/material.dart';
import 'package:kniffel/pages/start.dart';
import 'package:kniffel/variables.dart';

void main() {
  runApp(const MyApp());
}

class LoadScreen extends StatelessWidget {
  const LoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
          body: ColoredBox(
        color: const Color.fromARGB(41, 171, 226, 255),
        child: Center(
          child: Image.asset(
            "assets/logo.png",
            width: MediaQuery.of(context).size.width * 0.45,
          ),
        ),
      )),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColorDark: Colors.deepPurple.shade200,
          primaryColorLight: Colors.deepPurple.shade200,
          useMaterial3: true),
      themeMode: currentThemeMode,
      title: title,
      home: const Startpage(),
    );
  }
}
