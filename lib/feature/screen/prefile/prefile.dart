import 'package:ecommerce/core/approuter.dart';
import 'package:ecommerce/feature/screen/login%20and%20register/widget/login_cubit%20%20and%20register_cubit/login_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Prefile extends StatelessWidget {
  const Prefile({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubitCubit>(context);
    return Scaffold(
      body: Center(
        child: BlocConsumer<LoginCubitCubit, LoginCubitState>(
          listener: (context, state) {
            if (state is Logoutsucces) {
              GoRouter.of(context).pushReplacement(Approuter.login);
            } else if (state is Logoutfailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          //buildWhen: (previous, current) => current is Logoutloading,
          builder: (context, state) {
            if (state is Logoutloading) {
              return ElevatedButton(
                onPressed: null,
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return ElevatedButton(
              onPressed: () {
                cubit.logout();
              },
              child: Text('Logout'),
            );
          },
        ),
      ),
    );
  }
}
