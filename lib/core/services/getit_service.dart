import 'package:ai_sky/core/services/ai_services.dart';
import 'package:ai_sky/core/services/api_services.dart';
import 'package:ai_sky/core/services/firebase_auth_service.dart';
import 'package:ai_sky/features/auth/data/repos_imp/auth_repo_imp.dart';
import 'package:ai_sky/features/auth/domain/repos/auth_repo.dart';
import 'package:ai_sky/features/home/data/repo_impl/weather_repo_impl.dart';
import 'package:ai_sky/features/home/domain/repo/weather_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItSetup() {
  // Register Core Services
  getIt.registerLazySingleton<ApiServices>(() => ApiServices());
  getIt.registerLazySingleton<AIService>(() => AIService());
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

  // Register Repositories
  getIt.registerLazySingleton<WeatherRepo>(
    () => WeatherRepoImpl(getIt<ApiServices>(), getIt<AIService>()),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImp(firebaseAuthService: getIt<FirebaseAuthService>()),
  );
}
