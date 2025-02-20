import 'package:ai_sky/core/services/getit_service.dart';
import 'package:ai_sky/features/home/domain/repo/weather_repo.dart';
import 'package:ai_sky/features/home/ui/manager/cubit/weather_cubit.dart';
import 'package:ai_sky/features/splash/ui/screens/widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => WeatherCubit(getIt.get<WeatherRepo>()),
        child: const SplashScreenBody(),
      ),
    );
  }
}
