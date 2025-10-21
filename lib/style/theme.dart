import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData dark=ThemeData(
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Color(0xffE2BE7F),
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xffE2BE7F),size: 18),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.amber,
      type: BottomNavigationBarType.fixed,
    ),
    scaffoldBackgroundColor: Colors.transparent
  );
}