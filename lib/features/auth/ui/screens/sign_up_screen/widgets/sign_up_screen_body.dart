import 'package:ai_sky/core/utils/app_colors.dart';
import 'package:ai_sky/core/widgets/app_text_button.dart';
import 'package:ai_sky/features/auth/ui/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:ai_sky/features/auth/ui/screens/sign_up_screen/widgets/already_have_acount.dart';
import 'package:ai_sky/features/auth/ui/screens/sign_up_screen/widgets/input_account_data.dart';
import 'package:ai_sky/features/splash/ui/screens/widgets/background_clouds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, userName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundClouds(),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                spacing: 16,
                children: [
                  const SizedBox(height: 5),
                  InputAccountData(
                    onSavedEmail: (value) => email = value!,
                    onSavedPassword: (value) => password = value!,
                    onSavedUserName: (value) => userName = value!,
                  ),
                  const SizedBox(height: 1),
                  AppTextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context
                            .read<SignUpCubit>()
                            .signUp(email, password, userName);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    buttonText: 'Create Account',
                    backgroundColor: AppColors.background,
                  ),
                  const AlreadyHaveAcount(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
