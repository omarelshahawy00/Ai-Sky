import 'dart:developer';
import 'package:ai_sky/core/errors/custom_exception.dart';
import 'package:ai_sky/core/errors/failure.dart';
import 'package:ai_sky/core/services/firebase_auth_service.dart';
import 'package:ai_sky/features/auth/data/models/user_model.dart';
import 'package:ai_sky/features/auth/domain/entities/user_entity.dart';
import 'package:ai_sky/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImp implements AuthRepo {
  FirebaseAuthService firebaseAuthService;

  AuthRepoImp({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String userName) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email, password);
      var userEnity = UserModel(
        uId: user.uid,
        email: email,
        userName: userName,
      ).toUserEntity();
      return right(userEnity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('AuthRepoImp.createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthService.signInWithEmailAndPassword(email, password);

      return right(user);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('AuthRepoImp.signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('Something went wrong'));
    }
  }
}
