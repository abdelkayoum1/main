import 'dart:ui';

import 'package:ecommerce/feature/screen/detailproduct/manager/cubit/detail_cubit_cubit.dart';
import 'package:ecommerce/feature/screen/detailproduct/screen/widget/counter.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProduct extends StatelessWidget {
  final HomePageModel list;
  const DetailProduct({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return SafeArea(
      child: BlocProvider(
        create: (context) => DetailCubitCubit(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Detail Product'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_sharp)),
            ],
          ),
          body: Stack(
            children: [
              Container(
                height: size * 0.5,
                decoration: BoxDecoration(color: Colors.grey.shade100),
                // color: Colors.green,
                // width: double.infinity,
                // height: 250,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Image.network(
                      list.imgUrl,
                      height: size * 0.4,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: size * 0.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 6)],

                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              list.name,
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            BlocBuilder<DetailCubitCubit, DetailCubitState>(
                              buildWhen: (previous, current) =>
                                  current is DetailCubitcounterqualiter,
                              builder: (context, state) {
                                if (state is DetailCubitcounterqualiter) {
                                  return Counter(
                                    cubit: context.read<DetailCubitCubit>(),
                                    quality: list.id.toString(),
                                    value: state.quality,
                                  );
                                } else {
                                  return Counter(
                                    value: 0,
                                    quality: list.id,
                                    cubit: context.read<DetailCubitCubit>(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellowAccent),

                                Text(
                                  '${list.price}',
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '(320 Review),',
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Avaliable is stok',
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Size',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        BlocBuilder<DetailCubitCubit, DetailCubitState>(
                          buildWhen: (previous, current) =>
                              current is DetailCubitchangesize,
                          builder: (context, state) {
                            return Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              children: ProductSize.values
                                  .map(
                                    (size) => Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: InkWell(
                                        onTap: () {
                                          context
                                              .read<DetailCubitCubit>()
                                              .changesize(size);
                                        },
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color:
                                                state is DetailCubitchangesize &&
                                                    state.size == size
                                                ? Colors.blue
                                                : Colors.grey,
                                            shape: BoxShape.circle,
                                          ),

                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              size.name,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color:
                                                    state is DetailCubitchangesize &&
                                                        state.size == size
                                                    ? Colors.black
                                                    : Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          list.description,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(color: Colors.black45),
                        ),
                        Expanded(child: SizedBox()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: '\$',
                                    style: TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    children: [
                                      TextSpan(
                                        text: '${list.price}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            BlocBuilder<DetailCubitCubit, DetailCubitState>(
                              builder: (context, state) {
                                if (state is Addtocardloading) {
                                  return ElevatedButton(
                                    onPressed: null,
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is Addtocardsucces) {
                                  return ElevatedButton(
                                    onPressed: null,
                                    child: Text('additing to cart'),
                                  );
                                }
                                return Row(
                                  children: [
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          9,
                                          61,
                                          151,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: TextButton.icon(
                                        onPressed: () {
                                          if (context
                                                      .read<DetailCubitCubit>()
                                                      .sizee !=
                                                  null &&
                                              context
                                                      .read<DetailCubitCubit>()
                                                      .quality >
                                                  0) {
                                            context
                                                .read<DetailCubitCubit>()
                                                .addtocart(list.id);
                                          } else {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'please selected size and  qualiter',
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        label: Text(
                                          'Add To Cart',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(color: Colors.white),
                                        ),
                                        icon: Icon(
                                          Icons.card_travel,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
