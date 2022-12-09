import 'package:flutter/material.dart';

String title = 'Knöppel';
String bonus = 'Nein';
int player = 1;

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
Color bgColor = Colors.white;

Color colorFullhouse = Colors.white;
Color colorSmallStreet = Colors.white;
Color colorBigStreet = Colors.white;
Color colorKniffel = Colors.white;
