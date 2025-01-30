import '../entities/user.dart';

//Абстрактний репозиторій. В основному реалізується в тому випадку, якщо є кілька
// джерел даних.
abstract class LoginRepository {
  Future<User?> login(
      String userName,
      String pass,
  );
}