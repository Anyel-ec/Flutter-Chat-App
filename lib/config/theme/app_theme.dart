import 'package:flutter/material.dart';
const Color _customColor = Color(0xCB0AA3C9);
const List<Color> colorTheme = [
    _customColor,
    Colors.blue, 
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.purple,
];
class AppTheme{

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    
    
    }):assert(selectedColor < colorTheme.length, 'Colors must be less than ${colorTheme.length}');

  //tema de modo oscuro
  ThemeData theme(){
    return ThemeData(
      colorSchemeSeed: colorTheme[selectedColor], 
      //brightness: Brightness.dark
    );
  }
}