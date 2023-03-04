import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_care/functions/my_navigation.dart';
import 'package:home_care/modules/user/auth/cubit/auth_cubit.dart';
import 'package:home_care/modules/user/join/join_us_screen.dart';
import '../../../../constants/assets.dart';
import '../../../../theme/theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 320,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: SafeArea(
          child: Column(
        children: [
          Center(
            child: SvgPicture.asset(
              Assets.logo,
              width: 200,
              height: 200,
              color: MyColors.mainColor,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.home_rounded),
            onTap: () {
              Navigator.pop(context);
            },
            title: const Text("الصفحة الرئيسية"),
          ),
          ListTile(
            leading: const Icon(Icons.facebook_rounded),
            onTap: () {},
            title: const Text("الفيسبوك"),
          ),
          ListTile(
            leading: const Icon(Icons.group_add),
            onTap: () {
              MyNavigator.navigateTo(context, JoinUsScreen());
            },
            title: const Text("آنضم لنا"),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            onTap: () {
              AuthCubit.get(context).logOut(context);
            },
            title: const Text("تسجيل الخروج"),
          ),
        ],
      )),
    );
  }
}
