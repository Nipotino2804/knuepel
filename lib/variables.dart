import 'package:flutter/material.dart';
import 'package:kniffel/textfielcontroller.dart';

String title = 'Knüppel';
String bonus = 'Nein';
int player = 1;
ThemeMode currentThemeMode = ThemeMode.light;

// Pictures
String dice1picture = 'assets/01.png';
String dice2picture = 'assets/02.png';
String dice3picture = 'assets/03.png';
String dice4picture = 'assets/04.png';
String dice5picture = 'assets/05.png';
String dice6picture = 'assets/06.png';

// Würfel
int dice1 = 0;
int dice2 = 0;
int dice3 = 0;
int dice4 = 0;
int dice5 = 0;
int dice6 = 0;

//Summen
int zwSum = 0;
int topSum = 0;
int downSum = 0;
int allSum = 0;

// Pasche
int treepasch = 0;
int fourpasch = 0;

bool fullhouse = false;
bool smallStreet = false;
bool bigStreet = false;
bool kniffel = false;

bool canceldFullhouse = false;
bool canceldSmallStreet = false;
bool canceldBigStreet = false;
bool canceldKniffel = false;

int chance = 0;

//Colors - Default = light
Color colorFullhouse = Colors.grey.shade100;
Color colorSmallStreet = Colors.grey.shade100;
Color colorBigStreet = Colors.grey.shade100;
Color colorKniffel = Colors.grey.shade100;
Color textColor = Colors.black;
Color appbarBackgroundColor = Colors.white;
Color appbarForegroundColor = Colors.black;
Color tableTextBackgroundColor = Colors.grey.shade100;
Color scaffoldBackgroundColor = Colors.grey.shade100;
Color tableBorderColor = Colors.black;

//Check

List<int> allowedDice1 = [0, 1, 2, 3, 4, 5, 6];
List<int> allowedDice2 = [0, 2, 4, 6, 8, 10, 1];
List<int> allowedDice3 = [0, 3, 6, 9, 12, 15, 1];
List<int> allowedDice4 = [0, 4, 8, 12, 16, 20, 1, 2];
List<int> allowedDice5 = [0, 5, 10, 15, 20, 25, 1, 2];
List<int> allowedDice6 = [0, 6, 12, 18, 24, 30, 1, 2, 3];

bool checkDice1 = false;
bool checkDice2 = false;
bool checkDice3 = false;
bool checkDice4 = false;
bool checkDice5 = false;
bool checkDice6 = false;

bool checkTreePasch1 = false;
bool checkFourPasch2 = false;
bool checkChance = false;

final List inputList = [
  allowedDice1,
  allowedDice2,
  allowedDice3,
  allowedDice4,
  allowedDice5,
  allowedDice6
];
final List textController = [
  controllerDice1,
  controllerDice2,
  controllerDice3,
  controllerDice4,
  controllerDice5,
  controllerDice6
];
final List diceList = [dice1, dice2, dice3, dice4, dice5, dice6];
