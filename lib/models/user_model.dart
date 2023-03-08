import 'dart:convert';

class UserModel {
  String? name;
  String? phone;
  bool? phoneIsVerified;
  String? password;
  String? image;
  String? email;
  String? userFCM;
  bool? isBlocked;
  double? points;
  bool? isVerified;
  bool? isPartner;
  String? mainServiceId;
  String? subServiceId;
  String? imageIdCard;
  String? imageWorkingPage;


  UserModel({
    this.name,
    this.phone,
    this.phoneIsVerified,
    this.password,
    this.image,
    this.email,
    this.userFCM,
    this.isBlocked,
    this.points,
    this.isVerified,
    this.isPartner,
    this.mainServiceId,
    this.subServiceId,
    this.imageIdCard,
    this.imageWorkingPage,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    phone = json["phone"];
    phoneIsVerified = json["phoneIsVerified"];
    password = json["password"];
    image = json["image"];
    email = json["email"];
    userFCM = json["userFCM"];
    isBlocked = json["isBlocked"];
    isVerified = json["isVerified"];
    isPartner = json["isPartner"];
    mainServiceId = json["mainServiceId"];
    subServiceId = json["subServiceId"];
    imageIdCard = json["imageIdCard"];
    imageWorkingPage = json["imageWorkingPage"];
  }


  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "phone": phone,
      "phoneIsVerified": phoneIsVerified,
      "password": password,
      "image": image,
      "email": email,
      "userFCM": userFCM,
      "isBlocked": isBlocked,
      "points": points,
      "isVerified": isVerified,
      "isPartner": isPartner,
      "mainServiceId": mainServiceId,
      "subServiceId": subServiceId,
      "imageIdCard": imageIdCard,
      "imageWorkingPage": imageWorkingPage,
    };
  }
}
