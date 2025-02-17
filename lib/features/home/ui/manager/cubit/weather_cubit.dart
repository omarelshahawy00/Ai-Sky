import 'package:ai_sky/features/home/domain/repo/weather_repo.dart';
import 'package:bloc/bloc.dart';
import '../../../data/models/weather_model.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepo) : super(WeatherInitial());
  final WeatherRepo weatherRepo;

  Future<void> getCurrentWeather(double lat, double lon) async {
    emit(WeatherLoading());
    final result = await weatherRepo.getCurrentWeather(lat, lon);
    emit(
      result.fold(
        (fail) => WeatherError(fail.message),
        (weather) => WeatherLoaded(weather),
      ),
    );
  }
}
