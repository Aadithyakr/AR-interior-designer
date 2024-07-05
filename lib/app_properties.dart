import 'package:flutter/material.dart';

const Color blue = Color.fromARGB(255, 27, 52, 179);
const Color mediumBlue = Color.fromARGB(255, 9, 52, 112);
const Color darkBlue = Color.fromARGB(255, 19, 5, 83);
const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);
const Color darkGrey = Color(0xff202020);

const Color backgroundColor2 = Color(0xFF17203A);
const Color backgroundColorLight = Color(0xFFF2F6FF);
const Color backgroundColorDark = Color(0xFF25254B);
const Color shadowColorLight = Color(0xFF4A5367);
const Color shadowColorDark = Colors.black;

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6),
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}
