import 'package:flutter/material.dart';
import 'package:kniffel/variables.dart';

AppBar costomAppbar({required String text}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      text,
      style: TextStyle(color: textColor),
    ),
    backgroundColor: appbarBackgroundColor,
    foregroundColor: appbarForegroundColor,
  );
}

Widget tabelText(
    {required String content,
    required FontWeight weight,
    required Color bgColor}) {
  return Text(
    content,
    style:
        TextStyle(fontSize: 22, fontWeight: weight, backgroundColor: bgColor),
    textAlign: TextAlign.center,
  );
}

TableRow costomTableRowDices(
    {required String picture,
    required String content,
    textFieldInput,
    required TextEditingController controller}) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Image.asset(picture)),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: tabelText(
              content: content,
              weight: FontWeight.normal,
              bgColor: tableTextBackgroundColor)),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
        onChanged: textFieldInput,
        keyboardType: TextInputType.phone,
        autocorrect: false,
      )),
    )
  ]);
}

TableRow costomTableRowSum({
  required String content,
  required String contentMiddle,
  required sum,
}) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: tabelText(
              content: content,
              weight: FontWeight.w600,
              bgColor: tableTextBackgroundColor)),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: tabelText(
              content: contentMiddle,
              weight: FontWeight.normal,
              bgColor: tableTextBackgroundColor)),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: tabelText(
              content: '$sum',
              weight: FontWeight.normal,
              bgColor: tableTextBackgroundColor)),
    )
  ]);
}

TableRow costomTableRowPasch(
    {required String content,
    required String contentMiddle,
    required textFieldInput,
    required TextEditingController controller}) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: tabelText(
              content: content,
              weight: FontWeight.w600,
              bgColor: tableTextBackgroundColor)),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: tabelText(
              content: contentMiddle,
              weight: FontWeight.normal,
              bgColor: tableTextBackgroundColor)),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
        onChanged: textFieldInput,
        keyboardType: TextInputType.phone,
        autocorrect: false,
      )),
    )
  ]);
}

TableRow costomTableRowSwitch(
    {required String content,
    required String contentMiddle,
    required onTap,
    required onDbTap,
    required bool startValue,
    required Color color}) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: GestureDetector(
        onDoubleTap: onDbTap,
        child: tabelText(
            content: content, weight: FontWeight.w600, bgColor: color),
      )),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: tabelText(
              content: contentMiddle,
              weight: FontWeight.normal,
              bgColor: color)),
    ),
    GestureDetector(
      onDoubleTap: onDbTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Switch(
          value: startValue,
          onChanged: onTap,
        )),
      ),
    )
  ]);
}
