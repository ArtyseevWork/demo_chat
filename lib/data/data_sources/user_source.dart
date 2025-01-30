import '../../domain/entities/user.dart';

//Абстрактний класс - вимоги для реалізації взаємодії зі "сховищем" користувача
abstract class UserSource{
  User? getCurrentUser();
  void setCurrentUser(User user);
  void cleanCurrentUser();
}