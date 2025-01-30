import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants.dart';
import '../data_sources/auth_source.dart';
import '../../domain/entities/user.dart';


//реалізація спілкування з сервером для авторизації
class AuthSourceImpl extends AuthSource{

  //для повторного входа
  @override
  Future<bool> checkToken(User user)async {
    final url = Uri.parse('${Constants.url}/auth');
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'name'   : user.username,
      'token': user.token,
      'id': user.id,
    });

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }

  //для первого входа
  @override
  Future<User?> logIn(String login, String password) async {
    final url = Uri.parse('${Constants.url}/login');
    User? resultUser;
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'login'   : login,
      'password': password,
    });
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);

        if (responseBody.containsKey('token')
            && responseBody.containsKey('username')
            && responseBody.containsKey('id')) {
          resultUser = User.fromJson(responseBody); //todo
          return resultUser;
        }
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}





