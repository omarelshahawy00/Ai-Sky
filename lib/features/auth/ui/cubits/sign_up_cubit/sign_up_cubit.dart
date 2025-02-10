import 'package:ai_sky/features/auth/domain/entities/user_entity.dart';
import 'package:ai_sky/features/auth/domain/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUp(String email, String password, String userName) async {
    emit(SignUpLoading());
    final userData = await authRepo.createUserWithEmailAndPassword(
        email, password, userName);
    userData.fold(
      (failure) {
        emit(SignUpError(failure.message));
      },
      (user) {
        emit(SignUpSuccess(user));
      },
    );
  }
}
