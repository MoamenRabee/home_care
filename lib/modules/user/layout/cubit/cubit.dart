import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/modules/user/booking/user_booking_screen.dart';
import 'package:home_care/modules/user/home/user_home_screen.dart';
import 'package:home_care/modules/user/layout/cubit/states.dart';
import 'package:home_care/modules/user/news/user_news_screen.dart';
import 'package:home_care/modules/user/notification/user_notification_screen.dart';
import 'package:home_care/modules/user/profile/user_profile_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitState());

  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 2;

  List<Widget> screens =  [
    UserBookingScreen(),
    UserNewsScreen(),
    UserHomeScreen(),
    UserNotificationScreen(),
    UserProfileScreen(),
  ];

  void changeLayoutScreen(int index){
    currentIndex = index;
    emit(LayoutChangePageState());
  }



  List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.medical_information_rounded),
      label: "حجوزاتي",
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.newspaper_rounded), label: "نصائح"),
    BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "الرئيسية"),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications_rounded), label: "الإشعارات"),
    BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "آنا"),
  ];
}
