import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_care/functions/my_navigation.dart';
import 'package:home_care/modules/user/auth/user_login_screen.dart';
import 'package:home_care/modules/user/layout/user_layout_sreen.dart';
import 'package:home_care/theme/theme.dart';
import 'package:home_care/widgets/buttons.dart';
import 'package:home_care/widgets/my_scaffold.dart';
import 'package:home_care/widgets/textFormField.dart';

import '../../../constants/assets.dart';
import 'cubit/auth_cubit.dart';

class UserSignUpScreen extends StatelessWidget {
  UserSignUpScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return MyScaffold(
          title: const Text(
            "إنشاء حساب",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        text: "الآسم ثلاثي",
                        controller: nameController,
                        isFilld: true,
                        color: MyColors.mainColor.withOpacity(0.1),
                        textColor: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "يرجي إدخال الاسم";
                          }
                          if (val.trim().split(" ").length < 3) {
                            return "يرجي إدخال الاسم ثلاثي";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        text: "رقم الهاتف",
                        controller: phoneController,
                        isFilld: true,
                        keyboardType: TextInputType.phone,
                        color: MyColors.mainColor.withOpacity(0.1),
                        textColor: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "يرجي إدخال رقم الهاتف";
                          }
                          if (val.length != 11) {
                            return "يرجي إدخال رقم الهاتف صحيح";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        text: "كلمة المرور",
                        controller: passwordController,
                        isFilld: true,
                        isPassword: cubit.passwordIsVisiable,
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changePasswordChange();
                          },
                          icon: cubit.passwordIsVisiable
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        color: MyColors.mainColor.withOpacity(0.1),
                        textColor: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "يرجي إدخال كلمة المرور";
                          }
                          if (val.length < 8) {
                            return "يجب ان تكون آكثر من ٨ حروف";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        text: "تآكيد كلمة المرور",
                        controller: confirmPasswordController,
                        isFilld: true,
                        isPassword: cubit.confirmPasswordIsVisiable,
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changeConfirmPasswordChange();
                          },
                          icon: cubit.confirmPasswordIsVisiable
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        color: MyColors.mainColor.withOpacity(0.1),
                        textColor: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "يرجي إدخال كلمة المرور";
                          }
                          if (val.length < 8) {
                            return "يجب ان تكون آكثر من ٨ حروف";
                          }
                          if (val != passwordController.text) {
                            return "كلمة السر غير متشابه ، يرجي التآكد منها";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      cubit.isLoading
                          ? CustomButtonLoading(
                              color: MyColors.mainColor,
                              textColor: Colors.white,
                              fontSize: 16,
                              height: 55,
                              width: 400,
                              borderRadius: BorderRadius.circular(20),
                            )
                          : CustomButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await cubit.signUpUser(
                                    context: context,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: "إنشاء الحساب",
                              color: MyColors.mainColor,
                              fontSize: 16,
                              height: 55,
                              width: 400,
                              borderRadius: BorderRadius.circular(20),
                            ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("لديك حساب ؟"),
                          TextButton(
                            onPressed: () {
                              MyNavigator.navigateOff(
                                  context, UserLoginScreen());
                            },
                            child: const Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                color: MyColors.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
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
