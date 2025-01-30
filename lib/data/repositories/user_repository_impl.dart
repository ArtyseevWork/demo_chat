import 'package:pandachat/data/data_sources/user_source.dart';
import 'package:pandachat/domain/entities/user.dart';
import 'package:pandachat/domain/repositories/user_repository.dart';

//Реалізація репозиторію. В основному реалізується в тому випадку, якщо є кілька
// джерел даних.
class UserRepositoryImpl implements UserRepository{
  final UserSource userStorage;

  UserRepositoryImpl(this.userStorage);

  @override
  User? getUser() {
      return userStorage.getCurrentUser();
  }

  @override
  void setUser(User user) {
    return userStorage.setCurrentUser(user);
  }

  @override
  void cleanUser() {
    return userStorage.cleanCurrentUser();
  }

}