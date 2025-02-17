import 'package:ai_sky/core/utils/app_colors.dart';
import 'package:ai_sky/features/home/ui/screens/widgets/future_weather_item.dart';
import 'package:ai_sky/features/home/ui/screens/widgets/user_welcome.dart';
import 'package:ai_sky/features/home/ui/screens/widgets/weather_details.dart';
import 'package:ai_sky/features/home/ui/screens/widgets/weather_details_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserWelcome(),
          const SizedBox(
            height: 40,
          ),
          const WeatherDetailsBlocBuilder(),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenHeight * 0.03,
                    vertical: screenHeight * 0.03),
                child: const Row(
                  children: [
                    FutureWeatherItem(),
                    Spacer(),
                    FutureWeatherItem(),
                    Spacer(),
                    FutureWeatherItem(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
