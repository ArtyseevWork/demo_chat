import '../entities/user.dart';
import '../repositories/token_repository.dart';
import '../repositories/user_repository.dart';

//UseCase для перевірки токена при вході в додаток
class CheckTokenUc {
  final UserRepository userRepository;
  final TokenRepository authRepository;

  CheckTokenUc(
    this.authRepository,
    this.userRepository,
  );

  Future<bool> call() async {
    bool result = false;
    User? user = userRepository.getUser();
    if (user != null){
      result = await authRepository.checkToken(user);
    }
    return result;
  }
}
