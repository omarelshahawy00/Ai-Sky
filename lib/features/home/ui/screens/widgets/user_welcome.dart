import 'package:ai_sky/core/services/shared_prefs.dart';
import 'package:ai_sky/core/theming/styles.dart';
import 'package:ai_sky/core/utils/app_colors.dart';
import 'package:ai_sky/core/utils/constants.dart';
import 'package:flutter/material.dart';

class UserWelcome extends StatelessWidget {
  const UserWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = SharedPrefs.getString(userNameStorageKey);
    return ListTile(
      title: Text(
        'Hello,',
        style: TextStyles.size16Weight600.copyWith(color: Colors.grey),
      ),
      subtitle: Text(
        userName,
        style: TextStyles.size19Weight700
            .copyWith(color: AppColors.lightrtBlueAccent),
      ),
    );
  }
}
