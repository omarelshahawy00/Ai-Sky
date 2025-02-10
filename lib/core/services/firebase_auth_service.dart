import 'dart:developer';

import 'package:ai_sky/core/errors/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('The account already exists for that email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('Check your internet connection.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('The email address is not valid.');
      } else {
        throw CustomException('Something went wrong.');
      }
    } catch (e) {
      log('FirebaseAuthException.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException('Something went wrong.');
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw CustomException('Email or password is incorrect.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException('Email or password is incorrect.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('Check your internet connection');
      } else {
        throw CustomException('Something went wrong');
      }
    } catch (e) {
      log('FirebaseAuthException.signInWithEmailAndPassword: ${e.toString()}');
      throw CustomException('Something went wrong');
    }
  }
}
