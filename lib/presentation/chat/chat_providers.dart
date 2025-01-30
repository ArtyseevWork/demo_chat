import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pandachat/data/repositories/user_repository_impl.dart';
import 'package:pandachat/domain/repositories/user_repository.dart';
import '../../core/providers/shared_preferences_provider.dart';
import '../../data/data_sources/user_source.dart';
import '../../data/repositories/message_repository_impl.dart';
import '../../data/storage_implementations/user_storage_impl.dart';
import '../../data/storage_implementations/messages_stream_source_impl.dart';
import '../../domain/repositories/messages_repository.dart';
import '../../domain/usecases/get_current_user_uc.dart';
import '../../domain/usecases/listen_messages_uc.dart';
import '../../domain/usecases/logout_uc.dart';
import '../../domain/usecases/send_message_uc.dart';
import 'chat_state.dart';
import 'chat_state_notifier.dart';

//проввайдер в якості реалізації DI
final chatStateProvider = StateNotifierProvider<ChatStateNotifier, ChatState>
((ref) {
  final listenMessageUseCase = ref.read(listenMessagesUcProvider);
  final sendMessageUseCase = ref.read(sendMessageUcProvider);
  final getCurrentUserUc = ref.watch(getCurrentUserUcProvider);
  final logOutUc = ref.watch(logOutUcProvider
);

  return ChatStateNotifier(
    listenMessageUseCase,
    sendMessageUseCase,
    getCurrentUserUc,
    logOutUc,
  );
});

final userStorageProvider = Provider<UserSource>((ref) {
  final sharedPreferences = ref.read(sharedPreferencesProvider);
  return UserStorageImpl(sharedPreferences);
});


final userRepositoryProvider = Provider<UserRepository>((ref) {
  final userStorage = ref.read(userStorageProvider);
  return UserRepositoryImpl(userStorage);
});

final getCurrentUserUcProvider = Provider<GetCurrentUserUc>((ref) {
  final userRepository =  ref.read(userRepositoryProvider);
  return GetCurrentUserUc(userRepository);
});

final messagesRepositoryProvider = Provider<MessagesRepository>((ref){
  final messagesStreamSource = MessagesStreamSourceImpl();
  return MessagesRepositoryImpl(messagesStreamSource);
});

final listenMessagesUcProvider = Provider<ListenMessagesUc>((ref) {
  final messagesRepository = ref.read(messagesRepositoryProvider);
  return ListenMessagesUc(messagesRepository);
});

final sendMessageUcProvider = Provider<SendMessageUc>((ref) {
  final messagesRepository = ref.read(messagesRepositoryProvider);
  return SendMessageUc(messagesRepository);
});

final logOutUcProvider = Provider<LogOutUc>((ref) {
  final userRepository = ref.read(userRepositoryProvider);
  return LogOutUc(userRepository);
});