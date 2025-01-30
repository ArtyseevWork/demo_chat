import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../values/colors.dart';
import '../login_layout.dart';


Widget loginInputBlock({
  required String name,
  required String hint,
  required bool isCorrect,
  required Function(String) onTextChanged,
  required bool isPassword,
}) {

  return  Container(
    margin: EdgeInsets.only(
      bottom: LoginLayout.loginInputBlockMargin,
    ),
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: clrWhite,
            borderRadius: BorderRadius.circular(LoginLayout.borderRadius),
            border: Border.all(
              color: clrRedDark,
              width: LoginLayout.borderWidth,
            ),
          ),
          child:
            Container(
              margin: EdgeInsets.only(
                  top:LoginLayout.loginInputBlockMargin,
                  left: LoginLayout.loginInputBlockMargin
              ),
              child: TextFormField(

                obscureText: isPassword,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                onChanged: onTextChanged,
                onFieldSubmitted: onTextChanged,
                autocorrect: false,
                cursorColor: clrBlack,
                autofocus: false,
                maxLines: 1,
                style: const TextStyle(
                  color: clrBlack,
                  fontSize: LoginLayout.loginInputBlockFontSize,
                  fontWeight:FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(color: clrGrey),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                      bottom: LoginLayout.loginInputBlockPadding
                  ),
                ),
              ),
            ),
        ),

        Container(
          color: clrWhite,
          margin: EdgeInsets.only(left: LoginLayout.inputBlockMarginTopText),
          padding: EdgeInsets.symmetric(
              horizontal: LoginLayout.inputBlockPadding
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: LoginLayout.inputBlockFontSizeTop,
              color: isCorrect ? clrRedDark : clrRed,
            ),
          ),
        ),
      ],
    ),
  );
}