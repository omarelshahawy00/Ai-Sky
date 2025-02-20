import 'package:ai_sky/features/home/data/models/forecast_model.dart';
import 'package:ai_sky/features/home/data/models/location_model.dart';

import 'current_model.dart';

class WeatherModel {
  final Location location;
  final Current current;
  final Forecast forecast;

  WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }
}
