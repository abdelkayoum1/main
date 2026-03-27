part of 'cart_cubit_cubit.dart';

sealed class CartCubitState {}

final class CartCubitInitial extends CartCubitState {}

final class CartCubitlaoding extends CartCubitState {}

final class CartCubitsucces extends CartCubitState {
  final List<Addtocart> addtocart;
  final double totalprice;

  CartCubitsucces({required this.addtocart, required this.totalprice});
}

final class DetailCubitcounterqualiterr extends CartCubitState {
  final int value;
  final String id;

  DetailCubitcounterqualiterr({required this.value, required this.id});
}

final class CartCubitfailure extends CartCubitState {
  final String error;

  CartCubitfailure({required this.error});
}

final class Updatetotal extends CartCubitState {
  final double pricetotal;

  Updatetotal({required this.pricetotal});
}
