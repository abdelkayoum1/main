import 'package:ecommerce/core/approuter.dart';
import 'package:ecommerce/feature/screen/Checkout/screen/checkout/models/pyment_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListTilee extends StatefulWidget {
  final PymentModel pyment;
  const ListTilee({super.key, required this.pyment});

  @override
  State<ListTilee> createState() => _ListTileeState();
}

class _ListTileeState extends State<ListTilee> {
  String? selectedvalue;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    width: double.infinity,
                    height: 500,
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

                            ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Image.asset(
                                    'assets/Background (2).png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  title: Text(
                                    pymentmodel[index].cardholdername,
                                  ),
                                  subtitle: Text('243'),
                                  trailing: Checkbox(
                                    value:
                                        selectedvalue == pymentmodel[index].id,

                                    onChanged: (value) {
                                      setState(() {
                                        selectedvalue = pymentmodel[index].id;
                                      });
                                    },
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  thickness: 2,
                                  color: Colors.black,
                                );
                              },
                              itemCount: pymentmodel.length,
                            ),

                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  GoRouter.of(context).push(Approuter.addcard);
                                },
                                label: Text('Add card'),
                                icon: Icon(Icons.add),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
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
            title: Text('Master card'),
            subtitle: Text(widget.pyment.namecard),
            trailing: Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }
}
