class Forecast {
  final List<Forecastday> forecastday;

  Forecast({required this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastday: (json['forecastday'] as List<dynamic>?)
              ?.map((x) => Forecastday.fromJson(x))
              .toList() ??
          [],
    );
  }
}

class Forecastday {
  final String date;
  final Day day;

  Forecastday({
    required this.date,
    required this.day,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    return Forecastday(
      date: json['date'],
      day: Day.fromJson(json['day']),
    );
  }
}

class Day {
  final double maxtempC;
  final double mintempC;
  final double avgtempC;
  final Condition condition;
  final int humidity;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
    required this.condition,
    required this.humidity,
  });
  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: json['maxtemp_c'],
      mintempC: json['mintemp_c'],
      avgtempC: json['avgtemp_c'],
      condition: Condition.fromJson(json['condition']),
      humidity: json['avghumidity'],
    );
  }
}

class Condition {
  final String text;
  final String icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'] ?? '',
      icon: json['icon'] ?? '',
    );
  }
}
