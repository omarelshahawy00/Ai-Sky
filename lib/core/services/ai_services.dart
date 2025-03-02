import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ai_sky/core/errors/failure.dart';

class AIService {
  final Dio dio = Dio();
  final String apiUrl = 'http://10.0.2.2:5001/predict';

  Future<String> getPrediction(List<int> features) async {
    try {
      log("Sending features to AI: $features"); // 🔍 Debug log

      final response = await dio.post(
        apiUrl,
        data: {"features": features},
      );

      if (response.statusCode == 200) {
        String prediction = response.data["prediction"].toString();
        log("AI Response: $prediction"); // 🔍 Debug log
        return prediction;
      } else {
        throw ServerFailure("AI Service Error: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      throw ServerFailure(e.response?.data["error"] ?? "AI service error");
    } catch (e) {
      throw ServerFailure("Unexpected AI error: $e");
    }
  }
}
