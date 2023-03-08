import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_care/constants/assets.dart';
import 'package:home_care/functions/my_navigation.dart';
import 'package:home_care/modules/user/auth/user_signup_screen.dart';
import 'package:home_care/modules/user/layout/user_layout_sreen.dart';
import 'package:home_care/theme/theme.dart';
import 'package:home_care/widgets/buttons.dart';
import 'package:home_care/widgets/my_scaffold.dart';
import 'package:home_care/widgets/textFormField.dart';

import 'cubit/auth_cubit.dart';

class UserLoginScreen extends StatelessWidget {
  UserLoginScreen({super.key});

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return MyScaffold(
          title: const Text(
            "تسجيل الدخول",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      Assets.logo,
                      width: 200,
                      height: 200,
                      color: MyColors.mainColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    text: "رقم الهاتف",
                    controller: phoneController,
                    isFilld: true,
                    color: MyColors.mainColor.withOpacity(0.1),
                    textColor: Colors.black,
                    keyboardType: TextInputType.phone,
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
                    isPassword: cubit.loginPasswordIsVisiable,
                    suffixIcon: IconButton(
                      onPressed: () {
                        cubit.changeLoginPasswordChange();
                      },
                      icon: cubit.loginPasswordIsVisiable
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
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("نسيت كلمة السر ؟"),
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
                              await cubit.login(
                                phone: phoneController.text,
                                password: passwordController.text,
                                context: context,
                              );
                            }
                          },
                          text: "دخول الآن",
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
                      const Text("ليس لديك حساب ؟"),
                      TextButton(
                        onPressed: () {
                          MyNavigator.navigateTo(context, UserSignUpScreen());
                        },
                        child: const Text(
                          "إنشاء حساب",
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
        );
      },
    );
  }
}
