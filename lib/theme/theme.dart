import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;

  ThemeChanger(int mode) {
    switch (mode) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
    }
  }

  get darkTheme => _darkTheme;
  get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  set darkTheme(bool valor) {
    _darkTheme = valor;
    _customTheme = false;
    notifyListeners();
    _currentTheme = valor ? ThemeData.dark() : ThemeData.light();
  }

  set customTheme(bool valor) {
    _darkTheme = false;
    _customTheme = valor;
    if (valor) {
      _currentTheme = ThemeData.dark().copyWith(
          accentColor: Color(0xFF48A0EB),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Color(0xFF16202b),
          textTheme: TextTheme(
              bodyText2: TextStyle(
            color: Colors.white,
          )));
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
