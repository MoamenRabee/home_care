import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_care/constants/assets.dart';
import 'package:home_care/functions/my_navigation.dart';
import 'package:home_care/modules/user/auth/user_login_screen.dart';
import 'package:home_care/modules/user/layout/user_layout_sreen.dart';
import 'package:home_care/theme/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../functions/cache_helper.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    PageController pageViewController = PageController();

    int index_page = 0;

    void canclePage() {
      MyNavigator.navigateOffAll(context, UserLoginScreen());
      CacheHelper.setString(key: "onBoarding", value: "true");
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        canclePage();
                      },
                      child: const Text(
                        "تخطى",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: MyColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: PageView(
                    physics: const BouncingScrollPhysics(),
                    controller: pageViewController,
                    children: [
                      PageViewItem(
                        title: "متابعة دورية احترافية",
                        description:
                            "هنتابع المرضي او كبار السن باحترافية ٬ علاجه و حركته و آكله و شربه و عنايته الشخصية.",
                        image: Assets.onboardDoctorSVG,
                        widthScreen: widthScreen,
                      ),
                      PageViewItem(
                        title: "جلسات العلاج الطبيعي",
                        description:
                            "جلسات علاجج طبيعي من امهر الدكاتره المتخصصه و من غير متنزل من بيتك ٬ لانه هيجيلك لعندك.",
                        image: Assets.onboardInjuredSVG,
                        widthScreen: widthScreen,
                      ),
                      PageViewItem(
                        title: "زيارات منزلية للتمريض",
                        description:
                            "تركيب محلول ٬ حقن ٬ قسطرة ٬ جلسات التنفس ٬ كل دا و انت ف بيتك.",
                        image: Assets.onboardLocationSVG,
                        widthScreen: widthScreen,
                      ),
                      PageViewItem(
                        title: "التحاليل الطبيه",
                        description:
                            "هنعمل جميع انواع التحاليل الموجوده ، بآدق الاجهزه  و انت قاعد في البيت.",
                        image: Assets.onboardMedicineSVG,
                        widthScreen: widthScreen,
                      ),
                    ],
                    onPageChanged: (page) {
                      index_page = page;
                      log(page.toString());
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: pageViewController,
                      count: 4,
                      axisDirection: Axis.horizontal,
                      effect: const ExpandingDotsEffect(
                        spacing: 10.0,
                        radius: 50.0,
                        dotWidth: 12.0,
                        dotHeight: 12.0,
                        paintStyle: PaintingStyle.fill,
                        strokeWidth: 1.5,
                        dotColor: Colors.grey,
                        activeDotColor: MyColors.mainColor,
                      ),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      elevation: 0,
                      onPressed: () {
                        if (index_page == 3) {
                          canclePage();
                        } else {
                          pageViewController.nextPage(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.fastOutSlowIn,
                          );
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget PageViewItem({
  required String? image,
  required String? title,
  required String? description,
  required double? widthScreen,
}) {
  return Column(
    children: [
      Expanded(
        child: SvgPicture.asset(
          image!,
          width: (widthScreen! * 0.7),
        ),
      ),
      SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title",
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: MyColors.mainColor,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20.0),
              child: Text(
                "$description",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ),
    ],
  );
}
