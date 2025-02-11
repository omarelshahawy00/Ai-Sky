import 'package:ai_sky/core/helper/app_routing.dart';
import 'package:ai_sky/core/services/getit_service.dart';
import 'package:ai_sky/core/utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helper/custom_bloc_observer.dart';

void main() async {
  //hallo
  getitSetup();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = CustomBlocObserver();
  runApp(const AiSky());
}

class AiSky extends StatelessWidget {
  const AiSky({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouting.generateRoute,
      initialRoute: AppRouting.splashScreen,
    );
  }
}
