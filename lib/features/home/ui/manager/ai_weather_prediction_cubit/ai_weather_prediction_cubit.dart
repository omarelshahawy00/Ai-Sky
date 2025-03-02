import 'dart:developer';

import 'package:ai_sky/core/services/ai_services.dart' show AIService;
import 'package:ai_sky/features/home/data/models/weather_model.dart' show WeatherModel;
import 'package:ai_sky/features/home/domain/repo/weather_repo.dart';
import 'package:ai_sky/features/home/ui/manager/ai_weather_prediction_cubit/ai_weather_prediction_state.dart'
    show
        AIPredictionFailure,
        AIPredictionInitial,
        AIPredictionLoading,
        AIPredictionState,
        AIPredictionSuccess;
import 'package:flutter_bloc/flutter_bloc.dart';

class AIPredictionCubit extends Cubit<AIPredictionState> {
  final WeatherRepo weatherRepo;
  AIPredictionCubit(this.weatherRepo) : super(AIPredictionInitial());

  void fetchPrediction(WeatherModel weatherModel) async {
    try {
      emit(AIPredictionLoading());
      log("Fetching AI prediction...");
      final result = await weatherRepo.fetchPrediction(weatherModel);
      result.fold(
        (failure) {
          log("Prediction Error: ${failure.message}");
          emit(AIPredictionFailure(failure.message));
        },
        (prediction) {
          log("Prediction Success: $prediction");
          emit(AIPredictionSuccess(prediction));
        },
      );
    } catch (e) {
      log("Unexpected error: $e");
      emit(AIPredictionFailure(e.toString()));
    }
  }
}
