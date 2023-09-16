import 'package:flutter/material.dart';
import 'package:kniffel/functions.dart';
import 'package:kniffel/pages/information.dart';
import 'package:kniffel/variables.dart';

class Startpage extends StatefulWidget {
  const Startpage({super.key});

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
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
                    MaterialPageRoute(builder: (context) => modes[mode])),
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
            children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                'Willkommen in der Knüppel App!',
                style: TextStyle(
                    color: textColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                'Modus',
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Standart',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Switch(
                        trackOutlineColor:
                            const MaterialStatePropertyAll(Colors.black87),
                        trackOutlineWidth: const MaterialStatePropertyAll(1.5),
                        activeColor: Colors.grey.shade700,
                        activeTrackColor: Colors.deepPurple.shade100,
                        inactiveThumbColor: Colors.grey.shade700,
                        inactiveTrackColor: Colors.deepPurple.shade100,
                        value: modeValue,
                        onChanged: (value) => setState(() {
                          switchMode(value);
                        }),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Erweitert',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  )),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
