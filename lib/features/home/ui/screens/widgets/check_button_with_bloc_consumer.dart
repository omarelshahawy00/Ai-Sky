import 'package:ai_sky/features/home/ui/manager/ai_weather_prediction_cubit/ai_weather_prediction_cubit.dart';
import 'package:ai_sky/features/home/ui/manager/ai_weather_prediction_cubit/ai_weather_prediction_state.dart';
import 'package:ai_sky/features/home/ui/manager/waeather_cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckButtonWithBlocConsumer extends StatelessWidget {
  const CheckButtonWithBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AIPredictionCubit, AIPredictionState>(
      listener: (context, state) {
        if (state is AIPredictionSuccess) {
          showPredictionDialog(context, state.prediction);
        } else if (state is AIPredictionFailure) {
          showErrorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final weatherState = context.read<WeatherCubit>().state;
                  final aiCubit = context.read<AIPredictionCubit>();

                  if (weatherState is WeatherLoaded) {
                    aiCubit.fetchPrediction(weatherState.weatherModel);
                  } else {
                    showErrorDialog(context, "Fetch weather data first.");
                  }
                },
                child: state is AIPredictionLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Check If It's Good to Go"),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showPredictionDialog(BuildContext context, String prediction) {
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

  void showErrorDialog(BuildContext context, String message) {
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
