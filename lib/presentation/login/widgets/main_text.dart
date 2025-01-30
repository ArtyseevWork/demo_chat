import 'package:flutter/material.dart';
import '../../values/colors.dart';
import '../../values/strings/localizer.dart';
import '../login_layout.dart';

Widget get mainText{
  return Text(
    Localizer.get('app_name'),
    style: TextStyle(
      color: clrRedDark,
      fontWeight: FontWeight.w500,
      fontSize: LoginLayout.appNameFontSize,
    ),
  );
}