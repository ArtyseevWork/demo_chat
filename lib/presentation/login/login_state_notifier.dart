import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pandachat/presentation/login/login_state.dart';
import '../../domain/usecases/login_uc.dart';
import '../values/strings/localizer.dart';

//Керування станом за допомогою riverpod
class LoginStateNotifier extends StateNotifier<LoginState> {
  final LoginUc loginUc;
  String _userName = '';
  String _password = '';

  LoginStateNotifier(this.loginUc) : super(LoginState(isLoading: false));

  Future<void> login() async {
    try {
      state = state.copyWith(isLoading: true);
      bool loginResult = await loginUc.call(_userName, _password);
      state = LoginState(isLoading: false, isLoginSuccess: loginResult);
    } catch (e) {
      _userName = '';
      _password = '';
      state = LoginState(
          isLoading: false,
          isLoginSuccess: false,
          error: Localizer.get("error_title"),
      );
    }
  }

  void onEmailChanged(String userName) {
    state = state.copyWith(error: "");
    _userName = userName;
    _canSubmit();
  }

  void _canSubmit(){ //для состояния кнопки
    bool result = false;
    if (_userName.isNotEmpty && _password.isNotEmpty){
      result =  true;
    }
    state = state.copyWith(canSubmit: result);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(error: "");
    _password = password;
    _canSubmit();
  }

}