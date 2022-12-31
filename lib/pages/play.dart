import 'package:flutter/material.dart';
import 'package:kniffel/functions.dart';
import 'package:kniffel/textfielcontroller.dart';
import 'package:kniffel/variables.dart';
import 'package:kniffel/widgets.dart';

class Playpage extends StatefulWidget {
  const Playpage({super.key});

  @override
  State<Playpage> createState() => _PlaypageState();
}

class _PlaypageState extends State<Playpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        floatingActionButton: FloatingActionButton(
            tooltip: 'Zurücksetzten',
            child: const Icon(Icons.restart_alt),
            onPressed: () {
              setState(() {
                resetQuest(context);
                calculate();
              });
            }),
        // appBar: costomAppbar(text: 'Knüppel'),
        body: ListView.builder(
            itemCount: player,
            itemBuilder: (context, index) {
              return Column(children: [
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border:
                        TableBorder.all(color: tableBorderColor, width: 1.5),
                    children: [
                      costomTableRowDices(
                          picture: dice1picture,
                          controller: controllerDice1,
                          content: 'nur Einsen\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              checkEmpty(
                                  number: 1, input: value, context: context);
                            });
                          }),
                      costomTableRowDices(
                          controller: controllerDice2,
                          picture: dice2picture,
                          content: 'nur Zweier\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              checkEmpty(
                                  number: 2, input: value, context: context);
                            });
                          }),
                      costomTableRowDices(
                          controller: controllerDice3,
                          picture: dice3picture,
                          content: 'nur Dreier\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              checkEmpty(
                                  number: 3, input: value, context: context);
                            });
                          }),
                      costomTableRowDices(
                          controller: controllerDice4,
                          picture: dice4picture,
                          content: 'nur Vierer\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              checkEmpty(
                                  number: 4, input: value, context: context);
                            });
                          }),
                      costomTableRowDices(
                          controller: controllerDice5,
                          picture: dice5picture,
                          content: 'nur Fünfer\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              checkEmpty(
                                  number: 5, input: value, context: context);
                            });
                          }),
                      costomTableRowDices(
                          controller: controllerDice6,
                          picture: dice6picture,
                          content: 'nur Sechser\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              checkEmpty(
                                  number: 6, input: value, context: context);
                            });
                          }),
                      costomTableRowSum(
                          content: 'Zwischen-\nsumme',
                          sum: zwSum,
                          contentMiddle: '='),
                      costomTableRowSum(
                          content: 'Bonus bei 63\noder mehr',
                          contentMiddle: '35 Punkte',
                          sum: bonus),
                      costomTableRowSum(
                          content: 'Summe\noberer Teil',
                          contentMiddle: '=',
                          sum: topSum)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border:
                        TableBorder.all(color: tableBorderColor, width: 1.5),
                    children: [
                      costomTableRowPasch(
                          controller: controllerThreePasch,
                          content: 'Dreierpasch',
                          contentMiddle: 'alle Augen\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              checkEmpty(
                                  number: 7, input: value, context: context);
                            });
                          }),
                      costomTableRowPasch(
                          controller: controllerFourPasch,
                          content: 'Viererpasch',
                          contentMiddle: 'alle Augen\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              checkEmpty(
                                  number: 8, input: value, context: context);
                            });
                          }),
                      costomTableRowSwitch(
                          content: 'Fullhouse',
                          contentMiddle: '25 Punkte',
                          color: colorFullhouse,
                          onDbTap: () {
                            setState(() {
                              canceldFullhouse = true;
                              fullhouse = false;
                              colorFullhouse = Colors.red;
                              calculate();
                            });
                          },
                          onTap: (value) {
                            setState(() {
                              if (fullhouse == false &&
                                  canceldFullhouse == false) {
                                fullhouse = true;
                              } else {
                                fullhouse = false;
                              }
                              calculate();
                            });
                          },
                          startValue: fullhouse),
                      costomTableRowSwitch(
                          content: 'kleine Straße',
                          contentMiddle: '30 Punkte',
                          color: colorSmallStreet,
                          onDbTap: () => setState(() {
                                canceldSmallStreet = true;
                                smallStreet = false;
                                colorSmallStreet = Colors.red;
                                calculate();
                              }),
                          onTap: (value) {
                            setState(() {
                              if (smallStreet == false &&
                                  canceldSmallStreet == false) {
                                smallStreet = true;
                              } else {
                                smallStreet = false;
                              }
                              calculate();
                            });
                          },
                          startValue: smallStreet),
                      costomTableRowSwitch(
                          content: 'große Straße',
                          color: colorBigStreet,
                          onDbTap: () {
                            setState(() {
                              canceldBigStreet = true;
                              bigStreet = false;
                              colorBigStreet = Colors.red;
                              calculate();
                            });
                          },
                          contentMiddle: '40 Punkte',
                          onTap: (value) {
                            setState(() {
                              if (bigStreet == false &&
                                  canceldBigStreet == false) {
                                bigStreet = true;
                              } else {
                                bigStreet = false;
                              }
                              calculate();
                            });
                          },
                          startValue: bigStreet),
                      costomTableRowSwitch(
                          content: 'Knüppel',
                          color: colorKniffel,
                          onDbTap: () {
                            setState(() {
                              canceldKniffel = true;
                              kniffel = false;
                              colorKniffel = Colors.red;
                              calculate();
                            });
                          },
                          contentMiddle: '50 Punkte',
                          onTap: (value) {
                            setState(() {
                              if (kniffel == false && canceldKniffel == false) {
                                kniffel = true;
                              } else {
                                kniffel = false;
                              }
                              calculate();
                            });
                          },
                          startValue: kniffel),
                      costomTableRowPasch(
                          controller: controlerChance,
                          content: 'Chance',
                          contentMiddle: 'alle Augen\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              chance = int.parse(value);
                              calculate();
                            });
                          }),
                      costomTableRowSum(
                          content: 'Summe\noberer Teil',
                          contentMiddle: '=',
                          sum: topSum),
                      costomTableRowSum(
                          content: 'Summe\nunterer Teil',
                          contentMiddle: '=',
                          sum: downSum),
                    ],
                  ),
                ),
                Column(
                  children: [
                    // Abstandshalter zu Oben
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Table(
                        border: TableBorder.all(
                            color: tableBorderColor, width: 1.5),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          costomTableRowSum(
                              content: 'Gesamt',
                              contentMiddle: '=',
                              sum: allSum)
                        ],
                      ),
                    ),
                    /* const Divider(
                      thickness: 1.5,
                      color: Colors.black,
                    ), */
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ]);
            }));
  }

  resetQuest(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  reset();
                  downSum = 0;
                  zwSum = 0;
                  allSum = 0;
                  topSum = 0;
                  Navigator.pop(context, 'Ja');
                });
              },
              child: const Text("Ja")),
          TextButton(
              onPressed: () => Navigator.pop(context, 'Nein'),
              child: const Text('Nein'))
        ],
        title: const Text('Zurücksetzten'),
        content: const Text(
            'Möchten sie ihre Ergebnise wirklick zurücksetzten? Das Zurücksetzten kann nicht rückgängig gemacht werden!'),
      ),
    );
  }
}
