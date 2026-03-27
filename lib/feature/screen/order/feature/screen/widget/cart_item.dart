import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/feature/screen/detailproduct/screen/widget/counter.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';
import 'package:ecommerce/feature/screen/order/feature/screen/cart_cubit/cart_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  final Addtocart cart;
  const CartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: CachedNetworkImage(
                imageUrl: cart.product.imgUrl,
                width: 100,
                height: 100,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cart.product.name),

                Text.rich(
                  TextSpan(
                    text: 'Size:',
                    children: [
                      TextSpan(
                        text: cart.size.name,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                BlocBuilder<CartCubitCubit, CartCubitState>(
                  buildWhen: (previous, current) =>
                      current is DetailCubitcounterqualiterr &&
                      current.id == cart.product.id,
                  builder: (context, state) {
                    if (state is DetailCubitcounterqualiterr) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Counter(
                            value: state.value,
                            quality: cart.product.id,
                            cubit: context.read<CartCubitCubit>(),
                          ),
                          Text(
                            '\$${(state.value * cart.product.price).toStringAsFixed(1)}',

                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              //  context.read<CartCubitCubit>().remove(cart.id);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      );
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Counter(
                          value: cart.quality,
                          quality: cart.product.id,
                          cubit: context.read<CartCubitCubit>(),
                        ),
                        Text(
                          '\$${cart.gettotalprice()}',

                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            //  context.read<CartCubitCubit>().remove(cart.id);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    );
                    /*
                
                    return Counter(
                      value: cart.quality,
                      quality: cart.product.id,
                      cubit: context.read<CartCubitCubit>(),
                    );
                    */
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
