import 'package:pandachat/data/entities/message_data.dart';
import '../repositories/messages_repository.dart';

//UseCase для відправки повідомлення
class SendMessageUc {
  final MessagesRepository messagesRepository;
  SendMessageUc(this.messagesRepository);

  Future<bool> call(MessageData messageData) async {
    await messagesRepository.sendMessage(messageData);
    return true;
  }
}