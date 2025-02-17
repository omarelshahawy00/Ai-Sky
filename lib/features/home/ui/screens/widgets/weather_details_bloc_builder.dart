import 'package:ai_sky/features/home/ui/manager/cubit/weather_cubit.dart';
import 'package:ai_sky/features/home/ui/screens/widgets/weather_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherDetailsBlocBuilder extends StatelessWidget {
  const WeatherDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return WeatherDetails(
            weather: state.weatherModel,
          );
        } else if (state is WeatherError) {
          return Text(state.message);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
