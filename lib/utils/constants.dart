import 'package:blott/utils/app_colors.dart';
import 'package:blott/utils/dimension.dart';
import 'package:flutter/material.dart';

const kFirstLaunch = 'first_launch';

const kFirstName = 'firstName';

const kLastName = 'lastName';

const kNotificationStatus = 'notificationStatus';

TextStyle kTextStyleCustom({
  Color color = kBLKCOLOUR,
  double fontSize = 16,
  FontStyle fontStyle = FontStyle.normal,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return TextStyle(
    fontSize: getScreenHeight(fontSize),
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    color: color,
  );
}

Widget yMargin(double size) {
  return SizedBox(
    height: getScreenHeight(size),
  );
}

Widget xMargin(double size) {
  return SizedBox(
    width: getScreenWidth(size),
  );
}
