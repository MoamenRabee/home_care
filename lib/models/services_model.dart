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
        ServicesModel(name: "اوعية دموية", id: "1"),
        ServicesModel(name: "انف و أذن", id: "2"),
        ServicesModel(name: "جراحة عامة", id: "3"),
        ServicesModel(name: "وجه و فكين", id: "4"),
        ServicesModel(name: "قلب و صدر", id: "5"),
        ServicesModel(name: "اطفال", id: "6"),
        ServicesModel(name: "رمد و عيون", id: "7"),
        ServicesModel(name: "شرج وقولون", id: "8"),
        ServicesModel(name: "كلى و مسالك", id: "9"),
        ServicesModel(name: "مخ و اعصاب", id: "10"),
        ServicesModel(name: "نسا و توليد", id: "11"),
        ServicesModel(name: "باطنة عانة", id: "12"),
        ServicesModel(name: "عظام", id: "13"),
      ],
    ),
    MainServicesModel(
      name: "تمريض",
      asset: Assets.nurseSVG,
      id: "2",
      services: [
        ServicesModel(name: "تركيب محلول", id: "14"),
        ServicesModel(name: "اختبار حساسية", id: "15"),
        ServicesModel(name: "حقنة وريد", id: "16"),
        ServicesModel(name: "حقنة عضل", id: "17"),
        ServicesModel(name: "تركيب قسطرة بولية", id: "18"),
        ServicesModel(name: "تركيب آنبوبة معدة", id: "19"),
        ServicesModel(name: "عمل حقنة شرجية", id: "20"),
        ServicesModel(name: "تمريض حالات العناية المركزة", id: "21"),
        ServicesModel(name: "تمريض لكبار السن", id: "22"),
        ServicesModel(name: "جليس لكبار السن", id: "23"),
        ServicesModel(name: "تمريض لذوي الاعاقة", id: "24"),
        ServicesModel(name: "غيار جروح بسيطة", id: "25"),
        ServicesModel(name: "غيار جروح متوسطة", id: "26"),
        ServicesModel(name: "غيار جروح كبيرة", id: "27"),
      ],
    ),
    MainServicesModel(
      name: "الآشعة",
      asset: Assets.xRaySVG,
      id: "3",
      services: [
        ServicesModel(name: "X-RAY", id: "28"),
        ServicesModel(name: "اشعة موجات صوتية", id: "29"),
        ServicesModel(name: "ايكو علي القلب", id: "30"),
        ServicesModel(name: "دوبلر اوردة و شرايين", id: "31"),
        ServicesModel(name: "رسم عصب", id: "32"),
        ServicesModel(name: "رسم قلب", id: "33"),
      ],
    ),
    MainServicesModel(
      name: "معمل تحاليل",
      asset: Assets.laboratorySVG,
      id: "4",
      services: [
        ServicesModel(name: "بول", id: "34"),
        ServicesModel(name: "براز", id: "35"),
        ServicesModel(name: "ميكروب حلزوني", id: "36"),
        ServicesModel(name: "سكر صائم", id: "37"),
        ServicesModel(name: "سكر فاطر", id: "38"),
        ServicesModel(name: "سكر تراكمي", id: "39"),
        ServicesModel(name: "مزرعة بول", id: "40"),
        ServicesModel(name: "وظائف كبد", id: "41"),
        ServicesModel(name: "وظائف كلي", id: "42"),
        ServicesModel(name: "صورة دم كاملة", id: "43"),
        ServicesModel(name: "فيروس C", id: "44"),
        ServicesModel(name: "فيروس B", id: "45"),
        ServicesModel(name: "دهون ثلاثية", id: "46"),
        ServicesModel(name: "فصيلة دم", id: "47"),
        ServicesModel(name: "إنزيمات القلب", id: "48"),
        ServicesModel(name: "INR", id: "49"),
        ServicesModel(name: "PT & PTT", id: "50"),
        ServicesModel(name: "T3 & T4", id: "51"),
        ServicesModel(name: "TSH", id: "52"),
        ServicesModel(name: "HIV", id: "53"),
      ],
    ),
    MainServicesModel(
      name: "كشف بيطري",
      asset: Assets.petsSVG,
      id: "5",
      services: [
        ServicesModel(name: "قطط", id: "54"),
        ServicesModel(name: "كلاب", id: "55"),
      ],
    ),
    MainServicesModel(
      name: "علاج طبيعي",
      asset: Assets.kneecapSVG,
      id: "6",
      services: [
        ServicesModel(name: "آخصائي علاج طبيعي", id: "56"),
        ServicesModel(name: "طبيب علاج طبيعي", id: "57"),
      ],
    ),
  ];
}

class ServicesModel {
  String name;
  String id;
  ServicesModel({required this.name, required this.id});
}
