import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pandachat/presentation/login/login_state.dart';
import '../../core/providers/shared_preferences_provider.dart';
import '../../data/data_sources/user_source.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../data/storage_implementations/auth_source_impl.dart';
import '../../data/storage_implementations/user_storage_impl.dart';
import '../../domain/repositories/login_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/login_uc.dart';
import 'login_state_notifier.dart';

//проввайдер в якості реалізації DI
final loginStateNotifierProvider = StateNotifierProvider<LoginStateNotifier, LoginState>((ref){
  final loginUserUc = ref.read(loginUserUcProvider);
  return LoginStateNotifier(loginUserUc);
});

final loginUserUcProvider = Provider<LoginUc>((ref){
  final loginRepository = ref.read(loginRepositoryProvider);
  final userRepository = ref.read(userRepositoryProvider);
  return LoginUc(loginRepository, userRepository);
});

final userRepositoryProvider = Provider<UserRepository>((ref){
  final userSource = ref.read(userSourceProvider);
  return UserRepositoryImpl(userSource);
});

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final authSource = AuthSourceImpl();
  return LoginRepositoryImpl(authSource);
});

final userSourceProvider = Provider<UserSource>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return UserStorageImpl(sharedPreferences);
});
