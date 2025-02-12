import 'package:ai_sky/core/errors/failure.dart';
import 'package:ai_sky/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String userName);

  Future<Either<Failure, User>> signInWithEmailAndPassword(
      String email, String password);

  Future<void> saveUserId(String userId);
}
