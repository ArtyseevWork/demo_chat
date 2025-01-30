import 'package:flutter/material.dart';

import '../../values/colors.dart';
import '../login_layout.dart';

Widget errorArea(String errorText){
  return SizedBox(
    child: (errorText.isNotEmpty) ? Text(
      textAlign: TextAlign.left,
      errorText,
      style: const TextStyle(
          color: clrRed
      ),
    ) : Container(),
  );
}