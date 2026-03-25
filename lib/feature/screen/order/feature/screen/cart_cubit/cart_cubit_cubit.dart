import 'package:bloc/bloc.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:meta/meta.dart';

part 'cart_cubit_state.dart';

class CartCubitCubit extends Cubit<CartCubitState> {
  CartCubitCubit() : super(CartCubitInitial());

  void getcartitem() {
    emit(CartCubitlaoding());

    try {
      emit(CartCubitsucces(addtocart: cart));
    } catch (e) {
      emit(CartCubitfailure(error: e.toString()));
    }
  }
}
