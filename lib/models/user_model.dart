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
    points = json["points"];
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
    };
  }
}
