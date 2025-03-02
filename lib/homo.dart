// import 'package:ai_sky/core/services/ai_services.dart' show AIService;
// import 'package:ai_sky/features/home/data/repo_impl/weather_repo_impl.dart'
//     show WeatherRepoImpl;
// import 'package:ai_sky/features/home/domain/repo/weather_repo.dart';
// import 'package:ai_sky/features/home/data/models/weather_model.dart';
// import 'package:ai_sky/core/services/api_services.dart';
// import 'package:dartz/dartz.dart' hide State;
// import 'package:ai_sky/core/errors/failure.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final WeatherRepo weatherRepo = WeatherRepoImpl(ApiServices());
//   final AIService aiService = AIService();

//   String? prediction;
//   bool isLoading = false;
//   WeatherModel? weatherModel;

//   Future<void> fetchWeather(double lat, double lon) async {
//     setState(() {
//       isLoading = true;
//     });

//     Either<Failure, WeatherModel> result =
//         await weatherRepo.getCurrentWeather(lat, lon);

//     result.fold(
//       (failure) => showErrorMessage(failure.message),
//       (weather) {
//         setState(() {
//           weatherModel = weather;
//         });
//       },
//     );

//     setState(() {
//       isLoading = false;
//     });
//   }

//   Future<void> getPrediction() async {
//     if (weatherModel == null) {
//       showErrorMessage("Fetch weather data first.");
//       return;
//     }

//     setState(() {
//       isLoading = true;
//     });

//     try {
//       String result = await aiService.getPrediction(weatherModel!);
//       setState(() {
//         prediction = result;
//       });
//     } catch (e) {
//       showErrorMessage('Error: $e');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   void showErrorMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("AI Weather Predictor")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () => fetchWeather(30.0444, 31.2357), // Example: Cairo
//               child: const Text("Fetch Weather"),
//             ),
//             const SizedBox(height: 20),
//             if (weatherModel != null) ...[
//               Text("Weather: ${weatherModel!.current.condition.text}"),
//               Text("Temperature: ${weatherModel!.current.tempC}°C"),
//               Text("Humidity: ${weatherModel!.forecast.forecastday[0].day.humidity}%"),
//               const SizedBox(height: 20),
//             ],
//             ElevatedButton(
//               onPressed: getPrediction,
//               child: const Text("Get AI Prediction"),
//             ),
//             const SizedBox(height: 20),
//             isLoading
//                 ? const CircularProgressIndicator()
//                 : prediction != null
//                     ? Text('Prediction: $prediction',
//                         style: const TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold))
//                     : const SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }
