import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/user_source.dart';
import '../../domain/entities/user.dart';

//Реалізація зберігання даних поточного користувача
class UserStorageImpl extends UserSource{
  static const String tokenKey    = "token";
  static const String userNameKey = "username";
  static const String idKey = "userId";

  final SharedPreferences sharedPreferences;
  UserStorageImpl(this.sharedPreferences);

  @override
  User? getCurrentUser() {
    String token    = sharedPreferences.getString(tokenKey)?? "";
    String username = sharedPreferences.getString(userNameKey)?? "";
    String id       = sharedPreferences.getString(idKey)?? "";

    //все данные присутствуют
    if(token.isNotEmpty && username.isNotEmpty && id.isNotEmpty) {
      return User(token: token, username: username, id:id);
    } else {
      return null;
    }
  }

  @override
  void setCurrentUser(User user) {
    sharedPreferences.setString(tokenKey, user.token);
    sharedPreferences.setString(userNameKey, user.username);
    sharedPreferences.setString(idKey, user.id);
  }

  @override
  void cleanCurrentUser() {
    sharedPreferences.clear();
  }
}
