import 'package:ecommerce/core/approuter.dart';
import 'package:ecommerce/feature/screen/Checkout/cubit/chackout_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Shopping extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const Shopping({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChackoutCubitCubit>(context);
    return InkWell(
      onTap: ontap,

      //  GoRouter.of( context,).push(Approuter.addcard).then((value) => cubit.getproduct());
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: double.infinity,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, size: 30),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
