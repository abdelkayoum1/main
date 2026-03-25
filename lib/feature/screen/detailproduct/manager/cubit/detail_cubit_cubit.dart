import 'package:bloc/bloc.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';

part 'detail_cubit_state.dart';

class DetailCubitCubit extends Cubit<DetailCubitState> {
  DetailCubitCubit() : super(DetailCubitcounterqualiter(quality: 0));
  late ProductSize sizee;
  late int quality;
  void increment(String qualityid) {
    final selectedindex = list.indexWhere(
      (listequality) => listequality.id == qualityid,
    );

    list[selectedindex] = list[selectedindex].copyWith(
      quality: list[selectedindex].quality + 1,
    );
    quality = list[selectedindex].quality;
    print("object");
    emit(DetailCubitcounterqualiter(quality: list[selectedindex].quality));
  }

  void deirement(String qualityid) {
    final selectedindex = list.indexWhere((index) => index.id == qualityid);
    list[selectedindex] = list[selectedindex].copyWith(
      quality: list[selectedindex].quality - 1,
    );
    quality = list[selectedindex].quality;
    emit(DetailCubitcounterqualiter(quality: list[selectedindex].quality));
  }

  void changesize(ProductSize size) {
    sizee = size;
    emit(DetailCubitchangesize(size: size));
  }

  void addtocart(String id) async {
    emit(Addtocardloading());
    final cartitem = Addtocart(id: id, size: sizee, quality: quality);

    cart.add(cartitem);
    await Future.delayed(Duration(seconds: 1), () {
      if (!isClosed) {
        emit(Addtocardsucces(product: id));
      }
    });
  }
}
