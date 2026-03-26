import 'package:ecommerce/feature/screen/detailproduct/manager/cubit/detail_cubit_cubit.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  final int value;
  final String quality;
  final dynamic cubit;
  final int? id;
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
                if (id == id) {
                  context.read<DetailCubitCubit>().deirement(quality, id);
                } else {
                  context.read<DetailCubitCubit>().deirement(quality);
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
              id != null
                  ? context.read<DetailCubitCubit>().increment(quality)
                  : context.read<DetailCubitCubit>().increment(quality, id);
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
