import 'package:flutter/material.dart';
import 'package:kniffel/pages/start.dart';
import 'package:kniffel/variables.dart';
import 'package:kniffel/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: const Startpage(),
    );
  }
}
