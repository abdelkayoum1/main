import 'package:bloc/bloc.dart';
import 'package:ecommerce/feature/screen/detailproduct/manager/cubit/detail_cubit_cubit.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';

part 'cart_cubit_state.dart';

class CartCubitCubit extends Cubit<CartCubitState> {
  CartCubitCubit() : super(CartCubitInitial());

  double get() {
    double totalpricee = cart.fold<double>(
      0,
      (previouseValue, price) =>
          previouseValue + price.product.price * price.quality,
    );

    return totalpricee;
  }

  void getcartitem() {
    emit(CartCubitlaoding());

    emit(CartCubitsucces(addtocart: cart, totalprice: get()));
  }

  int quality = 0;

  void increment(String qualityid, [String? id]) {
    //quality++;
    final cartindex = cart.indexWhere((item) => item.product.id == qualityid);

    cart[cartindex] = cart[cartindex].copyWith(
      quality: cart[cartindex].quality + 1,
    );
    // cart[cartindex] = cart[cartindex].copyWith( pricetotal: cart[cartindex].pricetotal + quality,);
    quality = cart[cartindex].quality;

    emit(DetailCubitcounterqualiterr(value: quality, id: qualityid));
    emit(Updatetotal(pricetotal: get()));
  }
  /*
  void remove(String index) {
    cart.removeWhere((item) => item.id == index);
    emit(CartCubitsucces(addtocart: cart));
  }
  */

  void deirement(String qualityid, [int? id]) {
    // quality--;
    final cartindex = cart.indexWhere((item) => item.product.id == qualityid);

    cart[cartindex] = cart[cartindex].copyWith(
      quality: cart[cartindex].quality - 1,
    );
    quality = cart[cartindex].quality;

    emit(DetailCubitcounterqualiterr(value: quality, id: qualityid));
    emit(Updatetotal(pricetotal: get()));
  }
}
