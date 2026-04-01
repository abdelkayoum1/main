import 'package:ecommerce/core/approuter.dart';
import 'package:ecommerce/feature/screen/Checkout/screen/checkout/checkout_cubit/pyment_cubitt.dart';
import 'package:ecommerce/feature/screen/Checkout/screen/checkout/models/pyment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListTilePyment extends StatefulWidget {
  final PymentModel? pyment;
  final String? ischecked;
  final Function(String id) ontap;

  const ListTilePyment({
    super.key,
    required this.pyment,
    this.ischecked,
    required this.ontap,
  });

  @override
  State<ListTilePyment> createState() => _ListTilePymentState();
}

class _ListTilePymentState extends State<ListTilePyment> {
  String? ischeckedd;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                widget.ontap(pymentmodel[index].id);
                // if (ischecked == null) {
                //ischeckedd = pymentmodel[index].id;
                print(pymentmodel[index].id);

                //Navigator.pop(context, pymentmodel[index]);

                // print(pymentmodel[index].cvv);
                //  } else {
                //    ischecked = null;
                //  }
              });
            },
            child: Card(
              color: Colors.white,

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/Background (2).png',
                      width: 50,
                      height: 50,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(pymentmodel[index].cardholdername),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(pymentmodel[index].namecard),
                              Checkbox(
                                value:
                                    widget.ischecked == pymentmodel[index].id,

                                onChanged: (value) {},
                              ),
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
        },
        separatorBuilder: (context, index) {
          return Divider(thickness: 2, color: Colors.black);
        },
        itemCount: pymentmodel.length,
      ),
    );
  }
}
