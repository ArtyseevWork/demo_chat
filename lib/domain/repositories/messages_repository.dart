import '../../data/entities/message_data.dart';

//Абстрактний репозиторій. В основному реалізується в тому випадку, якщо є кілька
// джерел даних.
abstract class MessagesRepository {
  Stream<MessageData> get incomingMessages;
  Future<void> sendMessage(MessageData messageData);
  Future<void> connect();
  Future<void> disconnect();
}