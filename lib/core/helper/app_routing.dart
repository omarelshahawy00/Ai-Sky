import 'package:ai_sky/core/services/getit_service.dart';
import 'package:ai_sky/core/utils/constants.dart';
import 'package:ai_sky/features/auth/ui/screens/login_screen/login_screen.dart';
import 'package:ai_sky/features/auth/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:ai_sky/features/home/domain/repo/weather_repo.dart';
import 'package:ai_sky/features/home/ui/manager/cubit/weather_cubit.dart';
import 'package:ai_sky/features/home/ui/screens/home_screen.dart';
import 'package:ai_sky/features/splash/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          builder: (context) => BlocProvider(
            create: (context) => WeatherCubit(getIt.get<WeatherRepo>())
              ..getCurrentWeather(lat, lon),
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
