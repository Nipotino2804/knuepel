import 'package:flutter/material.dart';
import 'package:kniffel/main.dart';
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
        floatingActionButton: FloatingActionButton(
            tooltip: 'Zurücksetzten',
            child: const Icon(Icons.restart_alt),
            onPressed: () {
              setState(() {
                resetAll();
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
                    border: TableBorder.all(color: Colors.black, width: 1.5),
                    children: [
                      costomTableRowDices(
                          picture: 'assets/01.png',
                          content: 'nur Einsen\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              dice1 = int.parse(value);
                              calculate();
                            });
                          }),
                      costomTableRowDices(
                          picture: 'assets/02.png',
                          content: 'nur Zweier\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              dice2 = int.parse(value);
                              calculate();
                            });
                          }),
                      costomTableRowDices(
                          picture: 'assets/03.png',
                          content: 'nur Dreier\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              dice3 = int.parse(value);
                              calculate();
                            });
                          }),
                      costomTableRowDices(
                          picture: 'assets/04.png',
                          content: 'nur Vierer\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              dice4 = int.parse(value);
                              calculate();
                            });
                          }),
                      costomTableRowDices(
                          picture: 'assets/05.png',
                          content: 'nur Fünfer\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              dice5 = int.parse(value);
                              calculate();
                            });
                          }),
                      costomTableRowDices(
                          picture: 'assets/06.png',
                          content: 'nur Sechser\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              dice6 = int.parse(value);
                              calculate();
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
                    border: TableBorder.all(color: Colors.black, width: 1.5),
                    children: [
                      costomTableRowPasch(
                          content: 'Dreierpasch',
                          contentMiddle: 'alle Augen\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              treepasch = int.parse(value);
                              calculate();
                            });
                          }),
                      costomTableRowPasch(
                          content: 'Viererpasch',
                          contentMiddle: 'alle Augen\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              fourpasch = int.parse(value);
                              calculate();
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
                        border:
                            TableBorder.all(color: Colors.black, width: 1.5),
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
                    const Divider(
                      thickness: 1.5,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ]);
            }));
  }

  void calculateAll() {
    setState(() {
      allSum = topSum + downSum;
    });
  }

  void checkBonus() {
    zwSum = dice1 + dice2 + dice3 + dice4 + dice5 + dice6;
    if (zwSum >= 63) {
      topSum = zwSum + 35;
      bonus = 'Ja';
    } else {
      topSum = zwSum;
      bonus = 'Nein';
    }
  }

  void calculateDown() {
    downSum = treepasch + fourpasch;
    if (fullhouse == true) {
      downSum = downSum + 25;
    }
    if (smallStreet == true) {
      downSum = downSum + 30;
    }
    if (bigStreet == true) {
      downSum = downSum + 40;
    }
    if (kniffel == true) {
      downSum = downSum + 50;
    }
    downSum = downSum + chance;
  }

  void resetAll() {
    player = 1;

// Würfel
    dice1 = 0;
    dice2 = 0;
    dice3 = 0;
    dice4 = 0;
    dice5 = 0;
    dice6 = 0;

//Summen
    zwSum = 0;
    topSum = 0;
    downSum = 0;
    allSum = 0;

// Pasche
    treepasch = 0;
    fourpasch = 0;

    fullhouse = false;
    smallStreet = false;
    bigStreet = false;
    kniffel = false;

    canceldFullhouse = false;
    canceldSmallStreet = false;
    canceldBigStreet = false;
    canceldKniffel = false;

    chance = 0;
    bgColor = Colors.white;

    colorFullhouse = Colors.white;
    colorSmallStreet = Colors.white;
    colorBigStreet = Colors.white;
    colorKniffel = Colors.white;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyApp()));
  }

  void calculate() {
    checkBonus();
    calculateDown();
    calculateAll();
  }
}
