import 'package:ai_sky/features/auth/ui/screens/login_screen/login_screen.dart';
import 'package:ai_sky/features/auth/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:ai_sky/features/home/ui/screens/home_screen.dart';
import 'package:ai_sky/features/splash/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouting {
  static const String splashScreen = 'splash_screen';
  static const String loginScreen = 'login_screen';
  static const String signUpScreen = 'sign_up_screen';
  static const String homeScreen = 'home_screen';
  static MaterialPageRoute? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return null;
    }
  }
}
