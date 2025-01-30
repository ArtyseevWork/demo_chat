import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pandachat/presentation/login/login_layout.dart';
import 'package:pandachat/presentation/login/login_provider.dart';
import 'package:pandachat/presentation/login/widgets/error_area.dart';
import 'package:pandachat/presentation/login/widgets/input_block.dart';
import 'package:pandachat/presentation/login/widgets/main_image.dart';
import 'package:pandachat/presentation/login/widgets/main_text.dart';
import 'package:pandachat/presentation/login/widgets/submit_button.dart';
import '../values/colors.dart';
import '../values/strings/localizer.dart';

//Сторінка входу
class LoginScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginStateNotifierProvider);
    if (loginState.isLoginSuccess){
      ref.invalidate(loginStateNotifierProvider);
      FocusScope.of(context).unfocus();
      _navigateToChat(context);
    }
    return loginState.isLoading ?
    CircularProgressIndicator() :
    Scaffold(
      backgroundColor: clrWhite,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: LoginLayout.mainMarginHorizontal,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              mainImage,
              mainText,
              loginInputBlock(
                name: Localizer.get('email'),
                hint: Localizer.get('email_hint'),
                isCorrect: loginState.error.isEmpty,
                onTextChanged: ref.read(loginStateNotifierProvider.notifier)
                    .onEmailChanged,
                isPassword: false,
              ),
              loginInputBlock(
                name: Localizer.get('password'),
                hint: Localizer.get('password_hint'),
                isCorrect: loginState.error.isEmpty,
                onTextChanged: ref.read(loginStateNotifierProvider.notifier)
                    .onPasswordChanged,
                isPassword: true,
              ),
              errorArea(loginState.error),
              loginSubmitButton(
                name: Localizer.get('login'),
                enabled: loginState.canSubmit,
                action:  () async {
                  await ref.read(loginStateNotifierProvider.notifier).login();
                },
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _navigateToChat(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    return CircularProgressIndicator();
  }
}
