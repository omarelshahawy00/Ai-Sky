import 'package:ai_sky/core/services/getit_service.dart';
import 'package:ai_sky/core/utils/app_colors.dart';
import 'package:ai_sky/features/home/domain/repo/weather_repo.dart';
import 'package:ai_sky/features/home/ui/manager/ai_weather_prediction_cubit/ai_weather_prediction_cubit.dart';
import 'package:ai_sky/features/home/ui/manager/ai_weather_prediction_cubit/ai_weather_prediction_state.dart';
import 'package:ai_sky/features/home/ui/manager/waeather_cubit/weather_cubit.dart';
import 'package:ai_sky/features/home/ui/screens/widgets/future_weather_days_bloc_builder.dart';
import 'package:ai_sky/features/home/ui/screens/widgets/user_welcome.dart';
import 'package:ai_sky/features/home/ui/screens/widgets/weather_details_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AIPredictionCubit(getIt.get<WeatherRepo>()),
      child: BlocBuilder<AIPredictionCubit, AIPredictionState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserWelcome(),
              const WeatherDetailsBlocBuilder(),
              const FutureWeatherDaysBlocBuilder(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final weatherState = context.read<WeatherCubit>().state;
                    final aiCubit = context.read<AIPredictionCubit>();

                    if (weatherState is WeatherLoaded) {
                      aiCubit.fetchPrediction(weatherState.weatherModel);
                    } else {
                      _showErrorDialog(context, "Fetch weather data first.");
                    }
                  },
                  child: state is AIPredictionLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Check AI Prediction"),
                ),
              ),
              BlocListener<AIPredictionCubit, AIPredictionState>(
                listener: (context, state) {
                  if (state is AIPredictionSuccess) {
                    _showPredictionDialog(context, state.prediction);
                  } else if (state is AIPredictionFailure) {
                    _showErrorDialog(context, state.error);
                  }
                },
                child: const SizedBox.shrink(),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showPredictionDialog(BuildContext context, String prediction) {
    String message = prediction == "1" ? "Good to go!" : "Not recommended!";
    Icon icon = prediction == "1"
        ? const Icon(Icons.check_circle, color: Colors.green, size: 50)
        : const Icon(Icons.cancel, color: Colors.red, size: 50);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("AI Prediction"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(height: 10),
              Text(message, style: const TextStyle(fontSize: 18))
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK")),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK")),
          ],
        );
      },
    );
  }
}
