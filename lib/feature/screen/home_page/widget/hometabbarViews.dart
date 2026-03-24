import 'package:ecommerce/feature/screen/home_page/home_page.dart';
import 'package:ecommerce/feature/screen/home_page/widget/homepagelistviews.dart';
import 'package:flutter/material.dart';

class Hometabbarviews extends StatelessWidget {
  const Hometabbarviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Carousel(),
        SizedBox(height: 20),
        Expanded(child: HomepageListviews()),
      ],
    );
  }
}
