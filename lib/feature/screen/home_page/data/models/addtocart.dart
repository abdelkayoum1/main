// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';

class Addtocart {
  final String id;
  final HomePageModel product;
  final ProductSize size;
  final int quality;

  Addtocart({
    required this.id,
    required this.size,
    required this.quality,
    required this.product,
  });
  /*
  Addtocart copyWith({Strin g? id, ProductSize? size, int? quality}) {
    return Addtocart(
      product: product?,
      id: id ?? this.id,
      size: size ?? this.size,
      quality: quality ?? this.quality,
    );
  }
  */
}

List<Addtocart> cart = [];
