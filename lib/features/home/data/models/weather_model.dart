import 'package:ai_sky/features/home/data/models/current_model.dart';
import 'package:ai_sky/features/home/data/models/forecast_model.dart';
import 'package:ai_sky/features/home/data/models/location_model.dart';

class WeatherModel {
  final Location location;
  final Current current;
  final Forecast forecast;
  late final List<int> features; 

  WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  }) {
    features = extractFeatures(); 
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }

  // ✅ Add extractFeatures method inside the model
   List<int> extractFeatures() {
    String condition = current.condition.text.toLowerCase();
    double temperature = current.tempC;
    int humidity = forecast.forecastday[0].day.humidity;

    return [
      (condition.contains("rain") ||
              condition.contains("storm") ||
              condition.contains("drizzle") ||
              condition.contains("hail"))
          ? 1
          : 0, // Rainy or Stormy?
      (condition.contains("clear") ||
              condition.contains("sunny") ||
              condition.contains("cloudy") ||
              condition.contains("partly") ||
              condition.contains("overcast") ||
              condition.contains("cloud"))
          ? 1
          : 0, // Clear or Sunny?
      (temperature > 30 || condition.contains("hot")) ? 1 : 0, // Hot?
      (temperature < 10 ||
              condition.contains("cold") ||
              condition.contains("snow"))
          ? 1
          : 0, // Cold or Snowy?
      (humidity > 70 ||
              condition.contains("humid") ||
              condition.contains("fog"))
          ? 1
          : 0, // High Humidity or Foggy?
    ];
  }
}
