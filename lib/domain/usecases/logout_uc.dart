import '../entities/user.dart';
import '../repositories/login_repository.dart';
import '../repositories/user_repository.dart';

//UseCase для виходу з аккаунта
class LogOutUc {
  final UserRepository userRepository;

  LogOutUc(
      this.userRepository,
      );

  Future<bool> call() async {
    userRepository.cleanUser();
    return true;
  }
}
