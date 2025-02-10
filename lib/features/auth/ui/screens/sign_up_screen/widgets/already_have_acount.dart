import 'package:ai_sky/core/theming/styles.dart';
import 'package:ai_sky/core/utils/app_colors.dart';

import 'package:flutter/material.dart';

class AlreadyHaveAcount extends StatelessWidget {
  const AlreadyHaveAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyles.size16Weight600.copyWith(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            '  Sign Up',
            style: TextStyles.size16Weight600.copyWith(
              color: AppColors.lightrtBlueAccent,
            ),
          ),
        ),
      ],
    );
  }
}
