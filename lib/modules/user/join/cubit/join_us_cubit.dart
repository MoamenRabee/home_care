import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/functions/cache_helper.dart';
import 'package:home_care/functions/message.dart';
import 'package:home_care/functions/uploud_file.dart';
import 'package:home_care/models/user_model.dart';
import 'package:meta/meta.dart';

part 'join_us_state.dart';

class JoinUsCubit extends Cubit<JoinUsState> {
  JoinUsCubit() : super(JoinUsInitial());

  static JoinUsCubit get(BuildContext context) => BlocProvider.of(context);

  bool isLoading = false;
  bool isLoadingSend = false;
  bool idCardIsLoading = false;
  bool imageIsLoading = false;
  bool workPageIsLoading = false;

  String? selectedMainService;
  String? selectedSubService;

  UserModel? myProfile;

  void selectServices() {
    selectedSubService=null;
    emit(SelectServicesState());

  }
    void selectSubServices() {
    emit(SelectServicesState());

  }

  void uploadWorkPage() async {
    workPageIsLoading = true;
    emit(UploadLoading());
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);

        String fileUrl = await uploadFile(
          refName: "WorkPages",
          bytes: file.readAsBytesSync(),
          fileExtension: result.files.single.extension!,
        );

        String myPhoneNymber = CacheHelper.getString(key: "userPhone") ?? "";

        if (myPhoneNymber != "") {
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(myPhoneNymber)
              .update({"imageWorkingPage": fileUrl});
        } else {
          showMessage(message: "حدث خطآ غير معروف", color: Colors.red);
        }
      } else {
        showMessage(message: "لم يتم تحديد صورة", color: Colors.red);
      }
      getMyProfile();
      workPageIsLoading = false;
      emit(UploadSuccess());
    } catch (e) {
      log(e.toString());
      workPageIsLoading = false;
      emit(UploadError(e.toString()));
    }
  }

  void uploadImageProfile() async {
    imageIsLoading = true;
    emit(UploadLoading());
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);

        String fileUrl = await uploadFile(
          refName: "ProfileImages",
          bytes: file.readAsBytesSync(),
          fileExtension: result.files.single.extension!,
        );

        String myPhoneNymber = CacheHelper.getString(key: "userPhone") ?? "";

        if (myPhoneNymber != "") {
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(myPhoneNymber)
              .update({"image": fileUrl});
        } else {
          showMessage(message: "حدث خطآ غير معروف", color: Colors.red);
        }
      } else {
        showMessage(message: "لم يتم تحديد صورة", color: Colors.red);
      }
      getMyProfile();
      imageIsLoading = false;

      emit(UploadSuccess());
    } catch (e) {
      log(e.toString());
      imageIsLoading = false;
      emit(UploadError(e.toString()));
    }
  }

  void uploadIdCard() async {
    idCardIsLoading = true;
    emit(UploadLoading());
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);

        String fileUrl = await uploadFile(
          refName: "IdCards",
          bytes: file.readAsBytesSync(),
          fileExtension: result.files.single.extension!,
        );

        String myPhoneNymber = CacheHelper.getString(key: "userPhone") ?? "";

        if (myPhoneNymber != "") {
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(myPhoneNymber)
              .update({"imageIdCard": fileUrl});
        } else {
          showMessage(message: "حدث خطآ غير معروف", color: Colors.red);
        }
      } else {
        showMessage(message: "لم يتم تحديد صورة", color: Colors.red);
      }
      getMyProfile();
      idCardIsLoading = false;
      emit(UploadSuccess());
    } catch (e) {
      log(e.toString());
      idCardIsLoading = false;
      emit(UploadError(e.toString()));
    }
  }

  Future<void> joinUs({
    required String email,
    required String mainService,
    required String subService,
  }) async {
    isLoadingSend = true;
    emit(JoinUsLoading());
    try {
      if (myProfile!.imageIdCard == null &&
          myProfile!.imageWorkingPage == null &&
          myProfile!.image == null) {
        showMessage(message: "يرجي تحديد الصور", color: Colors.red);
      } else {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(myProfile!.phone)
            .update({
          "email": email,
          "subServiceId": subService,
          "mainServiceId": mainService,
          "isPartner": true,
        });

        await FirebaseFirestore.instance
            .collection("JoinUsRequsets")
            .doc(myProfile!.phone)
            .set({
          "phone": myProfile!.phone,
        });
      }
      getMyProfile();
      isLoadingSend = false;
      emit(JoinUsSuccess());
    } catch (e) {
      log(e.toString());
      isLoadingSend = false;
      emit(JoinUsError(e.toString()));
    }
  }

  void getMyProfile() async {
    isLoading = true;
    emit(GetProfileLoading());
    try {
      String myPhoneNymber = CacheHelper.getString(key: "userPhone") ?? "";
      var result = await FirebaseFirestore.instance
          .collection("Users")
          .doc(myPhoneNymber)
          .get();

      if (result.exists) {
        myProfile = UserModel.fromJson(result.data()!);
      }

      isLoading = false;
      emit(GetProfileSuccess());
    } catch (e) {
      log(e.toString());
      isLoading = false;
      emit(GetProfileError(e.toString()));
    }
  }
}
