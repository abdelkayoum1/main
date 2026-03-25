import 'package:cached_network_image/cached_network_image.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<CartCubitCubit, CartCubitState>(
          builder: (context, state) {
            if (state is CartCubitfailure) {
              return Center(child: Text(state.error));
            } else if (state is CartCubitsucces) {
              if (state.addtocart.isEmpty) {
                return Center(child: Text('no item dans cart'));
              }
              return Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.addtocart.length,
                    itemBuilder: (context, index) {
                      return CartItem(cart: state.addtocart[index]);
                    },
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
