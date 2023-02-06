import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_care/constants/assets.dart';
import 'package:home_care/models/services_model.dart';
import 'package:home_care/theme/theme.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            CarouselSlider(
                items: [
                  _imageSlider(image: Assets.sliderImage1),
                  _imageSlider(image: Assets.sliderImage2),
                  _imageSlider(image: Assets.sliderImage3),
                  _imageSlider(image: Assets.sliderImage4),
                  _imageSlider(image: Assets.sliderImage5),
                  _imageSlider(image: Assets.sliderImage6),
                  _imageSlider(image: Assets.sliderImage7),
                ],
                options: CarouselOptions(
                  aspectRatio: 16 / 7,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: ServicesModel.services.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return _card(servicesModel: ServicesModel.services[index]);
                },
              ),
            ),
          ],
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

  Widget _card({required ServicesModel servicesModel}) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: MyColors.mainColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 1)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            servicesModel.asset,
            width: 100,
            color: Colors.white,
          ),
          Text(
            servicesModel.name,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
