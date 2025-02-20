import 'package:ai_sky/core/helper/app_routing.dart';
import 'package:ai_sky/core/theming/styles.dart';
import 'package:ai_sky/core/utils/app_colors.dart';

import 'package:flutter/material.dart';

class DoNotHaveAcc extends StatelessWidget {
  const DoNotHaveAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'don\'t have an account?',
          style: TextStyles.size16Weight600.copyWith(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRouting.signUpScreen);
          },
          child: Text(
            '  Create Account',
            style: TextStyles.size16Weight600.copyWith(
              color: AppColors.lightrtBlueAccent,
            ),
          ),
        ),
      ],
    );
  }
}
