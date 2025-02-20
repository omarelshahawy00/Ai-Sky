import 'dart:developer';

import 'package:ai_sky/features/home/ui/screens/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_user_location.dart';
import '../manager/cubit/weather_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetUserLocation.determinePosition( context).then(
      (value) {
        BlocProvider.of<WeatherCubit>(context)
            .getCurrentWeather(value.latitude, value.longitude);

        log('${value.longitude},${value.latitude}');
      },
    );
    return const SafeArea(
      child: Scaffold(
        body: HomeScreenBody(),
      ),
    );
  }
}
