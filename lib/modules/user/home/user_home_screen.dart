import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_care/constants/assets.dart';
import 'package:home_care/functions/my_navigation.dart';
import 'package:home_care/models/services_model.dart';
import 'package:home_care/modules/user/sub_category/sub_category_screen.dart';
import 'package:home_care/theme/theme.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: MainServicesModel.mainServices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return _card(context: context,mainServicesModel: MainServicesModel.mainServices[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageSlider({required String image}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        image,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _card({required MainServicesModel mainServicesModel,required BuildContext context}) {
    return GestureDetector(
      onTap: (){
        MyNavigator.navigateTo(context, SubCategoryScreen(mainServicesModel: mainServicesModel));
      },
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SvgPicture.asset(
                mainServicesModel.asset,
                color: MyColors.mainColor,
                height: 90,
              ),
            ),
            Text(
              mainServicesModel.name,
              style: const TextStyle(
                fontSize: 16,
                color: MyColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
