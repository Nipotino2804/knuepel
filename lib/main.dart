import 'package:flutter/material.dart';
import 'package:kniffel/functions.dart';
import 'package:kniffel/pages/start.dart';
import 'package:kniffel/variables.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      themeMode: currentThemeMode,
      title: title,
      home: const Startpage(),
    );
  }
}
