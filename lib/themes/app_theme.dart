import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData({
    required bool isDarkTheme,
    required BuildContext context,
  }) {
    return isDarkTheme
        ? ThemeData(
            scaffoldBackgroundColor: const Color(0xff343541),
            primarySwatch: Colors.purple,
            primaryColorDark: Colors.purple,
            dividerColor: Colors.white,
            disabledColor: Colors.grey,
            cardColor: const Color(0xff444654),
            canvasColor: Colors.black,
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xff444654)),
            buttonTheme: Theme.of(
              context,
            ).buttonTheme.copyWith(colorScheme: const ColorScheme.dark()),
          )
        : ThemeData(
            scaffoldBackgroundColor: Colors.grey.shade300,
            primarySwatch: Colors.purple,
            primaryColorDark: Colors.purple,
            dividerColor: Colors.black,
            disabledColor: Colors.grey,
            cardColor: Colors.white,
            canvasColor: Colors.grey[50],
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
            buttonTheme: Theme.of(
              context,
            ).buttonTheme.copyWith(colorScheme: const ColorScheme.light()),
          );
  }
}
