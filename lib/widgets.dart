import 'package:flutter/material.dart';

AppBar costomAppbar({required String text}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      text,
      style: const TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
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
    {required String picture, required String content, textFieldInput}) {
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
              bgColor: Colors.white)),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: TextField(
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
              bgColor: Colors.white)),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: tabelText(
              content: contentMiddle,
              weight: FontWeight.normal,
              bgColor: Colors.white)),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: tabelText(
              content: '$sum',
              weight: FontWeight.normal,
              bgColor: Colors.white)),
    )
  ]);
}

TableRow costomTableRowPasch(
    {required String content,
    required String contentMiddle,
    required textFieldInput}) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: tabelText(
              content: content,
              weight: FontWeight.w600,
              bgColor: Colors.white)),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: tabelText(
              content: contentMiddle,
              weight: FontWeight.normal,
              bgColor: Colors.white)),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: TextField(
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
