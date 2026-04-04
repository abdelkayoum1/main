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

final class Logoutloading extends LoginCubitState {}

final class Logoutsucces extends LoginCubitState {}

final class Logoutfailure extends LoginCubitState {
  final String error;

  Logoutfailure({required this.error});
}

final class Signgoogleloading extends LoginCubitState {}

final class Signgooglesucces extends LoginCubitState {}

final class Signgooglefailure extends LoginCubitState {
  final String error;

  Signgooglefailure({required this.error});
}
