import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:home_care/modules/user/auth/user_signup_screen.dart';

import '../../../constants/assets.dart';
import '../../../functions/my_navigation.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/my_scaffold.dart';
import '../../../widgets/textFormField.dart';
import '../layout/user_layout_sreen.dart';

class JoinUsScreen extends StatelessWidget {
  JoinUsScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MyScaffold(
        leading: IconButton(
          splashRadius: 25,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "انضم لنا",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 0,
                right: 20,
                left: 20,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  CustomTextFormField(
                    text: "الآسم الثلاثي",
                    controller: nameController,
                    isFilld: true,
                    color: MyColors.mainColor.withOpacity(0.1),
                    textColor: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    text: "رقم الهاتف",
                    controller: phoneController,
                    isFilld: true,
                    color: MyColors.mainColor.withOpacity(0.1),
                    textColor: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    text: "البريد الالكتروني",
                    controller: emailController,
                    isFilld: true,
                    color: MyColors.mainColor.withOpacity(0.1),
                    textColor: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: DropdownButtonFormField<String>(
                      style: TextStyle(
                        color: MyColors.mainColor,
                        fontSize: 15,
                        fontFamily: MyFonts.myFont,
                        fontWeight: FontWeight.bold,
                      ),
                      alignment: Alignment.centerRight,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.mainColor.withOpacity(0.1),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 17,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      elevation: 1,
                      dropdownColor: Colors.white,
                      menuMaxHeight: 300,
                      hint: const Text(
                        'اختر التخصص',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onChanged: (val) {},
                      items: const [
                        DropdownMenuItem<String>(
                          value: "1",
                          alignment: Alignment.center,
                          child: Text("تمريض"),
                        ),
                        DropdownMenuItem<String>(
                          value: "2",
                          alignment: Alignment.center,
                          child: Text("جليس"),
                        ),
                        DropdownMenuItem<String>(
                          value: "5",
                          alignment: Alignment.center,
                          child: Text("طبيب بيطري"),
                        ),
                        DropdownMenuItem<String>(
                          value: "3",
                          alignment: Alignment.center,
                          child: Text("آخصائي علاج طبيعي"),
                        ),
                        DropdownMenuItem<String>(
                          value: "6",
                          alignment: Alignment.center,
                          child: Text("آخصائي باطنة"),
                        ),
                        DropdownMenuItem<String>(
                          value: "7",
                          alignment: Alignment.center,
                          child: Text("آخصائي نسا و توليد"),
                        ),
                        DropdownMenuItem<String>(
                          value: "8",
                          alignment: Alignment.center,
                          child: Text("آخصائي مخ و اعصاب"),
                        ),
                        DropdownMenuItem<String>(
                          value: "9",
                          alignment: Alignment.center,
                          child: Text("آخصائي عظام"),
                        ),
                        DropdownMenuItem<String>(
                          value: "10",
                          alignment: Alignment.center,
                          child: Text("آخصائي آطفال"),
                        ),
                        DropdownMenuItem<String>(
                          value: "11",
                          alignment: Alignment.center,
                          child: Text("آخصائي نفسي"),
                        ),
                        DropdownMenuItem<String>(
                          value: "12",
                          alignment: Alignment.center,
                          child: Text("آخصائي عناية مركزة"),
                        ),
                        DropdownMenuItem<String>(
                          value: "12",
                          alignment: Alignment.center,
                          child: Text("آخصائي آوعية دموية"),
                        ),
                        DropdownMenuItem<String>(
                          value: "14",
                          alignment: Alignment.center,
                          child: Text("اخصائي قلب و صدر"),
                        ),
                        DropdownMenuItem<String>(
                          value: "15",
                          alignment: Alignment.center,
                          child: Text("اخصائي رمض"),
                        ),
                        DropdownMenuItem<String>(
                          value: "16",
                          alignment: Alignment.center,
                          child: Text("اخصائي انف و اذن و حنجرة"),
                        ),
                        DropdownMenuItem<String>(
                          value: "17",
                          alignment: Alignment.center,
                          child: Text("اخصائي جهاز هضمي"),
                        ),
                        DropdownMenuItem<String>(
                          value: "13",
                          alignment: Alignment.center,
                          child: Text("ممارس عام"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: const [
                          Icon(
                            Icons.image,
                            size: 40,
                            color: Colors.grey,
                          ),
                          Text(
                            "آختر صورة شخصية",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(
                            Icons.image,
                            size: 40,
                            color: Colors.grey,
                          ),
                          Text(
                            "آختر صورة البطاقة",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(
                            Icons.image,
                            size: 40,
                            color: Colors.grey,
                          ),
                          Text(
                            "آختر مزاولة المهنة",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {},
                    text: "إرسال للمراجعة",
                    color: MyColors.mainColor,
                    fontSize: 16,
                    height: 55,
                    width: 400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
