import 'package:ecommerce/feature/screen/home_page/home_page.dart';
import 'package:ecommerce/feature/screen/home_page/widget/home_page_item.dart';
import 'package:flutter/material.dart';

class HomepageListviews extends StatelessWidget {
  const HomepageListviews({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: 240,
        // childAspectRatio: 7,
      ),
      itemBuilder: (context, index) {
        return Homepageitem();
      },
    );
  }
}
