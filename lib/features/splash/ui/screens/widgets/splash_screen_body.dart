import 'package:ai_sky/core/helper/app_routing.dart';
import 'package:ai_sky/core/services/firebase_auth_service.dart';
import 'package:ai_sky/core/services/shared_prefs.dart';
import 'package:ai_sky/core/utils/const_assets.dart';
import 'package:ai_sky/core/utils/constants.dart';
import 'package:ai_sky/features/splash/ui/screens/widgets/background_clouds.dart';
import 'package:ai_sky/features/splash/ui/screens/widgets/center_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    timingToNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundClouds(),
        CenterLogo(),
      ],
    );
  }

  void timingToNavigate() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        var isLoggedIn = SharedPrefs.getString(userIdStorageKey) != null;

        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, AppRouting.homeScreen);
        } else {
          Navigator.pushReplacementNamed(context, AppRouting.loginScreen);
        }
      },
    );
  }
}
