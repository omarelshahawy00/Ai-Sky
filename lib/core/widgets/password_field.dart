import 'package:ai_sky/core/utils/app_colors.dart';
import 'package:ai_sky/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import '../theming/styles.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.onSavedPassword,
  });

  final String? Function(String?) onSavedPassword;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      onSaved: widget.onSavedPassword,
      fillColor: AppColors.lightBlue,
      lableText: 'Password',
      isObscureText: isObsecureText,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isObsecureText = !isObsecureText;
          });
        },
        child: Icon(
          isObsecureText ? Icons.visibility_off : Icons.visibility,
          size: 24,
          color: const Color(0xffc9cecf),
        ),
      ),
      hintTextStyle: TextStyles.size13Weight700,
    );
  }
}
