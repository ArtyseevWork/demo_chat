import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pandachat/domain/usecases/check_token_uc.dart';
import 'package:pandachat/presentation/splash/splash_state.dart';

//Керування станом за допомогою riverpod
class SplashStateNotifier extends StateNotifier<SplashState> {
  final CheckTokenUc checkTokenUc;

  SplashStateNotifier(
    this.checkTokenUc,
  ) : super(SplashState(isLoading: true)) {
    checkToken();
  }

  Future<void> checkToken() async {
    try {
      bool result = await checkTokenUc.call();
      state = SplashState(
          isLoading: false,
          isTokenRight: result
      );
    } catch (e) {
      state = SplashState(
          isLoading: false,
          isTokenRight: false,
          error: e.toString()
      );
    }
  }

}
