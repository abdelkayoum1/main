import 'package:flutter/material.dart';

class Homepageappbar extends StatelessWidget {
  const Homepageappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          ],
        ),
      ],
    );
  }
}
