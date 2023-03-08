import 'package:home_care/constants/assets.dart';

class MainServicesModel {
  String name;
  String asset;
  String id;
  List<ServicesModel> services;
  MainServicesModel(
      {required this.name,
      required this.asset,
      required this.id,
      required this.services});

  static List<MainServicesModel> mainServices = [
    MainServicesModel(
      name: "كشف طبيب",
      asset: Assets.doctorSVG,
      id: "1",
      services: [
        ServicesModel(name: "name", id: "1"),
        ServicesModel(name: "name", id: "2"),
        ServicesModel(name: "name", id: "3"),
      ],
    ),
    MainServicesModel(
      name: "تمريض",
      asset: Assets.nurseSVG,
      id: "2",
      services: [
        ServicesModel(name: "name", id: "4"),
        ServicesModel(name: "name", id: "5"),
        ServicesModel(name: "name", id: "6"),
      ],
    ),
    MainServicesModel(
      name: "الآشعة",
      asset: Assets.xRaySVG,
      id: "3",
      services: [
        ServicesModel(name: "name", id: "7"),
        ServicesModel(name: "name", id: "8"),
        ServicesModel(name: "name", id: "9"),
      ],
    ),
    MainServicesModel(
      name: "معمل تحاليل",
      asset: Assets.laboratorySVG,
      id: "4",
      services: [
        ServicesModel(name: "name", id: "10"),
        ServicesModel(name: "name", id: "11"),
        ServicesModel(name: "name", id: "12"),
      ],
    ),
    MainServicesModel(
      name: "كشف بيطري",
      asset: Assets.petsSVG,
      id: "5",
      services: [
        ServicesModel(name: "name", id: "13"),
        ServicesModel(name: "name", id: "14"),
        ServicesModel(name: "name", id: "15"),
      ],
    ),
    MainServicesModel(
      name: "علاج طبيعي",
      asset: Assets.kneecapSVG,
      id: "6",
      services: [
        ServicesModel(name: "name", id: "16"),
        ServicesModel(name: "name", id: "17"),
        ServicesModel(name: "name", id: "18"),
      ],
    ),
  ];
}

class ServicesModel {
  String name;
  String id;
  ServicesModel({required this.name, required this.id});
}
