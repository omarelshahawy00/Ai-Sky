import 'package:ai_sky/core/services/firebase_auth_service.dart';
import 'package:ai_sky/features/auth/data/repos_imp/auth_repo_imp.dart';
import 'package:ai_sky/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getitSetup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
    ),
  );
}
