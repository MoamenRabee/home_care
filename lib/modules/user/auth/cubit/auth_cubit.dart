import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/functions/cache_helper.dart';
import 'package:home_care/functions/generateMd5.dart';
import 'package:home_care/functions/message.dart';
import 'package:home_care/models/user_model.dart';
import 'package:home_care/modules/user/auth/user_login_screen.dart';
import 'package:home_care/theme/theme.dart';
import 'package:meta/meta.dart';

import '../../../../functions/my_navigation.dart';
import '../../layout/user_layout_sreen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  bool isLoading = false;

  bool loginPasswordIsVisiable = true;
  bool passwordIsVisiable = true;
  bool confirmPasswordIsVisiable = true;

  void changeLoginPasswordChange() {
    loginPasswordIsVisiable = !loginPasswordIsVisiable;
    emit(PasswordIsVisiableChange());
  }

  void changePasswordChange() {
    passwordIsVisiable = !passwordIsVisiable;
    emit(PasswordIsVisiableChange());
  }

  void changeConfirmPasswordChange() {
    confirmPasswordIsVisiable = !confirmPasswordIsVisiable;
    emit(PasswordIsVisiableChange());
  }

  Future<void> signUpUser({
    required BuildContext context,
    required String name,
    required String phone,
    required String password,
  }) async {
    isLoading = true;
    emit(SignUpLoading());
    try {
      UserModel userModel = UserModel(
        name: name,
        phone: phone,
        password: generateMd5(password),
        phoneIsVerified: false,
        image: null,
        email: null,
        userFCM: null,
        isBlocked: false,
        points: 0,
      );

      var result =
          await FirebaseFirestore.instance.collection("Users").doc(phone).get();

      if (result.exists) {
        showMessage(message: "المستخدم موجود من قبل", color: Colors.red);
        throw "User Is Exists";
      } else {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(phone)
            .set(userModel.toMap())
            .then((value) {
          CacheHelper.setString(key: "userPhone", value: phone);
          MyNavigator.navigateOffAll(
            context,
            UserLayoutScreen(),
          );
        });
      }

      isLoading = false;
      emit(SignUpSuccess());
    } catch (e) {
      log(e.toString());
      isLoading = false;
      emit(SignUpError(e.toString()));
    }
  }

  Future<void> login({
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    isLoading = true;
    emit(LogInLoading());

    try {
      DocumentSnapshot<Map<String, dynamic>> result =
          await FirebaseFirestore.instance.collection("Users").doc(phone).get();

      if (result.exists) {
        UserModel user = UserModel.fromJson(result.data()!);
        if (user.password == generateMd5(password)) {
          await CacheHelper.setString(key: "userPhone", value: user.phone!)
              .then((value) {
            MyNavigator.navigateOffAll(context, const UserLayoutScreen());
          });
        } else {
          showMessage(
            message: "كلمه المرور غير صحيحة",
            color: MyColors.mainColor,
            textColor: Colors.white,
          );
        }
      } else {
        showMessage(
          message: "الحساب الذي ادخلته غير موجود ٬ من فضلك تآكد من البيانات",
          color: MyColors.mainColor,
          textColor: Colors.white,
        );
      }

      isLoading = false;
      emit(LogInSuccess());
    } catch (e) {
      isLoading = false;
      emit(LogInError(e.toString()));
    }
  }

  void logOut(BuildContext context) {
    CacheHelper.removeKey(key: "userPhone");
    MyNavigator.navigateOffAll(context, UserLoginScreen());
  }
}
