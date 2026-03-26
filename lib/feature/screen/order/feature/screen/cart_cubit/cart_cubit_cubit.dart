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

  void remove(String index) {
    cart.removeWhere((item) => item.id == index);
    emit(CartCubitsucces(addtocart: cart));
  }

  int quality = 0;
  void increment(String qualityid) {
    quality++;
    print("object");
    emit(DetailCubitcounterqualiter(value: quality));
  }

  void deirement(String qualityid) {
    quality--;
    emit(DetailCubitcounterqualiter(value: quality));
  }
}
