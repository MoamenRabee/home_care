import 'package:home_care/constants/assets.dart';

class ServicesModel{
  String name;
  String asset;
  String route;
  ServicesModel({required this.name,required this.asset,required this.route});

  static List<ServicesModel> services = [
    ServicesModel(name: "كشف طبيب", asset: Assets.doctorSVG, route: ""),
    ServicesModel(name: "تمريض", asset: Assets.nurseSVG, route: ""),
    ServicesModel(name: "الآشعة", asset: Assets.xRaySVG, route: ""),
    ServicesModel(name: "معمل تحاليل", asset: Assets.laboratorySVG, route: ""),
    ServicesModel(name: "كشف بيطري", asset: Assets.petsSVG, route: ""),
    ServicesModel(name: "علاج طبيعي", asset: Assets.kneecapSVG, route: ""),
  ];


}