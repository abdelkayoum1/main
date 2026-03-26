import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/feature/screen/detailproduct/manager/cubit/detail_cubit_cubit.dart';
import 'package:ecommerce/feature/screen/detailproduct/screen/widget/counter.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';
import 'package:ecommerce/feature/screen/order/feature/screen/cart_cubit/cart_cubit_cubit.dart'
    hide DetailCubitcounterqualiter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  final Addtocart cart;
  const CartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: CachedNetworkImage(
            imageUrl: cart.product.imgUrl,
            width: 100,
            height: 100,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cart.product.name),

              Text(
                'Size:${cart.size.name}',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<DetailCubitCubit, DetailCubitState>(
                      buildWhen: (previous, current) =>
                          current is DetailCubitcounterqualiter &&
                          current.id == cart.product.id,
                      builder: (context, state) {
                        if (state is DetailCubitcounterqualiter) {
                          return Counter(
                            value: state.quality,
                            quality: cart.product.id,
                            cubit: context.read<DetailCubitCubit>(),
                          );
                        }
                        return Counter(
                          value: cart.quality,
                          quality: cart.product.id,
                          cubit: context.read<DetailCubitCubit>(),
                        );
                      },
                    ),
                    Text(
                      '\$${cart.product.price}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubitCubit>().remove(cart.id);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
