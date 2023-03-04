import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/theme.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.text,
    required this.controller,
    this.textColor,
    this.keyboardType,
    this.isPassword,
    this.color,
    this.isFilld,
    this.enabled,
    this.suffixIcon,
    this.maxLines,
    this.borderRadius,
    this.validator,
    this.fontFamily,
    this.maxLength,
  });

  String text;
  Color? textColor;
  Color? color;
  TextInputType? keyboardType;
  bool? isPassword;
  TextEditingController controller;
  bool? isFilld;
  bool? enabled;
  Widget? suffixIcon;
  int? maxLines;
  BorderRadius? borderRadius;
  String? Function(String?)? validator;
  String? fontFamily;
  int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      validator: validator,
      enabled: enabled,
      maxLength: maxLength,
      style: TextStyle(
        color: isFilld != null && isFilld == true ? Colors.black : Colors.white,
        fontFamily: fontFamily,
      ),
      maxLines: maxLines ?? 1,
      minLines: maxLines ?? 1,
      obscureText: isPassword ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: isFilld,
        fillColor: color ?? Colors.white,
        hintText: text,
        hintStyle: TextStyle(
          fontFamily: MyFonts.myFont,
          color:
              isFilld != null && isFilld == true ? Colors.grey : Colors.white,
        ),
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(20),
          borderSide: const BorderSide(color: MyColors.mainColor, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
      ),
      cursorColor: isFilld == true ? MyColors.mainColor : Colors.white,
    );
  }
}
