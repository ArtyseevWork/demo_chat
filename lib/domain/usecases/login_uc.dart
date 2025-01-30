import '../entities/user.dart';
import '../repositories/login_repository.dart';
import '../repositories/user_repository.dart';

//UseCase для авторизації користувача
class LoginUc {
  final UserRepository userRepository;
  final LoginRepository loginRepository;

  LoginUc(
      this.loginRepository,
      this.userRepository,
      );

  Future<bool> call(String userName, String password) async {

    User? user = await loginRepository.login(userName, password);
    if (user != null){
      userRepository.setUser(user);
      return true;
    } else {
      throw Exception("");
    }
  }
}
