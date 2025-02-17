import 'dart:developer';
import 'package:ai_sky/core/errors/failure.dart';
import 'package:ai_sky/core/services/api_services.dart';
import 'package:ai_sky/features/home/data/models/weather_model.dart';
import 'package:ai_sky/features/home/domain/repo/weather_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class WeatherRepoImpl implements WeatherRepo {
  final ApiServices apiServices;

  WeatherRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, WeatherModel>> getCurrentWeather(
      double lat, double lon) async {
    try {
      final res =
          await apiServices.getWeather(lat, lon); 
      final weatherModel = WeatherModel.fromJson(res); 
      return right(weatherModel); 
    } on DioException catch (e) {
      final String errorMsg = e.response?.data['error']['message'] ??
          'Oops, there was an error. Try later...';
      return left(
          ServerFailure(errorMsg)); 
    } catch (e) {
      log(e.toString());
      return left(ServerFailure('Oops, there was an unexpected error.'));
    }
  }
}
