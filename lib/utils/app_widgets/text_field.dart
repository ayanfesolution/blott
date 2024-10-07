import 'package:blott/utils/dimension.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../constants.dart';

class BlottTextField extends StatelessWidget {
  const BlottTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.enable = true,
    this.keyboardType,
    this.obscureText = false,
    this.onEditingComplete,
    this.suffixIcon,
    this.onChange,
    this.icon,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool enable, obscureText;
  final TextInputType? keyboardType;
  final Function()? onEditingComplete;
  final Widget? suffixIcon;
  final Function(String)? onChange;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final UnderlineInputBorder outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(
      color: Color(0XFFD4D4D4),
    ));

    return TextFormField(
      controller: controller,
      validator: validator,
      enabled: enable,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onEditingComplete: onEditingComplete,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: ' $hintText',
        filled: true,
        fillColor: Colors.transparent,
        prefixIcon: icon,
        hintStyle: kTextStyleCustom(fontSize: 14, color: kLightGray),
        enabledBorder: outlineInputBorder,
        border: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(getScreenHeight(15)),
          borderSide: BorderSide(
            width: getScreenHeight(1),
            style: BorderStyle.solid,
            color: kREDCOLOUR,
          ),
        ),
        errorStyle: kTextStyleCustom(color: kSECCOLOUR, fontSize: 10),
        focusedBorder: outlineInputBorder,
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(getScreenHeight(15)),
          borderSide: BorderSide(
            width: getScreenHeight(1),
            style: BorderStyle.solid,
            color: kREDCOLOUR,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
