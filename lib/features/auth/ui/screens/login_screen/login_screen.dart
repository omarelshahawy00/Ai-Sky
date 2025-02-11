import 'package:ai_sky/core/helper/app_routing.dart';
import 'package:ai_sky/core/helper/build_error_bar.dart';
import 'package:ai_sky/core/services/getit_service.dart';
import 'package:ai_sky/core/widgets/custom_appbar.dart';
import 'package:ai_sky/features/auth/domain/repos/auth_repo.dart';
import 'package:ai_sky/features/auth/ui/cubits/login_cubit/login_cubit.dart';
import 'package:ai_sky/features/auth/ui/screens/login_screen/widgets/login_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context, title: "Login", leading: const SizedBox()),
      body: BlocProvider(
        create: (context) => LoginCubit(getIt.get<AuthRepo>()),
        child: LoginScreenBodyBlocConsumer(),
      ),
    );
  }
}

class LoginScreenBodyBlocConsumer extends StatelessWidget {
  const LoginScreenBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, AppRouting.homeScreen);
        } else if (state is LoginError) {
          buildSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: const LoginScreenBody(),
        );
      },
    );
  }
}
