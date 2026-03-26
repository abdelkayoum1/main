import 'package:bloc/bloc.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';

part 'detail_cubit_state.dart';

class DetailCubitCubit extends Cubit<DetailCubitState> {
  DetailCubitCubit() : super(DetailCubitInitial());
  ProductSize? sizee;
  int quality = 0;
  void increment(String qualityid, [int? id]) {
    quality++;
    print("object");
    emit(DetailCubitcounterqualiter(quality: quality, id: qualityid));
  }

  void deirement(String qualityid, [int? id]) {
    if (id != null) {
      quality = id;
    }
    quality--;
    emit(DetailCubitcounterqualiter(quality: quality, id: qualityid));
  }

  void changesize(ProductSize size) {
    sizee = size;
    emit(DetailCubitchangesize(size: size));
  }

  void addtocart(String id) async {
    emit(Addtocardloading());
    final cartitem = Addtocart(
      id: DateTime.now().toString(),
      size: sizee!,
      quality: quality,
      product: list.firstWhere((item) => item.id == id),
    );

    cart.add(cartitem);
    await Future.delayed(Duration(seconds: 1), () {
      if (!isClosed) {
        emit(Addtocardsucces(product: id));
      }
    });
  }
}
