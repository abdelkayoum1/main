import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';
import 'package:ecommerce/feature/screen/order/feature/screen/cart_cubit/cart_cubit_cubit.dart';
import 'package:ecommerce/feature/screen/order/feature/screen/widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CartCubitCubit, CartCubitState>(
        bloc: context.read<CartCubitCubit>(),
        buildWhen: (previous, current) => current is CartCubitsucces,
        builder: (context, state) {
          if (state is CartCubitfailure) {
            return Center(child: Text(state.error));
          } else if (state is CartCubitsucces) {
            if (state.addtocart.isEmpty) {
              return Center(child: Text('no item dans cart'));
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          Divider(thickness: 2, color: Colors.black),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.addtocart.length,
                      itemBuilder: (context, index) {
                        return CartItem(cart: state.addtocart[index]);
                      },
                    ),
                    SizedBox(height: 30),
                    BlocBuilder<CartCubitCubit, CartCubitState>(
                      builder: (context, substate) {
                        if (substate is Updatetotal) {
                          return Column(
                            children: [
                              TotalandsubtotalWidjet(
                                context,
                                title: 'Subtotal',
                                amount: substate.pricetotal,
                              ),
                              TotalandsubtotalWidjet(
                                context,
                                title: 'Shpping',
                                amount: 10,
                              ),
                              TotalandsubtotalWidjet(
                                context,
                                title: 'Total Amounts',
                                amount: substate.pricetotal + 10,
                              ),
                            ],
                          );
                        }
                        return Column(
                          children: [
                            TotalandsubtotalWidjet(
                              context,
                              title: 'Subtotal',
                              amount: state.totalprice,
                            ),
                            TotalandsubtotalWidjet(
                              context,
                              title: 'Shpping',
                              amount: 10,
                            ),
                            TotalandsubtotalWidjet(
                              context,
                              title: 'Total Amounts',
                              amount: state.totalprice + 10,
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          //  context.read<CartCubitCubit>().remove(cart.id);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          'Chechout',

                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget TotalandsubtotalWidjet(
  // ignore: strict_top_level_inference
  context, {
  required String title,
  required double amount,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: Colors.grey),
      ),
      Text(
        '\$${amount.toString()}',
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
    ],
  );
}
