// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';

class Addtocart {
  final String id;
  final HomePageModel product;
  final ProductSize size;
  final int quality;
  final double pricetotal;

  Addtocart({
    this.pricetotal = 0.0,
    required this.id,
    required this.size,
    required this.quality,
    required this.product,
  });

  Addtocart copyWith({
    double? pricetotal,
    String? id,
    HomePageModel? product,
    ProductSize? size,
    int? quality,
  }) {
    return Addtocart(
      pricetotal: pricetotal ?? this.pricetotal,
      id: id ?? this.id,
      product: product ?? this.product,
      size: size ?? this.size,
      quality: quality ?? this.quality,
    );
  }

  double gettotalprice() {
    double price = product.price * quality;
    return price;
  }
}

List<Addtocart> cart = [];
