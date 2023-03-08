import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_care/functions/my_validate.dart';
import 'package:home_care/models/services_model.dart';
import 'package:home_care/modules/user/auth/user_signup_screen.dart';

import '../../../constants/assets.dart';
import '../../../functions/my_navigation.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/my_scaffold.dart';
import '../../../widgets/textFormField.dart';
import '../layout/user_layout_sreen.dart';
import 'cubit/join_us_cubit.dart';

class JoinUsScreen extends StatelessWidget {
  JoinUsScreen({super.key});

  TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    JoinUsCubit cubit = JoinUsCubit.get(context);
    cubit.getMyProfile();
    return BlocConsumer<JoinUsCubit, JoinUsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MyScaffold(
            leading: IconButton(
              splashRadius: 25,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: const Text(
              "انضم لنا",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                    right: 20,
                    left: 20,
                    bottom: 20,
                  ),
                  child: cubit.myProfile?.isPartner == true
                      ? cubit.myProfile?.isVerified == false
                          ? const Center(
                              child: Text("تتم الآن مراجعة الملف الخاص بك"),
                            )
                          : const Text("تم قبول الطلب")
                      : Column(
                          children: [
                            if (cubit.isLoading)
                              const LinearProgressIndicator(
                                color: Colors.white54,
                              ),
                            const SizedBox(height: 20),
                            IgnorePointer(
                              ignoring: cubit.isLoading,
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomTextFormField(
                                      text: "البريد الالكتروني",
                                      controller: emailController,
                                      isFilld: true,
                                      color:
                                          MyColors.mainColor.withOpacity(0.1),
                                      textColor: Colors.black,
                                      keyboardType: TextInputType.emailAddress,
                                      borderRadius: BorderRadius.circular(20),
                                      validator: (val) {
                                        if (val!.isValidEmail() == false) {
                                          return "يرجي إدخال بريد إليكتروني صحيح";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: DropdownButtonFormField<String>(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: MyFonts.myFont,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        alignment: Alignment.centerRight,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: MyColors.mainColor
                                              .withOpacity(0.1),
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 17,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        elevation: 1,
                                        dropdownColor: Colors.white,
                                        menuMaxHeight: 300,
                                        hint: const Text(
                                          'اختر التخصص الرئيسي',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        onChanged: (val) {
                                          cubit.selectedMainService = val;
                                          cubit.selectServices();
                                        },
                                        validator: (val) {
                                          if (val == null) {
                                            return "يرجي اختيار التخصص الرئيسي";
                                          }
                                        },
                                        items: [
                                          ...List.generate(
                                              MainServicesModel.mainServices
                                                  .length, (index) {
                                            return DropdownMenuItem<String>(
                                              value: MainServicesModel
                                                  .mainServices[index].id,
                                              alignment: Alignment.center,
                                              child: Text(MainServicesModel
                                                  .mainServices[index].name),
                                            );
                                          })
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    IgnorePointer(
                                      ignoring:
                                          cubit.selectedMainService == null,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: DropdownButtonFormField<String>(
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: MyFonts.myFont,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          alignment: Alignment.centerRight,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: MyColors.mainColor
                                                .withOpacity(0.1),
                                            border: InputBorder.none,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 17,
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          elevation: 1,
                                          dropdownColor: Colors.white,
                                          menuMaxHeight: 300,
                                          hint: const Text(
                                            'اختر التخصص الفرعي',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          onChanged: (val) {
                                            cubit.selectedSubService = val;
                                            cubit.selectServices();
                                          },
                                          validator: (val) {
                                            if (val == null) {
                                              return "يرجي اختيار التخصص الفرعي";
                                            }
                                          },
                                          items: [
                                            if (cubit.selectedMainService !=
                                                null)
                                              ...List.generate(
                                                  MainServicesModel.mainServices
                                                      .where((element) =>
                                                          element.id ==
                                                          cubit
                                                              .selectedMainService)
                                                      .first
                                                      .services
                                                      .length, (index) {
                                                return DropdownMenuItem<String>(
                                                  value: MainServicesModel
                                                      .mainServices
                                                      .where((element) =>
                                                          element.id ==
                                                          cubit
                                                              .selectedMainService)
                                                      .first
                                                      .services[index]
                                                      .id,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    MainServicesModel
                                                        .mainServices
                                                        .where((element) =>
                                                            element.id ==
                                                            cubit
                                                                .selectedMainService)
                                                        .first
                                                        .services[index]
                                                        .name,
                                                  ),
                                                );
                                              })
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                cubit.uploadImageProfile();
                                              },
                                              child:
                                                  cubit.myProfile?.image != null
                                                      ? const Icon(
                                                          Icons.done,
                                                          size: 40,
                                                          color: Colors.grey,
                                                        )
                                                      : const Icon(
                                                          Icons.image,
                                                          size: 40,
                                                          color: Colors.grey,
                                                        ),
                                            ),
                                            Text(
                                              cubit.imageIsLoading
                                                  ? "جاري الإرسال ..."
                                                  : "آختر صورة شخصية",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                cubit.uploadIdCard();
                                              },
                                              child: cubit.myProfile
                                                          ?.imageIdCard !=
                                                      null
                                                  ? const Icon(
                                                      Icons.done,
                                                      size: 40,
                                                      color: Colors.grey,
                                                    )
                                                  : const Icon(
                                                      Icons.image,
                                                      size: 40,
                                                      color: Colors.grey,
                                                    ),
                                            ),
                                            Text(
                                              cubit.idCardIsLoading
                                                  ? "جاري الإرسال ..."
                                                  : "آختر صورة البطاقة",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                cubit.uploadWorkPage();
                                              },
                                              child: cubit.myProfile
                                                          ?.imageWorkingPage !=
                                                      null
                                                  ? const Icon(
                                                      Icons.done,
                                                      size: 40,
                                                      color: Colors.grey,
                                                    )
                                                  : const Icon(
                                                      Icons.image,
                                                      size: 40,
                                                      color: Colors.grey,
                                                    ),
                                            ),
                                            Text(
                                              cubit.workPageIsLoading
                                                  ? "جاري الإرسال ..."
                                                  : "آختر مزاولة المهنة",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    cubit.isLoadingSend
                                        ? CustomButtonLoading(
                                            color: MyColors.mainColor,
                                            fontSize: 16,
                                            height: 55,
                                            width: 400,
                                            textColor: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          )
                                        : CustomButton(
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                cubit.joinUs(
                                                  email: emailController.text,
                                                  mainService: cubit
                                                      .selectedMainService!,
                                                  subService:
                                                      cubit.selectedSubService!,
                                                );
                                              }
                                            },
                                            text: "إرسال للمراجعة",
                                            color: MyColors.mainColor,
                                            fontSize: 16,
                                            height: 55,
                                            width: 400,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
