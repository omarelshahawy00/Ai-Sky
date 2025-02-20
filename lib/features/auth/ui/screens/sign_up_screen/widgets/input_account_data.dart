import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../../core/widgets/password_field.dart';

class InputAccountData extends StatelessWidget {
  final String? Function(String?) onSavedUserName;
  final String? Function(String?) onSavedEmail;
  final String? Function(String?) onSavedPassword;

  const InputAccountData({
    super.key,
    required this.onSavedUserName,
    required this.onSavedEmail,
    required this.onSavedPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        AppTextFormField(
          onSaved: onSavedUserName,
          fillColor: AppColors.lightBlue,
          lableText: 'User Name',
        ),
        AppTextFormField(
          onSaved: onSavedEmail,
          fillColor: AppColors.lightBlue,
          lableText: 'Email',
        ),
        PasswordField(onSavedPassword: onSavedPassword),
      ],
    );
  }
}
