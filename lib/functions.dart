import 'package:flutter/material.dart';
import 'package:kniffel/textfielcontroller.dart';
import 'package:kniffel/variables.dart';

void checkEmpty(
    {required int number,
    required String input,
    required BuildContext context}) {
  switch (number) {
    case 1:
      if (input.isEmpty) {
        dice1 = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        checkInput(number: number, input: inputInt, context: context);
        calculate();
      }
      break;
    case 2:
      if (input.isEmpty) {
        dice2 = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        checkInput(number: 2, input: inputInt, context: context);
        calculate();
      }
      break;
    case 3:
      if (input.isEmpty) {
        dice3 = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        checkInput(number: 3, input: inputInt, context: context);
        calculate();
      }
      break;
    case 4:
      if (input.isEmpty) {
        dice4 = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        checkInput(number: 4, input: inputInt, context: context);
        calculate();
      }
      break;
    case 5:
      if (input.isEmpty) {
        dice5 = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        checkInput(number: 5, input: inputInt, context: context);
        calculate();
      }
      break;
    case 6:
      if (input.isEmpty) {
        dice6 = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        checkInput(number: 6, input: inputInt, context: context);
      }
      break;
    case 7:
      if (input.isEmpty) {
        treepasch = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        treepasch = inputInt;
        calculate();
      }
      break;
    case 8:
      if (input.isEmpty) {
        fourpasch = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        fourpasch = inputInt;
        calculate();
      }
      break;
    case 9:
      if (input.isEmpty) {
        chance = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        chance = inputInt;
        calculate();
      }
  }
}

void checkInput(
    {required int number, required int input, required BuildContext context}) {
  switch (number) {
    case 1:
      if (allowedDice1.contains(input)) {
        dice1 = input;
        calculate();
      } else {
        notAllowedInput(context, input: input, dice: 1);
        calculate();
      }
      break;
    case 2:
      if (allowedDice2.contains(input)) {
        dice2 = input;
        calculate();
      } else {
        notAllowedInput(context, input: input, dice: 2);
        calculate();
      }
      break;
    case 3:
      if (allowedDice3.contains(input)) {
        dice3 = input;
        calculate();
      } else {
        notAllowedInput(context, input: input, dice: 3);
        calculate();
      }
      break;
    case 4:
      if (allowedDice4.contains(input)) {
        dice4 = input;
        calculate();
      } else {
        notAllowedInput(context, input: input, dice: 4);
        calculate();
      }
      break;
    case 5:
      if (allowedDice5.contains(input)) {
        dice5 = input;
        calculate();
      } else {
        notAllowedInput(context, input: input, dice: 5);
        calculate();
      }
      break;
    case 6:
      if (allowedDice6.contains(input)) {
        dice6 = input;
        calculate();
      } else {
        notAllowedInput(context, input: input, dice: 6);
        calculate();
      }
      break;
  }
}

calculate() {
  checkBonus();
  calculateDown();
  calculateAll();
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

void calculateAll() {
  allSum = topSum + downSum;
}

void notAllowedInput(BuildContext context,
    {required int input, required int dice}) {
  switch (dice) {
    case 1:
      dice1 = 0;
      calculate();
      break;
    case 2:
      dice2 = 0;
      calculate();
      break;
    case 3:
      dice3 = 0;
      calculate();
      break;
    case 4:
      dice4 = 0;
      calculate();
      break;
    case 5:
      dice5 = 0;
      calculate();
      break;
    case 6:
      dice6 = 0;
      calculate();
      break;
  }
  dice--;
  TextEditingController pickController = textController[dice];
  pickController.clear();
  calculate();
  final scaffoldMsg = ScaffoldMessenger.of(context);
  scaffoldMsg.showSnackBar(SnackBar(
    backgroundColor: Colors.red.shade400,
    content: const Text(
      'Diese Zahl ist nicht zugelassen!',
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
  ));
}

void reset() {
  if (currentThemeMode == ThemeMode.light) {
    colorFullhouse = Colors.grey.shade100;
    colorSmallStreet = Colors.grey.shade100;
    colorBigStreet = Colors.grey.shade100;
    colorKniffel = Colors.grey.shade100;
  } else {}
  bonus = 'Nein';
  dice1 = 0;
  dice2 = 0;
  dice3 = 0;
  dice4 = 0;
  dice5 = 0;
  dice6 = 0;
  zwSum = 0;
  topSum = 0;
  downSum = 0;
  allSum = 0;
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
  checkDice1 = false;
  checkDice2 = false;
  checkDice3 = false;
  checkDice4 = false;
  checkDice5 = false;
  checkDice6 = false;
  checkTreePasch1 = false;
  checkFourPasch2 = false;
  checkChance = false;
  controllerDice1.clear();
  controllerDice2.clear();
  controllerDice3.clear();
  controllerDice4.clear();
  controllerDice5.clear();
  controllerDice6.clear();
  controllerThreePasch.clear();
  controllerFourPasch.clear();
  controlerChance.clear();
  calculate();
}
