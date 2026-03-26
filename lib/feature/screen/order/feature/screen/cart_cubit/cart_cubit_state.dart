part of 'cart_cubit_cubit.dart';

@immutable
sealed class CartCubitState {}

final class CartCubitInitial extends CartCubitState {}

final class CartCubitlaoding extends CartCubitState {}

final class CartCubitsucces extends CartCubitState {
  final List<Addtocart> addtocart;

  CartCubitsucces({required this.addtocart});
}

final class DetailCubitcounterqualiter extends CartCubitState {
  final int value;

  DetailCubitcounterqualiter({required this.value});
}

final class CartCubitfailure extends CartCubitState {
  final String error;

  CartCubitfailure({required this.error});
}
