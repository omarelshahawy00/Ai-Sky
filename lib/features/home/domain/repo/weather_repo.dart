import 'package:ai_sky/core/errors/failure.dart';
import 'package:ai_sky/features/home/data/models/weather_model.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepo {
  Future<Either<Failure, WeatherModel>> getCurrentWeather(
      double lat, double lon);
  Future<Either<Failure, String>> fetchPrediction(WeatherModel weatherModel);
  Future<Either<Failure, List<int>>> extractFeatures(WeatherModel weatherModel);
}
