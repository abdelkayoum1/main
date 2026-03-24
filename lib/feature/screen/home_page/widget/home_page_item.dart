import 'package:flutter/material.dart';

class Homepageitem extends StatelessWidget {
  const Homepageitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

                // color: Colors.red,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/Background (2).png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                  // color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        Text(
          'hebrhjfbhjr',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('hebrhjfbhjr', style: TextStyle(color: Colors.grey, fontSize: 12)),
        Text(
          '\$195',
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
