import '../../domain/entities/user.dart';
import '../../domain/repositories/token_repository.dart';
import '../data_sources/auth_source.dart';

//Реалізація репозиторію. В основному реалізується в тому випадку, якщо є кілька
// джерел даних.
class TokenRepositoryImpl implements TokenRepository{
  final AuthSource apiRequests;

  TokenRepositoryImpl(this.apiRequests);

  @override
  Future<bool> checkToken(User user) async{
    return await apiRequests.checkToken(user);
  }



}
