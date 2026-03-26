import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/feature/screen/home_page/data/models/home_page_mode.dart';
import 'package:ecommerce/feature/screen/home_page/widget/catehoryhomepage.dart';
import 'package:ecommerce/feature/screen/home_page/widget/homepage_app_bar.dart';
import 'package:ecommerce/feature/screen/home_page/widget/homepagelistviews.dart';
import 'package:ecommerce/feature/screen/home_page/widget/hometabbarViews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            // Homepageappbar(),
            TabBar(
              unselectedLabelColor: Colors.grey,
              controller: controller,
              tabs: [
                Tab(text: 'Home'),

                Tab(text: 'Category'),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  'New Arrivels',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 100),
                Text(
                  'See All',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [Hometabbarviews(), Catehoryhomepage()],
              ),
            ),

            //  Homepageitem(),
          ],
        ),
      ),
    );
  }
}
