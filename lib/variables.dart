import 'package:flutter/material.dart';
import 'package:kniffel/textfielcontroller.dart';

String title = 'Knüppel';
String bonus = 'Nein';
int player = 1;
ThemeMode currentThemeMode = ThemeMode.light;

// Pictures
String dice0picture = 'assets/00.png';
String dice1picture = 'assets/01.png';
String dice2picture = 'assets/02.png';
String dice3picture = 'assets/03.png';
String dice4picture = 'assets/04.png';
String dice5picture = 'assets/05.png';
String dice6picture = 'assets/06.png';

// Points
int dice0 = 0;
int dice1 = 0;
int dice2 = 0;
int dice3 = 0;
int dice4 = 0;
int dice5 = 0;
int dice6 = 0;
int zwSum = 0;
int topSum = 0;
int downSum = 0;
int allSum = 0;
int doppelPasch = 0;
int treepasch = 0;
int fourpasch = 0;
int chance = 0;

bool tenOrDown = false;
bool fullhouse = false;
bool miniStreet = false;
bool smallStreet = false;
bool bigStreet = false;
bool kniffel = false;

bool canceldTenOrDown = false;
bool canceldFullhouse = false;
bool canceldMiniStreet = false;
bool canceldSmallStreet = false;
bool canceldBigStreet = false;
bool canceldKniffel = false;
bool canceldDice1 = false;
bool canceldDice2 = false;
bool canceldDice3 = false;
bool canceldDice4 = false;
bool canceldDice5 = false;
bool canceldDice6 = false;
bool canceldThreePasch = false;
bool canceldFourPasch = false;
bool canceldChance = false;

//Colors - Default = light
Color colorTenOrDown = Colors.grey.shade100;
Color colorFullhouse = Colors.grey.shade100;
Color colorMiniStreet = Colors.grey.shade100;
Color colorSmallStreet = Colors.grey.shade100;
Color colorBigStreet = Colors.grey.shade100;
Color colorKniffel = Colors.grey.shade100;
Color colorSwitchTenOrDown = Colors.deepPurple.shade400;
Color colorSwitchFullhouse = Colors.deepPurple.shade400;
Color colorSwitchMiniStreet = Colors.deepPurple.shade400;
Color colorSwitchSmallStreet = Colors.deepPurple.shade400;
Color colorSwitchBigStreet = Colors.deepPurple.shade400;
Color colorSwitchKniffel = Colors.deepPurple.shade400;
Color colorBgSwitchTenOrDown = Colors.deepPurple.shade100;
Color colorBgSwitchFullhouse = Colors.deepPurple.shade100;
Color colorBgSwitchSmallStreet = Colors.deepPurple.shade100;
Color colorBgSwitchMiniStreet = Colors.deepPurple.shade100;
Color colorBgSwitchBigStreet = Colors.deepPurple.shade100;
Color colorBgSwitchKniffel = Colors.deepPurple.shade100;
Color textColor = Colors.black;
Color appbarBackgroundColor = Colors.grey.shade100;
Color appbarForegroundColor = Colors.black;
Color tableTextBackgroundColor = Colors.grey.shade100;
Color scaffoldBackgroundColor = Colors.grey.shade100;
Color tableBorderColor = Colors.black;

//Check

List<int> allowedDice0 = [0, 1, 2, 3, 4, 5, 6];
List<int> allowedDice1 = [0, 1, 2, 3, 4, 5, 6];
List<int> allowedDice2 = [0, 2, 4, 6, 8, 10, 1];
List<int> allowedDice3 = [0, 3, 6, 9, 12, 15, 1];
List<int> allowedDice4 = [0, 4, 8, 12, 16, 20, 1, 2];
List<int> allowedDice5 = [0, 5, 10, 15, 20, 25, 1, 2];
List<int> allowedDice6 = [0, 6, 12, 18, 24, 30, 1, 2, 3];

final List inputList = [
  allowedDice0,
  allowedDice1,
  allowedDice2,
  allowedDice3,
  allowedDice4,
  allowedDice5,
  allowedDice6
];
final List textController = [
  controllerDice0,
  controllerDice1,
  controllerDice2,
  controllerDice3,
  controllerDice4,
  controllerDice5,
  controllerDice6,
  controllerThreePasch,
  controllerFourPasch,
  controllerChance,
  controllerDoppelPasch
];
final List diceList = [dice0, dice1, dice2, dice3, dice4, dice5, dice6];
