import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pandachat/data/data_sources/user_source.dart';
import 'package:pandachat/data/repositories/user_repository_impl.dart';
import 'package:pandachat/data/storage_implementations/user_storage_impl.dart';
import 'package:pandachat/domain/repositories/user_repository.dart';
import 'package:pandachat/presentation/splash/splash_state.dart';
import 'package:pandachat/presentation/splash/splash_state_notifier.dart';
import '../../core/providers/shared_preferences_provider.dart';
import '../../data/data_sources/auth_source.dart';
import '../../data/repositories/token_repository_impl.dart';
import '../../data/storage_implementations/auth_source_impl.dart';
import '../../domain/repositories/token_repository.dart';
import '../../domain/usecases/check_token_uc.dart';


//проввайдер в якості реалізації DI
final splashStateNotifierProvider = StateNotifierProvider<
    SplashStateNotifier,
    SplashState
>((ref) {
  final authenticateUser = ref.watch(checkTokenUcProvider);
  return SplashStateNotifier(authenticateUser);
});


final checkTokenUcProvider = Provider<CheckTokenUc>((ref)  {
  final tokenRepository = ref.read(tokenRepositoryProvider);
  final userRepository = ref.read(userRepositoryProvider);
  return CheckTokenUc(tokenRepository, userRepository);
});

final userRepositoryProvider = Provider<UserRepository>((ref){
  final userSource = ref.read(userSourceProvider);
  return UserRepositoryImpl(userSource);
});

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  final authSource = ref.read(authSourceProvider);
  return TokenRepositoryImpl(authSource);
});

final userSourceProvider = Provider<UserSource>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return UserStorageImpl(sharedPreferences);
});

final authSourceProvider = Provider<AuthSource>((ref) {
  return AuthSourceImpl();
});