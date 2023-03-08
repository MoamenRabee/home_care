import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  static ThemeData get myTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: MyColors.mainColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: MyColors.mainColor,
          systemNavigationBarColor: MyColors.mainColor,
          systemNavigationBarDividerColor: MyColors.mainColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: MyColors.mainColor,
        unselectedItemColor: Colors.grey.shade500,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      
      primaryColor: MyColors.mainColor,
      primarySwatch: MyColors.myMaterialMainColor,
      fontFamily: MyFonts.myFont,
      accentColor: MyColors.mainColor,
      
      
    );
  }
}

class MyColors {
  static const Color blueColor = Color(0xFF16ADE1);
  static const Color mainColor = Color(0xFF1B3954);

  static MaterialColor myMaterialMainColor = const MaterialColor(
    0xFF1B3954,
    {
      50: Color(0xFF1B3954),
      100: Color(0xFF1B3954),
      200: Color(0xFF1B3954),
      300: Color(0xFF1B3954),
      400: Color(0xFF1B3954),
      500: Color(0xFF1B3954),
      600: Color(0xFF1B3954),
      700: Color(0xFF1B3954),
      800: Color(0xFF1B3954),
      900: Color(0xFF1B3954),
    },
  );


}

class MyFonts {
  static String myFont = "IBMPlexSansArabic";
}
