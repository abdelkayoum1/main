part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginCubitlaoding extends LoginCubitState {}

final class LoginCubitsucces extends LoginCubitState {}

final class LoginCubitfailure extends LoginCubitState {
  final String error;

  LoginCubitfailure({required this.error});
}

final class RegisterCubitlaoding extends LoginCubitState {}

final class RegisterCubitsucces extends LoginCubitState {}

final class RegisterCubitfailure extends LoginCubitState {
  final String error;

  RegisterCubitfailure({required this.error});
}
