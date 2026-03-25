part of 'detail_cubit_cubit.dart';

sealed class DetailCubitState {}

final class DetailCubitInitial extends DetailCubitState {}

final class DetailCubitcounterqualiter extends DetailCubitState {
  final int quality;

  DetailCubitcounterqualiter({required this.quality});
}

final class DetailCubitchangesize extends DetailCubitState {
  final ProductSize size;

  DetailCubitchangesize({required this.size});
}

final class Addtocardloading extends DetailCubitState {}

final class Addtocardsucces extends DetailCubitState {
  final String product;

  Addtocardsucces({required this.product});
}
