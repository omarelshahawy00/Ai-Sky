import 'package:ai_sky/core/helper/build_error_bar.dart';
import 'package:ai_sky/core/services/getit_service.dart';
import 'package:ai_sky/core/widgets/custom_appbar.dart';
import 'package:ai_sky/features/auth/domain/repos/auth_repo.dart';
import 'package:ai_sky/features/auth/ui/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:ai_sky/features/auth/ui/screens/sign_up_screen/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context, title: 'Sign Up'),
      body: BlocProvider(
        create: (context) => SignUpCubit(getIt.get<AuthRepo>()),
        child: const SignUpScreenBodyBlocConsumer(),
      ),
    );
  }
}

class SignUpScreenBodyBlocConsumer extends StatelessWidget {
  const SignUpScreenBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          buildSnackBar(context, 'Account created successfully!',
              backgroundColor: Colors.green);
          Navigator.pop(context);
        } else if (state is SignUpError) {
          buildSnackBar(context, state.message, backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading ? true : false,
          child: const SignUpScreenBody(),
        );
      },
    );
  }
}
