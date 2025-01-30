import 'dart:async';
import '../entities/message_data.dart';

//Абстрактний класс - вимоги для реалізації взаємодії зі "сховищем" повідомлень
abstract class MessagesStreamSource {
  void connect();
  void disconnect();
  void sendMessage(String jsonMessage);
  Stream<MessageData> get messageStream;

}
