import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:home_care/models/services_model.dart';
import 'package:home_care/theme/theme.dart';

import '../../../widgets/my_scaffold.dart';

class SubCategoryScreen extends StatelessWidget {
  SubCategoryScreen({super.key, required this.mainServicesModel});

  MainServicesModel mainServicesModel;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: Text(
        mainServicesModel.name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          ...List.generate(mainServicesModel.services.length, (index) {
            return Container(
              width: 400,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.mainColor.withOpacity(0.1),
                      offset: const Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ]),
              child: Text(
                mainServicesModel.services[index].name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
