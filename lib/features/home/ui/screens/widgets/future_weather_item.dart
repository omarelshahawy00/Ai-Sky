import 'package:ai_sky/core/theming/styles.dart';
import 'package:ai_sky/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FutureWeatherItem extends StatelessWidget {
  const FutureWeatherItem({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    DateTime date = DateTime.now();
    String formattedDate = DateFormat('MMMM, d').format(date);
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
              formattedDate,
              style: TextStyles.size13Weight400.copyWith(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Text(
              '27°',
              style: TextStyles.size23Weight700
                  .copyWith(color: Colors.white, fontSize: 30),
            ),
            const Spacer(),
            Image.network(
              "https://cdn.weatherapi.com/weather/64x64/day/113.png",
              fit: BoxFit.fill,
            ),
            const Spacer(),
            Text(
              'min / max',
              style: TextStyles.size13Weight600.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
