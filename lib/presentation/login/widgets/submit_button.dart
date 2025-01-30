import 'package:flutter/material.dart';
import 'package:pandachat/presentation/login/login_layout.dart';
import '../../values/colors.dart';
import '../../values/strings/localizer.dart';

Widget loginSubmitButton({
  required String name,
  required bool enabled,
  required Function action,
}) {
  return GestureDetector(
    onTap: () => { if (enabled) action() },
    child: Container(
      margin: EdgeInsets.only(bottom: LoginLayout.loginInputBlockMargin) ,
      decoration: BoxDecoration(
        color: enabled ? clrYellow : clrGrey,
        borderRadius: BorderRadius.circular(LoginLayout.borderRadius),
      ),
      padding: EdgeInsets.all(LoginLayout.loginButtonPadding),
      alignment: Alignment.center,
      child: Text(
        Localizer.get(name),
        style: const TextStyle(
          color: clrWhite,
          fontSize: LoginLayout.loginInputBlockFontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}