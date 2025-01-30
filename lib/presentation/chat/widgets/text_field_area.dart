import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../values/colors.dart';
import '../../values/strings/localizer.dart';
import '../chat_layout.dart';
import '../chat_providers.dart';


Widget textFieldArea(BuildContext context, WidgetRef ref) {
  final TextEditingController _messageController = TextEditingController();

  return Container(
    decoration: BoxDecoration(
      color: clrWhite,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(ChatLayout.radius),
        topRight: Radius.circular(ChatLayout.radius),
      ),
    ),
    padding: const EdgeInsets.all(ChatLayout.padding),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: Localizer.get('text_field_hint'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            final text = _messageController.text.trim();
            if (text.isNotEmpty) {
              ref.read(chatStateProvider.notifier).sendMessage(text);
              _messageController.clear();
            }
          },
        ),
      ],
    ),
  );
}