import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pandachat/presentation/values/colors.dart';
import '../../core/constants.dart';
import 'splash_provider.dart';

//Сплеш-сторінка. Використовується для перевірки актуальності токену, в
// данному випадку
class SplashScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashState = ref.watch(splashStateNotifierProvider);

    return Scaffold(
      body: Center(
        child: splashState.isLoading
            ? _mainArea
            : splashState.isTokenRight == true
            ? _navigateToHome(context)
            : _navigateToLogin(context)
      ),
    );
  }

  Widget get _mainArea{
    return Scaffold(
      backgroundColor: clrYellow,
      body:  Center(
          child: Image.asset(
            "assets/images/panda_logo.png",
          )
      ),
    );
  }

  Widget _navigateToHome(BuildContext context) {
    Future.delayed(Duration(milliseconds: Constants.splashDuration), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    return _mainArea;
  }

  Widget _navigateToLogin(BuildContext context) {
    Future.delayed(Duration(milliseconds: Constants.splashDuration), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
    return _mainArea;
  }
}





