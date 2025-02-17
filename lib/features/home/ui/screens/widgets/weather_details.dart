import 'package:ai_sky/features/home/data/models/weather_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/styles.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    //DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}\n${DateTime.now().hour}:${DateTime.now().minute
                    'last update ${weather.current.lastUpdated}',
                    style: TextStyles.size13Weight400.copyWith(
                      color: Colors.white,
                    )),
                Text(
                  '${weather.current.tempC.toString()}°',
                  style: TextStyles.size23Weight700
                      .copyWith(color: Colors.white, fontSize: 70),
                ),
                Text(
                  weather.current.condition.text,
                  style: TextStyles.size16Weight600.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '${weather.location.name},\n${weather.location.region}, ${weather.location.country}',
                  style: TextStyles.size16Weight600.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${weather.forecast.forecastday[0].day.maxtempC}°/ ${weather.forecast.forecastday[0].day.mintempC}°',
                  style: TextStyles.size16Weight600.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Image.network("https:${weather.current.condition.icon}",
                fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }
}
