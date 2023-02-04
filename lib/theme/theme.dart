import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData get myTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: MyColors.mainColor,
        elevation: 0,
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
      ),
      primaryColor: MyColors.mainColor,
      fontFamily: MyFonts.myFont,
      accentColor: MyColors.mainColor
    );
  }
}

class MyColors{
  static const Color mainColor = Color(0xFF007db3);
  static const Color darkColor = Color(0xFF010066);
  static const Color orangeColor = Color(0xFFff6600);

}


class MyFonts{
  static String myFont = "IBMPlexSansArabic";
}
