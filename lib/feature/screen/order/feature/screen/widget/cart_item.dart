import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Addtocart cart;
  const CartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: cart.product.imgUrl,
          width: 100,
          height: 100,
        ),
      ],
    );
  }
}
