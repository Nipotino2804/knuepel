import 'package:flutter/material.dart';
import 'package:kniffel/functions.dart';
import 'package:kniffel/textfielcontroller.dart';
import 'package:kniffel/variables.dart';
import 'package:kniffel/widgets.dart';

class PlaypageCostom extends StatefulWidget {
  const PlaypageCostom({super.key});

  @override
  State<PlaypageCostom> createState() => _PlaypageCostomState();
}

class _PlaypageCostomState extends State<PlaypageCostom> {
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
                          picture: dice0picture,
                          content: 'ein Würfel\nzählt',
                          controller: controllerDice0,
                          context: context,
                          textFieldInput: (value) {
                            setState(() {
                              checkEmpty(
                                  number: 0, input: value, context: context);
                            });
                          }),
                      costomTableRowDices(
                          context: context,
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
                          context: context,
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
                          context: context,
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
                          context: context,
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
                          context: context,
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
                          context: context,
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
                          content: 'Doppelpasch',
                          contentMiddle: 'alle Augen\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              checkEmpty(
                                  number: 10, input: value, context: context);
                            });
                          },
                          controller: controllerDoppelPasch),
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
                          content: '10 oder weniger',
                          contentMiddle: '15 Punkte',
                          onTap: (value) {
                            setState(() {
                              if (tenOrDown == false &&
                                  canceldTenOrDown == false) {
                                tenOrDown = true;
                              } else {
                                tenOrDown = false;
                              }
                              calculate();
                            });
                          },
                          onDbTap: () {
                            setState(() {
                              canceldTenOrDown = true;
                              tenOrDown = false;
                              colorTenOrDown = Colors.red;
                              colorBgSwitchTenOrDown = Colors.red;
                              colorSwitchTenOrDown =
                                  const Color.fromARGB(210, 0, 0, 0);
                              calculate();
                            });
                          },
                          startValue: tenOrDown,
                          color: colorTenOrDown,
                          swColor: colorSwitchTenOrDown,
                          swBgColor: colorBgSwitchTenOrDown),
                      costomTableRowSwitch(
                          content: 'Fullhouse',
                          swBgColor: colorBgSwitchFullhouse,
                          contentMiddle: '25 Punkte',
                          color: colorFullhouse,
                          swColor: colorSwitchFullhouse,
                          onDbTap: () {
                            setState(() {
                              canceldFullhouse = true;
                              fullhouse = false;
                              colorFullhouse = Colors.red;
                              colorBgSwitchFullhouse = Colors.red;
                              colorSwitchFullhouse =
                                  const Color.fromARGB(210, 0, 0, 0);
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
                          content: 'mini Straße',
                          swBgColor: colorBgSwitchMiniStreet,
                          contentMiddle: '10 Punkte',
                          color: colorMiniStreet,
                          swColor: colorSwitchMiniStreet,
                          onDbTap: () => setState(() {
                                canceldMiniStreet = true;
                                miniStreet = false;
                                colorMiniStreet = Colors.red;
                                colorBgSwitchMiniStreet = Colors.red;
                                colorSwitchMiniStreet =
                                    const Color.fromARGB(210, 0, 0, 0);
                                calculate();
                              }),
                          onTap: (value) {
                            setState(() {
                              if (miniStreet == false &&
                                  canceldMiniStreet == false) {
                                miniStreet = true;
                              } else {
                                miniStreet = false;
                              }
                              calculate();
                            });
                          },
                          startValue: miniStreet),
                      costomTableRowSwitch(
                          content: 'kleine Straße',
                          swBgColor: colorBgSwitchSmallStreet,
                          contentMiddle: '30 Punkte',
                          color: colorSmallStreet,
                          swColor: colorSwitchSmallStreet,
                          onDbTap: () => setState(() {
                                canceldSmallStreet = true;
                                smallStreet = false;
                                colorSmallStreet = Colors.red;
                                colorBgSwitchSmallStreet = Colors.red;
                                colorSwitchSmallStreet =
                                    const Color.fromARGB(210, 0, 0, 0);
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
                          swBgColor: colorBgSwitchBigStreet,
                          color: colorBigStreet,
                          swColor: colorSwitchBigStreet,
                          onDbTap: () {
                            setState(() {
                              canceldBigStreet = true;
                              bigStreet = false;
                              colorBigStreet = Colors.red;
                              colorBgSwitchBigStreet = Colors.red;
                              colorSwitchBigStreet =
                                  const Color.fromARGB(210, 0, 0, 0);
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
                          swBgColor: colorBgSwitchKniffel,
                          swColor: colorSwitchKniffel,
                          color: colorKniffel,
                          onDbTap: () {
                            setState(() {
                              canceldKniffel = true;
                              kniffel = false;
                              colorSwitchKniffel =
                                  const Color.fromARGB(210, 0, 0, 0);
                              colorBgSwitchKniffel = Colors.red;
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
                          controller: controllerChance,
                          content: 'Chance',
                          contentMiddle: 'alle Augen\nzählen',
                          textFieldInput: (value) {
                            setState(() {
                              checkEmpty(
                                  number: 9, input: value, context: context);
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
