import 'package:blott/utils/constants.dart';
import 'package:blott/utils/dimension.dart';
import 'package:flutter/material.dart';
import '../app_colors.dart';

class BlottMainButton extends StatelessWidget {
  const BlottMainButton({
    super.key,
    this.backgroundColor = kPRYCOLOUR,
    this.cornerRadius = 24,
    this.child,
    required this.text,
    this.textColor = kWHTCOLOUR,
    this.useCustom = false,
    required this.onTap,
  });
  final bool useCustom;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double cornerRadius;
  final Widget? child;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(getScreenHeight(cornerRadius))),
        height: getScreenHeight(48),
        child: Center(
          child: useCustom
              ? child
              : Text(
                  text,
                  style: kTextStyleCustom(color: textColor),
                ),
        ),
      ),
    );
  }
}
