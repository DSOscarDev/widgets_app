
import 'package:flutter/material.dart';

const colorList= <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class Apptheme{

  final int selectedColor;

  Apptheme({
    this.selectedColor=0
  }):assert(selectedColor>=0,'no puede ser menor a cero'),
  assert(selectedColor<colorList.length,'debe ser menor o igual a ${colorList.length-1}');

  ThemeData getTheme()=> ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
  );
}