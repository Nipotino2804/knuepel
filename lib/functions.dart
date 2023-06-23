import 'package:flutter/material.dart';
import 'package:kniffel/textfielcontroller.dart';
import 'package:kniffel/variables.dart';

void checkEmpty(
    {required int number,
    required String input,
    required BuildContext context}) {
  switch (number) {
    case 0:
      if (input.isEmpty) {
        dice0 = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        checkInput(number: number, input: inputInt, context: context);
        calculate();
      }
      break;
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
        checkInput(number: 7, input: inputInt, context: context);
      }
      break;
    case 8:
      if (input.isEmpty) {
        fourpasch = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        checkInput(number: 8, input: inputInt, context: context);
      }
      break;
    case 9:
      if (input.isEmpty) {
        chance = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        checkInput(number: 9, input: inputInt, context: context);
      }
      break;
    case 10:
      if (input.isEmpty) {
        doppelPasch = 0;
        calculate();
      } else {
        int inputInt = int.parse(input);
        checkInput(number: 10, input: inputInt, context: context);
      }
      break;
  }
}

void checkInput(
    {required int number, required int input, required BuildContext context}) {
  switch (number) {
    case 0:
      if (allowedDice0.contains(input)) {
        dice0 = input;
        calculate();
      } else {
        notAllowedInput(context, input: input, dice: 0);
        calculate();
      }
      break;
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
    case 7:
      if (input <= 30) {
        treepasch = input;
        calculate();
      } else {
        notAllowedInput(context, input: input, dice: 7);
      }
      break;
    case 8:
      if (input <= 30) {
        fourpasch = input;
        calculate();
      } else {
        notAllowedInput(context, input: input, dice: 8);
      }
      break;
    case 9:
      if (input <= 30) {
        chance = input;
        calculate();
      } else {
        notAllowedInput(context, input: input, dice: 9);
      }
      break;
    case 10:
      if (input <= 30) {
        doppelPasch = input;
        calculate();
      } else {
        notAllowedInput(context, input: input, dice: 10);
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
  zwSum = dice0 + dice1 + dice2 + dice3 + dice4 + dice5 + dice6;
  if (zwSum >= 63) {
    topSum = zwSum + 35;
    bonus = 'Ja';
  } else {
    topSum = zwSum;
    bonus = 'Nein';
  }
}

void calculateDown() {
  downSum = doppelPasch + treepasch + fourpasch + chance;
  if (tenOrDown == true) {
    downSum = downSum + 15;
  }
  if (fullhouse == true) {
    downSum = downSum + 25;
  }
  if (miniStreet == true) {
    downSum = downSum + 10;
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
}

void calculateAll() {
  allSum = topSum + downSum;
}

void notAllowedInput(BuildContext context,
    {required int input, required int dice}) {
  switch (dice) {
    case 0:
      dice0 = 0;
      calculate();
      break;
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
    case 7:
      treepasch = 0;
      calculate();
      break;
    case 8:
      fourpasch = 0;
      calculate();
      break;
    case 9:
      chance = 0;
      calculate();
      break;
    case 10:
      doppelPasch = 0;
      calculate();
      break;
  }
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
  bonus = 'Nein';
  dice0 = 0;
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
  doppelPasch = 0;
  treepasch = 0;
  fourpasch = 0;
  tenOrDown = false;
  fullhouse = false;
  miniStreet = false;
  smallStreet = false;
  bigStreet = false;
  kniffel = false;
  canceldTenOrDown = false;
  canceldFullhouse = false;
  canceldSmallStreet = false;
  canceldMiniStreet = false;
  canceldBigStreet = false;
  canceldKniffel = false;
  chance = 0;
  controllerDice0.clear();
  controllerDice1.clear();
  controllerDice2.clear();
  controllerDice3.clear();
  controllerDice4.clear();
  controllerDice5.clear();
  controllerDice6.clear();
  controllerDoppelPasch.clear();
  controllerThreePasch.clear();
  controllerFourPasch.clear();
  controllerChance.clear();
  colorSwitchTenOrDown = Colors.deepPurple.shade400;
  colorSwitchFullhouse = Colors.deepPurple.shade400;
  colorSwitchMiniStreet = Colors.deepPurple.shade400;
  colorSwitchSmallStreet = Colors.deepPurple.shade400;
  colorSwitchBigStreet = Colors.deepPurple.shade400;
  colorSwitchKniffel = Colors.deepPurple.shade400;
  colorBgSwitchTenOrDown = Colors.deepPurple.shade100;
  colorBgSwitchFullhouse = Colors.deepPurple.shade100;
  colorBgSwitchMiniStreet = Colors.deepPurple.shade100;
  colorBgSwitchSmallStreet = Colors.deepPurple.shade100;
  colorBgSwitchBigStreet = Colors.deepPurple.shade100;
  colorBgSwitchKniffel = Colors.deepPurple.shade100;
  colorTenOrDown = Colors.grey.shade100;
  colorFullhouse = Colors.grey.shade100;
  colorSmallStreet = Colors.grey.shade100;
  colorMiniStreet = Colors.grey.shade100;
  colorBigStreet = Colors.grey.shade100;
  colorKniffel = Colors.grey.shade100;
  calculate();
}
