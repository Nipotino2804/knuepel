import 'package:flutter/material.dart';
import 'package:kniffel/main.dart';
import 'package:kniffel/pages/information.dart';
import 'package:kniffel/pages/play.dart';

class Startpage extends StatelessWidget {
  const Startpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: FloatingActionButton(
                tooltip: 'Spiel starten',
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Playpage())),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 35,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: FloatingActionButton(
                tooltip: 'Information',
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const InforamtionPage()))),
                child: const Icon(Icons.help),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //appBar: costomAppbar(text: title),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              /*const Spacer(
                flex: 3,
              ),*/
              Text(
                'Willkommen in der Knüppel App!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              /*const Spacer(
                flex: 1,
              ),
              const Text(
                'Anzahl der Spieler:',
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                  onChanged: (value) {
                    player = int.parse(value);
                  },
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                ),
              ),
              const Spacer(
                flex: 2,
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
