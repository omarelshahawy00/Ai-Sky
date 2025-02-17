import 'package:dio/dio.dart';

class ApiServices {
  static String apiKey = 'bae79875a9dd425f992191309240109';
  final dio = Dio();
 Future <Map<String,dynamic>> getWeather(double lat, double lon) async {
    final String baseUrl =
        'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$lat,$lon&days=3';
    Response response = await dio.get(baseUrl);
    return response.data;
  }
}
