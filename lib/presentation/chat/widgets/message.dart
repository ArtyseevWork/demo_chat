import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pandachat/core/constants.dart';
import '../../../domain/entities/message.dart';
import '../../values/colors.dart';
import '../chat_layout.dart';


Widget message(BuildContext context, Message message) {
  return ListTile(
    title: Align(
      alignment: message.isIncoming ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(ChatLayout.padding),
        decoration: BoxDecoration(
          color: message.isIncoming ? clrMessage : clrYellow,
          borderRadius: BorderRadius.circular(ChatLayout.radius),
        ),
        child: Text(message.text),
      ),
    ),
    subtitle: Text(
      DateFormat(Constants.dateFormat).format(
          (message.timestamp)),
      textAlign: message.isIncoming ? TextAlign.left : TextAlign.right,
    ),
  );
}