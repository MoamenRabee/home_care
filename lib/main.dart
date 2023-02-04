import 'package:flutter/material.dart';
import 'package:home_care/modules/user/layout/user_layout_sreen.dart';
import 'package:home_care/theme/theme.dart';

import 'modules/user/auth/user_login_screen.dart';
import 'modules/user/onboarding/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Care',
      theme: MyTheme.myTheme,
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
