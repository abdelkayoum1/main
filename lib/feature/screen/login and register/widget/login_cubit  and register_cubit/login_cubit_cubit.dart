import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/dart_either.dart';
import 'package:ecommerce/core/firestore_servvice.dart';
import 'package:ecommerce/feature/screen/login%20and%20register/data/repo/login_repo_imp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  final LoginRepoImp loginrepo;
  LoginCubitCubit(this.loginrepo) : super(LoginCubitInitial());

  Future<void> loginn(String email, String password) async {
    try {
      emit(LoginCubitlaoding());
      final user = await loginrepo.login(email: email, password: password);

      if (user) {
        emit(LoginCubitsucces());
        print('loginsucces');
      } else {
        emit(LoginCubitfailure(error: 'error'));
      }
    } catch (e) {
      emit(LoginCubitfailure(error: e.toString()));
    }
  }

  Future<void> sign(String email, String password, String username) async {
    try {
      emit(RegisterCubitlaoding());
      final user = await loginrepo.sign(email: email, password: password);

      final firestore = FirestoreServvicee.instance;
      print("22222222222222222");

      if (user) {
        final userid = FirebaseAuth.instance.currentUser!.uid;

        print('succes');
        await firestore.setdata(
          path: 'users/$userid',
          data: {'id': DateTime.now(), 'email': email, 'username': username},
        );
        emit(RegisterCubitsucces());
        print('succes222');
      } else {
        emit(RegisterCubitfailure(error: 'error'));
      }
    } catch (e) {
      emit(RegisterCubitfailure(error: e.toString()));
    }
  }

  void getuser() {
    final user = loginrepo.getuser();
    if (user != null) {
      emit(LoginCubitsucces());
    }
  }

  void logout() {
    print('loding');
    emit(Logoutloading());
    print('lodingloding');
    try {
      loginrepo.logout();
      emit(Logoutsucces());
    } catch (e) {
      emit(Logoutfailure(error: e.toString()));
    }
  }

  Future<void> signgoogle() async {
    emit(Signgoogleloading());
    try {
      final resultat = await loginrepo.signInWithGoogle();

      if (resultat) {
        emit(Signgooglesucces());
      } else {
        emit(Signgooglefailure(error: 'error'));
      }
    } catch (e) {
      emit(Signgooglefailure(error: e.toString()));
    }
  }
}
