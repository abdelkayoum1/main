import 'package:ecommerce/core/approuter.dart';
import 'package:ecommerce/feature/screen/Checkout/cubit/chackout_cubit_cubit.dart';
import 'package:ecommerce/feature/screen/locationn/model/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListTileLocation extends StatefulWidget {
  final LocationModel location;
  const ListTileLocation({super.key, required this.location});

  @override
  State<ListTileLocation> createState() => _ListTileLocationState();
}

class _ListTileLocationState extends State<ListTileLocation> {
  LocationModel? locationn;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final resultat = await GoRouter.of(
          context,
        ).push<LocationModel>(Approuter.location);
        if (resultat != null) {
          locationn = resultat;
          print(resultat.city);
          context.read<ChackoutCubitCubit>().getproduct();
        }
      },
      child: Card(
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/Background (2).png', width: 100, height: 100),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(locationn?.city ?? widget.location.city),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(locationn?.country ?? widget.location.country),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /*
               ListTile(
                onTap: () {
                  setState(() {
                    // if (ischecked == null) {
                    ischecked = pymentmodel[index].id;
                    print(pymentmodel[index].id);
            
                    //Navigator.pop(context, pymentmodel[index]);
            
                    // print(pymentmodel[index].cvv);
                    //  } else {
                    //    ischecked = null;
                    //  }
                  });
                },
                leading: Image.asset(
                  'assets/Background (2).png',
                  width: 50,
                  height: 50,
                ),
                title: Text(pymentmodel[index].cardholdername),
                subtitle: Text(pymentmodel[index].namecard),
            
                trailing: Checkbox(
                  value: ischecked == pymentmodel[index].id,
            
                  onChanged: (value) {},
                ),
              ),
              */
      ),
    );
  }
}
