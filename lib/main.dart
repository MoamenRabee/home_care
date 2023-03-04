import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/modules/user/auth/cubit/auth_cubit.dart';
import 'package:home_care/modules/user/auth/user_login_screen.dart';
import 'package:home_care/modules/user/layout/cubit/cubit.dart';
import 'package:home_care/modules/user/layout/user_layout_sreen.dart';
import 'package:home_care/theme/theme.dart';

import 'firebase_options.dart';
import 'functions/cache_helper.dart';
import 'modules/user/onboarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  runApp(MyApp(initScreen: initScreen()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.initScreen});

  Widget initScreen;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LayoutCubit>(create: (context) => LayoutCubit()),
          BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        ],
        child: MaterialApp(
          title: 'Home Care',
          theme: MyTheme.myTheme,
          debugShowCheckedModeBanner: false,
          home: initScreen,
        ));
  }
}

Widget initScreen() {
  if (CacheHelper.getString(key: "onBoarding") != "true") {
    return OnBoardingScreen();
  } else if (CacheHelper.getString(key: "userPhone") == null ||
      CacheHelper.getString(key: "userPhone") == "") {
    return UserLoginScreen();
  } else {
    return const UserLayoutScreen();
  }
}
