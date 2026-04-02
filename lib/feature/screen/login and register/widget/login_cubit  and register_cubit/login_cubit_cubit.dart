import 'package:bloc/bloc.dart';
import 'package:ecommerce/feature/screen/login%20and%20register/data/repo/login_repo_imp.dart';
import 'package:meta/meta.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  final LoginRepoImp loginrepo;
  LoginCubitCubit(this.loginrepo) : super(LoginCubitInitial());

  Future<void> loginn(String password, String email) async {
    try {
      emit(LoginCubitlaoding());
      final user = await loginrepo.login(email: email, password: password);

      if (user) {
        emit(LoginCubitsucces());
      } else {
        emit(LoginCubitfailure(error: 'error'));
      }
    } catch (e) {
      emit(LoginCubitfailure(error: e.toString()));
    }
  }

  Future<void> sign(String password, String email) async {
    try {
      emit(LoginCubitlaoding());
      final user = await loginrepo.sign(email: email, password: password);

      if (user) {
        emit(RegisterCubitlaoding());
      } else {
        emit(RegisterCubitsucces());
      }
    } catch (e) {
      emit(LoginCubitfailure(error: e.toString()));
    }
  }
}
