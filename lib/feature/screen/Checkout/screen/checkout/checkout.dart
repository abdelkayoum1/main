import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/approuter.dart';
import 'package:ecommerce/feature/screen/Checkout/cubit/chackout_cubit_cubit.dart';
import 'package:ecommerce/feature/screen/Checkout/screen/checkout/models/pyment_model.dart';
import 'package:ecommerce/feature/screen/Checkout/screen/checkout/widjet/list_tile.dart';
import 'package:ecommerce/feature/screen/Checkout/screen/checkout/widjet/shopping.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Checkout extends StatelessWidget {
  final List<Addtocart> cart;

  const Checkout({super.key, required this.cart});

  Widget chhosepymentcard(BuildContext context, PymentModel? pyment) {
    if (pyment != null) {
      return ListTilee(pyment: pyment);
    } else {
      return Shopping(
        title: 'Add Methode payment',
        ontap: () {
          GoRouter.of(context).push(Approuter.addcard);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ChackoutCubitCubit();
        cubit.getproduct();
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Checkout'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: BlocBuilder<ChackoutCubitCubit, ChackoutCubitState>(
            buildWhen: (previous, current) =>
                current is ChackoutCubitloading ||
                current is ChackoutCubitsucces ||
                current is ChackoutCubitfailure,
            builder: (context, state) {
              if (state is ChackoutCubitfailure) {
                return Center(child: Text(state.error));
              } else if (state is ChackoutCubitsucces) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Adresse',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextButton(onPressed: () {}, child: Text('Edit')),
                      ],
                    ),

                    Shopping(
                      title: 'Add shipping Adress',
                      ontap: () {
                        GoRouter.of(context).push(Approuter.location);
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Product (${state.numproduct}):',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: cart[index].product.imgUrl,
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
                                  Text(cart[index].product.name),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: 'Size:',
                                          children: [
                                            TextSpan(
                                              text: cart[index].size.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '\$${(cart[index].quality * cart[index].product.price).toStringAsFixed(1)}',

                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(thickness: 2, color: Colors.black);
                      },
                      itemCount: cart.length,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Payment Methode',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    chhosepymentcard(context, state.choosepyment),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount'),
                        Text('\$${state.totalamount}'),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'payé',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator.adaptive());
              }
            },
          ),
        ),
      ),
    );
  }
}
