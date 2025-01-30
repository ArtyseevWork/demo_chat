import '../../domain/entities/message.dart';

//модель зберігання стану сторінки
class ChatState{
  final List<Message> messages;
  final bool isLoading;
  final String error;

  ChatState({
    required this.messages,
    this.isLoading = false,
    this.error = "",
  });

  ChatState addMessage(Message newMessage){
    return copyWith(
      messages: [...messages, newMessage]
    );
  }

  ChatState copyWith({
    List<Message>? messages,
    bool? isLoading,
    String? error,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      error: error?? this.error,
    );
  }
}