import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/feature/screen/detailproduct/manager/cubit/detail_cubit_cubit.dart';
import 'package:ecommerce/feature/screen/detailproduct/screen/widget/counter.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';
import 'package:ecommerce/feature/screen/order/feature/screen/cart_cubit/cart_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatefulWidget {
  final Addtocart cart;
  const CartItem({super.key, required this.cart});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCubitCubit(),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: CachedNetworkImage(
              imageUrl: widget.cart.product.imgUrl,
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.cart.product.name),

                Text(
                  'Size:${widget.cart.size.name}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<CartCubitCubit, CartCubitState>(
                        buildWhen: (previous, current) =>
                            current is CartCubitqualiter,
                        builder: (context, state) {
                          if (state is CartCubitqualiter) {
                            return Counter(
                              value: state.qualite,
                              quality: widget.cart.product.id,
                              cubit: context.read<DetailCubitCubit>(),
                            );
                          }
                          return Counter(
                            value: widget.cart.quality,
                            quality: widget.cart.product.id,
                            cubit: context.read<CartCubitCubit>(),
                          );
                        },
                      ),
                      Text(
                        '\$${widget.cart.product.price}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      context.read<CartCubitCubit>().remove(widget.cart.id);
                    });
                  },
                  child: Text('delete'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
