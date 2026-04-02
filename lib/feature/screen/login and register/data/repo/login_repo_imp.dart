import 'package:ecommerce/feature/screen/login%20and%20register/data/repo/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepoImp extends LoginRepo {
  @override
  Future<bool> login({required String email, required String password}) async {
    final firebase = FirebaseAuth.instance;

    final user = await firebase.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final userCredential = user.user;

    print(user.user);
    if (userCredential != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> sign({required String email, required String password}) async {
    final firebase = FirebaseAuth.instance;

    final user = await firebase.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final userCredential = user.user;

    print(user.user);
    if (userCredential != null) {
      return true;
    } else {
      return false;
    }
  }
}
