
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
  final bool isDarkmode;

  Apptheme({
    this.selectedColor=0,
    this.isDarkmode=false
  }):assert(selectedColor>=0,'no puede ser menor a cero'),
  assert(selectedColor<colorList.length,'debe ser menor o igual a ${colorList.length-1}');

  ThemeData getTheme()=> ThemeData(
    useMaterial3: true,
    brightness: isDarkmode? Brightness.dark:Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );
  Apptheme copyWith({
    int? selectedColor,
    bool? isDarkmode,
  })=>Apptheme(
    selectedColor: selectedColor?? this.selectedColor,
    isDarkmode: isDarkmode?? this.isDarkmode,
  );
}