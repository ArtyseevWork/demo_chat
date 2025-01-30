import '../../domain/entities/user.dart';

//Абстрактний класс - вимоги для реалізації взаємодії з сервером для авторизації
abstract class AuthSource{
  Future<bool> checkToken(User user);
  Future<User?> logIn(String login, String password);
}