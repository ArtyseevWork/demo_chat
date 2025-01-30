import '../../data/entities/message_data.dart';
import '../repositories/messages_repository.dart';

//UseCase для підключення до веб-сокета
class ListenMessagesUc {
  final MessagesRepository messagesRepository;
  Stream<MessageData>get incomingMessages=> messagesRepository.incomingMessages;
  ListenMessagesUc(this.messagesRepository);

  // Подключение к WebSocket
  void call() {
    messagesRepository.connect();
  }
}