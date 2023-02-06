import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/modules/user/layout/cubit/cubit.dart';
import 'package:home_care/theme/theme.dart';

import 'modules/user/onboarding/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LayoutCubit>(create: (context) => LayoutCubit()),
    ], child: MaterialApp(
      title: 'Home Care',
      theme: MyTheme.myTheme,
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    ));
    
  }
}
