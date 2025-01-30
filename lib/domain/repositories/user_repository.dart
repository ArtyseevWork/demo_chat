import '../entities/user.dart';

//Абстрактний репозиторій. В основному реалізується в тому випадку, якщо є кілька
// джерел даних.
abstract class UserRepository {
  User? getUser();
  void setUser(User user);
  void cleanUser();
}
