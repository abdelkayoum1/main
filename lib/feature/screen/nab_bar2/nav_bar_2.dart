import 'package:ecommerce/feature/screen/favorate/favorate.dart';
import 'package:ecommerce/feature/screen/home_page/home_page.dart';
import 'package:ecommerce/feature/screen/order/order.dart';
import 'package:ecommerce/feature/screen/prefile/prefile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavBar2 extends StatefulWidget {
  const NavBar2({super.key});

  @override
  State<NavBar2> createState() => _NavBar2State();
}

class _NavBar2State extends State<NavBar2> {
  late final PersistentTabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,

      tabs: [
        PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(icon: Icon(CupertinoIcons.home), title: "Home"),
        ),
        PersistentTabConfig(
          screen: Order(),
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
    );
  }
}
