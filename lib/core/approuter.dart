import 'package:ecommerce/feature/screen/Checkout/screen/checkout/checkout.dart';
import 'package:ecommerce/feature/screen/Checkout/screen/checkout/widjet/add_new_card.dart';
import 'package:ecommerce/feature/screen/detailproduct/screen/detail_product.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';
import 'package:ecommerce/feature/screen/locationn/location.dart';
import 'package:ecommerce/feature/screen/nab_bar2/nav_bar_2.dart';
import 'package:go_router/go_router.dart';

class Approuter {
  static final detailproduct = '/detailproduct';
  static final checkout = '/checkout';
  static final addcard = '/addcard';
  static final location = '/location';
  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => NavBar2()),

      GoRoute(
        path: detailproduct,
        builder: (context, state) =>
            DetailProduct(list: state.extra as HomePageModel),
      ),

      GoRoute(
        path: checkout,
        builder: (context, state) =>
            Checkout(cart: state.extra as List<Addtocart>),
      ),
      GoRoute(path: addcard, builder: (context, state) => AddNewCard()),

      GoRoute(path: location, builder: (context, state) => Location()),
    ],
  );
}
