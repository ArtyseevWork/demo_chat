import 'dart:async';
import 'dart:convert';
import '../../domain/repositories/messages_repository.dart';
import '../data_sources/messages_stream_source.dart';
import '../entities/message_data.dart';

//Реалізація репозиторію. В основному реалізується в тому випадку, якщо є кілька
// джерел даних.
class MessagesRepositoryImpl  implements MessagesRepository {
  final MessagesStreamSource messagesStreamSource;

  MessagesRepositoryImpl(this.messagesStreamSource);

  @override
  Stream<MessageData>get incomingMessages => messagesStreamSource.messageStream;

  @override
  Future<void> sendMessage(MessageData messageData) async {
    messagesStreamSource.sendMessage(json.encode(messageData.toJson()));
  }

  @override
  Future<void> connect() async {
    messagesStreamSource.connect();
  }

  @override
  Future<void> disconnect() async {
  messagesStreamSource.disconnect();
  }

}