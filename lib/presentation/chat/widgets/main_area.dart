import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../chat_providers.dart';
import 'message.dart';

Widget mainArea(BuildContext context, WidgetRef ref) {
  final ScrollController _scrollController = ScrollController();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  });

  final chatState = ref.watch(chatStateProvider);

  if (chatState.error.isNotEmpty) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          chatState.error!,
          style: TextStyle(color: Colors.red, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  return Expanded(
    child: ListView.builder(
      controller: _scrollController,
      itemCount: chatState.messages.length,
      itemBuilder: (context, index) {
        return message(context, chatState.messages[index]);
      },
    ),
  );
}
