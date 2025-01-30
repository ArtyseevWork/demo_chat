import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../values/colors.dart';
import '../../values/strings/localizer.dart';
import '../chat_layout.dart';
import '../chat_providers.dart';


Widget header(BuildContext context, WidgetRef ref) {
  return Container(
    decoration: BoxDecoration(
      color: clrWhite,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(ChatLayout.radius),
        bottomRight: Radius.circular(ChatLayout.radius),
      ),
    ),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(ChatLayout.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/panda_logo.png",
                width: ChatLayout.iconSize,
                height: ChatLayout.iconSize
            ),
            Text(
              Localizer.get("app_name"),
              style: TextStyle(
                  fontSize: ChatLayout.fontSize,
                  fontWeight: FontWeight.w500,
                  color: clrRedDark
              ),
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async  {
                await ref.read(chatStateProvider.notifier).logOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    ),
  );
}