import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pandachat/presentation/chat/widgets/header.dart';
import 'package:pandachat/presentation/chat/widgets/main_area.dart';
import 'package:pandachat/presentation/chat/widgets/text_field_area.dart';
import 'package:pandachat/presentation/values/colors.dart';

// Сторінка чату
class ChatScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: clrGrey,
      body: Column(
        children: [
          header(context, ref),
          mainArea(context, ref),
          textFieldArea(context, ref),
        ],
      ),
    );
  }

}
