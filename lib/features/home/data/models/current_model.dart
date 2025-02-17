import 'package:ai_sky/features/home/data/models/forecast_model.dart';

class Current {
  final String lastUpdated;
  final double tempC;
  final Condition condition;

  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.condition,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdated: json['last_updated'],
      tempC: json['temp_c'],
      condition: Condition.fromJson(json['condition']),
    );
  }
}
