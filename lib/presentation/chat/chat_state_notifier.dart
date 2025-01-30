import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pandachat/domain/usecases/logout_uc.dart';
import '../../core/constants.dart';
import '../../data/entities/message_data.dart';
import '../../domain/usecases/get_current_user_uc.dart';
import '../../domain/usecases/listen_messages_uc.dart';
import '../../domain/usecases/send_message_uc.dart';
import 'chat_state.dart';

//Керування станом за допомогою riverpod
class ChatStateNotifier extends StateNotifier<ChatState> {
  final ListenMessagesUc listenMessageUseCase;
  final SendMessageUc sendMessageUseCase;
  final GetCurrentUserUc getCurrentUserUc;
  final LogOutUc logOutUc;
  String currentUserId = "";

  ChatStateNotifier(
    this.listenMessageUseCase,
    this.sendMessageUseCase,
    this.getCurrentUserUc,
    this.logOutUc,
  ) : super(ChatState(messages: [])) {
    try{
      listenMessageUseCase.call();
      _listenToIncomingMessages();
      var currentUser = getCurrentUserUc.call();
      if (currentUser != null){
        currentUserId = currentUser.id;
      } else {
        state = state.copyWith(error: "Something went wrong") ;
      }
    } catch (e) {
      print(88888);
      state = state.copyWith(error: e.toString()) ;
    }
  }

  // Слушаем входящие сообщения
  void _listenToIncomingMessages() {
    try {
      listenMessageUseCase.incomingMessages.listen((newMessage) {
        // Добавляем новое сообщение в список
        state = state.addMessage(newMessage.toMessage(currentUserId));
        //state.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        // Если бек выдает корректный таймстемп
      });
    }catch (e) {
      print(999999);
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> sendMessage(String messageText) async {
    try {
      final messageData = MessageData(
        id: DateTime.now().toString(),
        senderId: currentUserId,
        text: messageText,
        timestamp: DateTime.now(),  // Сохраняем в виде int
        status: Constants.statusOk,
      );

      await sendMessageUseCase.call(messageData);
      state = state.addMessage(messageData.toMessage(currentUserId));
      // Добавляем отправленное сообщение в UI
      //state.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      // Если бек выдает корректный таймстемп
    } on Exception catch (e) {
      print(55555);
      state = state.copyWith(error: e.toString()) ;
    }
  }

  Future<void> logOut() async {
    await logOutUc.call();
  }
}
