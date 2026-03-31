import 'package:ecommerce/feature/screen/locationn/data/cubit/location_cubit_cubit.dart';
import 'package:ecommerce/feature/screen/locationn/model/location_model.dart';
import 'package:ecommerce/feature/screen/locationn/screnn/widget/textfieledd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  LocationModel? locationid;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubitCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text('adresse')),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose location',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Textfieledd(
                title: 'Youre Location',
                sufixe: Icon(Icons.add),
                prefixIcon: Icon(Icons.location_on),
              ),
              SizedBox(height: 10),
              Text(
                'Select location',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade200,
                    ),
                    child: InkWell(
                      onTap: () {
                        // ontap(location[index].id);
                        locationid = location[index];
                        print(location[index].id);
                        // Navigator.pop(context, location[index]);
                      },
                      child: ListTile(
                        title: Text(location[index].city),
                        subtitle: Text(
                          location[index].country,
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall!.copyWith(color: Colors.grey),
                        ),
                        trailing: ClipOval(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.black,

                              image: DecorationImage(
                                image: AssetImage('assets/location.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(thickness: 1, color: Colors.black);
                },
                itemCount: location.length,
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: BlocConsumer<LocationCubitCubit, LocationCubitState>(
                  listener: (context, state) {
                    if (state is LocationCubitsucces) {
                      Navigator.pop(context, locationid);
                    }
                  },
                  builder: (context, state) {
                    if (state is LocationCubitloading) {
                      return ElevatedButton(
                        onPressed: null,
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () {
                        context.read<LocationCubitCubit>().confirmelocation(
                          locationid,
                          locationid!.id,
                        );
                      },
                      child: Text('Confirmer'),
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
    );
  }
}
