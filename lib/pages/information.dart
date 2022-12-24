import 'package:flutter/material.dart';

import '../widgets.dart';

class InforamtionPage extends StatelessWidget {
  const InforamtionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: costomAppbar(text: 'Informationen'),
      body: const Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Text(
            '''Um ein Feld zu streichen muss man Null eingeben oder doppelt auf das Feld drauf tippen.
                
                Um alle Ergebnisse zurück zu setzten kann man unten auf den blauen Button tippen. 
                
                Um herauszufinden wofür ein Button ist kann man denn Button gedrückt halten und einen Information wird angezeigt.''',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
