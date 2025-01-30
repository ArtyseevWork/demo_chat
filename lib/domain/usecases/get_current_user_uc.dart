import '../entities/user.dart';
import '../repositories/user_repository.dart';

//UseCase для отримання користувача з памʼяті пристрою
class GetCurrentUserUc {
  final UserRepository userRepository;

  GetCurrentUserUc(
      this.userRepository,
      );

  User? call(){
    User? user = userRepository.getUser();
    return user;
  }
}
