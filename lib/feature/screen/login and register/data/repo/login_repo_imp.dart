import 'package:dart_either/dart_either.dart';
import 'package:ecommerce/feature/screen/login%20and%20register/data/repo/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepoImp extends LoginRepo {
  @override
  final firebase = FirebaseAuth.instance;
  Future<bool> login({required String email, required String password}) async {
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

  User? getuser() {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> init() async {
    await GoogleSignIn.instance.initialize(
      serverClientId:
          '984666533062-3fssteit2hk7oqfoqvifgg1oeah3r1ek.apps.googleusercontent.com',
      // ApiConstants.clientId, // your Web client ID
    );
  }
  // final static  GoogleSignIn google=GoogleSignIn();

  static Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate();

    if (googleUser == null) return false;

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final String? idToken = googleAuth.idToken;
    if (idToken == null) throw 'No ID Token found.';

    // Try to get accessToken, but don't block login if it fails
    String? accessToken;
    try {
      const scopes = ['email', 'profile'];
      var authorization = await googleUser.authorizationClient
          .authorizationForScopes(scopes);
      authorization ??= await googleUser.authorizationClient.authorizeScopes(
        scopes,
      );
      accessToken = authorization.accessToken;
    } catch (_) {
      // Proceed with idToken alone
    }

    final credential = GoogleAuthProvider.credential(
      idToken: idToken,
      accessToken: accessToken,
    );

    final usercredential = await firebase.signInWithCredential(credential);

    if (usercredential.user != null) {
      return true;
    } else {
      return false;
    }
    /*
      await saveUserData(
        name: googleUser.displayName ?? '',
        email: googleUser.email,
      );
      */

    //  return right();
  }
}
