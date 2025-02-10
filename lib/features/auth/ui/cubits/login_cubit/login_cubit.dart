import 'package:ai_sky/features/auth/domain/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  void loginUser(String email, String password) async {
    emit(LoginLoading());
    var result = await authRepo.signInWithEmailAndPassword(email, password);

    result.fold(
      (failure) {
        emit(LoginError(failure.message));
      },
      (user) {
        emit(LoginSuccess(user));
      },
    );
  }
}
