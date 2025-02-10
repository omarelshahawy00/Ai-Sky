import 'package:ai_sky/core/helper/app_routing.dart';
import 'package:ai_sky/core/utils/const_assets.dart';
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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRouting.loginScreen);
    });
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
}
