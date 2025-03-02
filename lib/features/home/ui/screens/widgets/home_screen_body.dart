import 'package:ai_sky/features/home/ui/screens/widgets/check_button_with_bloc_consumer.dart';
import 'package:ai_sky/features/home/ui/screens/widgets/future_weather_days_bloc_builder.dart';
import 'package:ai_sky/features/home/ui/screens/widgets/user_welcome.dart';
import 'package:ai_sky/features/home/ui/screens/widgets/weather_details_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserWelcome(),
        WeatherDetailsBlocBuilder(),
        FutureWeatherDaysBlocBuilder(),
        Spacer(),
        CheckButtonWithBlocConsumer(),
        SizedBox(height: 20),
      ],
    );
  }
}
