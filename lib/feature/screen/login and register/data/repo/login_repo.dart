import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<bool> login({required String email, required String password});

  Future<bool> sign({required String email, required String password});
}
