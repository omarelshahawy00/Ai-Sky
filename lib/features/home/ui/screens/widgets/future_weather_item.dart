import 'package:ai_sky/core/theming/styles.dart';
import 'package:ai_sky/core/utils/app_colors.dart';
import 'package:ai_sky/features/home/data/models/forecast_model.dart';
import 'package:flutter/material.dart';

class FutureWeatherItem extends StatelessWidget {
  const FutureWeatherItem({super.key, required this.forecast});
  final Forecastday forecast;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String date = forecast.date;

    return Container(
      height: screenHeight * .27,
      width: screenWidth * .22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lightGray,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            Text(
              date,
              style: TextStyles.size13Weight400.copyWith(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Text(
              '${forecast.day.avgtempC}',
              style: TextStyles.size23Weight700
                  .copyWith(color: Colors.white, fontSize: 30),
            ),
            const Spacer(),
            Image.network(
              "https:${forecast.day.condition.icon}",
              fit: BoxFit.fill,
            ),
            const Spacer(),
            Text(
              '${forecast.day.maxtempC} / ${forecast.day.mintempC}',
              style: TextStyles.size13Weight600.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
