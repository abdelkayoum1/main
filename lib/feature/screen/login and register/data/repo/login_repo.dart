import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<bool> login({required String email, required String password});

  Future<bool> sign({required String email, required String password});

  Future<void> logout();

  Future<bool> signInWithGoogle();
}
