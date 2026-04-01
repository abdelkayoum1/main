import 'package:ecommerce/core/approuter.dart';
import 'package:ecommerce/feature/screen/Checkout/screen/checkout/checkout_cubit/pyment_cubitt.dart';
import 'package:ecommerce/feature/screen/Checkout/screen/checkout/models/pyment_model.dart';
import 'package:ecommerce/feature/screen/Checkout/screen/checkout/widjet/list_tile_pyment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListTilee extends StatefulWidget {
  final PymentModel pyment;
  const ListTilee({super.key, required this.pyment});
  @override
  State<ListTilee> createState() => _ListTileeState();
}

class _ListTileeState extends State<ListTilee> {
  PymentModel? selectedPayment;
  bool selectedvalue = false;
  String? ischecked;
  @override
  Widget build(BuildContext context) {
    // final cubit = BlocProvider.of<PymentCubitt>(context);
    return Material(
      child: InkWell(
        onTap: () async {
          final resultat = await showModalBottomSheet<PymentModel>(
            isScrollControlled: true,
            context: context,
            builder: (_) {
              return StatefulBuilder(
                builder: (context, set) {
                  return BlocProvider(
                    create: (context) {
                      final cubit = PymentCubitt();
                      cubit.fetchpyment();
                      return cubit;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      width: double.infinity,
                      height: 350,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 20,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payments Methode',
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              BlocBuilder<PymentCubitt, PymentState>(
                                buildWhen: (previous, current) =>
                                    current is FetchPymentStatesucces,
                                builder: (context, state) {
                                  if (state is FetchPymentStateFailure) {
                                    return Center(child: Text(state.msj));
                                  } else if (state is FetchPymentStatesucces) {
                                    // print(selectedPayment!.cardholdername);
                                    print('hi');
                                    return ListTilePyment(
                                      ischecked: ischecked,
                                      ontap: (id) {
                                        setState(() {
                                          ischecked = id;
                                        });

                                        set(() {});
                                      },

                                      pyment: selectedPayment,
                                    );
                                  } else {
                                    return Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    GoRouter.of(
                                      context,
                                    ).push(Approuter.addcard);
                                  },
                                  label: Text('Add card'),
                                  icon: Icon(Icons.add),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),

                              SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: BlocConsumer<PymentCubitt, PymentState>(
                                  buildWhen: (previous, current) =>
                                      current is Confirmemethodeloading ||
                                      current is Confirmemethodesucces,
                                  listener: (context, state) {
                                    if (state is Confirmemethodesucces) {
                                      final resultat = Navigator.pop(
                                        context,
                                        state.pyentcard,
                                      );
                                      print(state.pyentcard.id);
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is Confirmemethodeloading) {
                                      return ElevatedButton(
                                        onPressed: null,

                                        child:
                                            CircularProgressIndicator.adaptive(),
                                      );
                                    }
                                    print(ischecked);
                                    return ElevatedButton.icon(
                                      onPressed: () {
                                        context
                                            .read<PymentCubitt>()
                                            .confirmemethode(
                                              ischecked!,

                                              //  widget.pyment.ischecked!,
                                            );
                                      },
                                      label: Text('Confirme Methode'),
                                      icon: Icon(Icons.add),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.deepPurple,
                                        foregroundColor: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
          if (resultat != null) {
            setState(() {
              selectedPayment = resultat;
              // print(selectedPayment!.cardholdername);
              // print(selectedPayment!.id);
            });
          }
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Image.asset(
              'assets/Background (2).png',
              width: 50,
              height: 50,
            ),
            title: Text(
              selectedPayment?.cardholdername ?? widget.pyment.cardholdername,
            ),
            subtitle: Text(selectedPayment?.namecard ?? widget.pyment.namecard),
            trailing: Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }
}
