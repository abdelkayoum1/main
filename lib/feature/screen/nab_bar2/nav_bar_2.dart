import 'package:ecommerce/feature/screen/favorate/favorate.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/addtocart.dart';
import 'package:ecommerce/feature/screen/home_page/home_page.dart';
import 'package:ecommerce/feature/screen/home_page/widget/homepage_app_bar.dart';
import 'package:ecommerce/feature/screen/order/feature/screen/cart_cubit/cart_cubit_cubit.dart';
import 'package:ecommerce/feature/screen/order/feature/screen/order.dart';
import 'package:ecommerce/feature/screen/prefile/prefile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavBar2 extends StatefulWidget {
  const NavBar2({super.key});

  @override
  State<NavBar2> createState() => _NavBar2State();
}

class _NavBar2State extends State<NavBar2> {
  late final PersistentTabController _controller;
  int currentindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/Background (2).png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'datajbejrkvbre',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      'datahvhjcvhjzevhjchj',
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          if (currentindex == 0) ...[
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),

            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          ] else if (currentindex == 1) ...[
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),

            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart)),
          ],
        ],
      ),
      body: PersistentTabView(
        onTabChanged: (index) {
          setState(() {
            currentindex = index;
          });
        },
        stateManagement: false,
        controller: _controller,

        tabs: [
          PersistentTabConfig(
            screen: HomePage(),
            item: ItemConfig(icon: Icon(CupertinoIcons.home), title: "Home"),
          ),
          PersistentTabConfig(
            screen: BlocProvider(
              create: (context) {
                final cubit = CartCubitCubit();
                cubit.getcartitem();
                return cubit;
              },
              child: Order(),
            ),
            item: ItemConfig(icon: Icon(CupertinoIcons.cart), title: "Order"),
          ),
          PersistentTabConfig(
            screen: Favorate(),
            item: ItemConfig(icon: Icon(Icons.favorite), title: "Favorate"),
          ),

          PersistentTabConfig(
            screen: Prefile(),
            item: ItemConfig(icon: Icon(Icons.person), title: "person"),
          ),
        ],
        navBarBuilder: (navBarConfig) =>
            Style6BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}
