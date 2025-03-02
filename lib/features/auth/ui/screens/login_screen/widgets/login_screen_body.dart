import 'package:ai_sky/core/utils/app_colors.dart';
import 'package:ai_sky/core/widgets/app_text_button.dart';
import 'package:ai_sky/core/widgets/app_text_form_field.dart';
import 'package:ai_sky/core/widgets/password_field.dart';
import 'package:ai_sky/features/auth/ui/screens/login_screen/widgets/do_not_have_acc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../splash/ui/screens/widgets/background_clouds.dart';
import '../../../cubits/login_cubit/login_cubit.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundClouds(),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                spacing: 16,
                children: [
                  const SizedBox(height: 8),
                  AppTextFormField(
                    onSaved: (em) => email = em!.trim(),
                    lableText: 'Email',
                    fillColor: AppColors.lightBlue,
                  ),
                  PasswordField(
                    onSavedPassword: (pass) => password = pass!,
                  ),
                  const SizedBox(height: 17),
                  AppTextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<LoginCubit>().loginUser(email, password);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    buttonText: 'Login',
                    backgroundColor: AppColors.background,
                  ),
                  const DoNotHaveAcc(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
