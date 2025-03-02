import 'package:ai_sky/core/theming/styles.dart';
import 'package:ai_sky/features/home/ui/manager/waeather_cubit/weather_cubit.dart';
import 'package:ai_sky/features/home/ui/screens/widgets/future_weather_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FutureWeatherDaysBlocBuilder extends StatelessWidget {
  const FutureWeatherDaysBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: screenHeight * 0.03),
            child: Row(
              children: [
                FutureWeatherItem(
                    forecast: state.weatherModel.forecast.forecastday[0]),
                const Spacer(),
                FutureWeatherItem(
                    forecast: state.weatherModel.forecast.forecastday[1]),
                const Spacer(),
                FutureWeatherItem(
                    forecast: state.weatherModel.forecast.forecastday[2]),
              ],
            ),
          );
        } else if (state is WeatherError) {
          return Center(
              child: Text(
            state.message,
            style: TextStyles.size13Weight600.copyWith(color: Colors.white),
          ));
        } else {
          return const Center(child: SizedBox());
        }
      },
    );
  }
}
