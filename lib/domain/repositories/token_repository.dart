import '../entities/user.dart';

//Абстрактний репозиторій. В основному реалізується в тому випадку, якщо є кілька
// джерел даних.
abstract class TokenRepository {
  Future<bool> checkToken(User user);
}
