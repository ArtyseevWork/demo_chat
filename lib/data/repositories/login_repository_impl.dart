import '../../domain/repositories/login_repository.dart';
import '../data_sources/auth_source.dart';
import '../../domain/entities/user.dart';

//Реалізація репозиторію. В основному реалізується в тому випадку, якщо є кілька
// джерел даних.
class LoginRepositoryImpl implements LoginRepository {
  final AuthSource apiRequests;

  LoginRepositoryImpl(this.apiRequests);

  @override
  Future<User?> login(String login, String pass) async{
    return  await apiRequests.logIn(login, pass);
  }
}
