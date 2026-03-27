import 'package:ecommerce/feature/screen/detailproduct/manager/cubit/detail_cubit_cubit.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  final int value;
  final String quality;
  final dynamic cubit;
  final String? id;
  const Counter({
    super.key,
    required this.value,
    this.id,
    required this.quality,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (value > 0) {
                if (id != null) {
                  cubit.deirement(quality, id);
                } else {
                  cubit.deirement(quality);
                }
              } else {}
            },
            icon: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,

                shape: BoxShape.circle,
              ),
              child: Icon(Icons.remove, color: Colors.black),
            ),
          ),

          Text(
            value.toString(),
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),

          IconButton(
            onPressed: () {
              if (id != null) {
                cubit.increment(quality, id);
              } else {
                cubit.increment(quality);
              }
            },
            icon: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
