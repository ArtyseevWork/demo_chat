import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pandachat/presentation/login/login_screen.dart';
import 'package:pandachat/presentation/chat/chat_screen.dart';
import 'package:pandachat/presentation/splash/splash_screen.dart';
import 'package:pandachat/presentation/values/strings/localizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/providers/shared_preferences_provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //Локалізація застосунку
  Localizer.init('en');
  //ініціалізаація SharedPreferences для можливості доступу зі всього додатку
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Додаток не тестувався в альбомному режимі, тому я його блокую
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Panda chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.white,
      ),
      //home: SplashScreen(),
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => ChatScreen(),
      },
    );
  }
}
