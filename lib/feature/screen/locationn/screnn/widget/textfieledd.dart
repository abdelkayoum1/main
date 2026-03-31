import 'package:flutter/material.dart';

class Textfieledd extends StatelessWidget {
  final String title;
  final Widget? prefixIcon;
  final Widget? sufixe;
  const Textfieledd({
    super.key,
    required this.title,
    this.prefixIcon,
    this.sufixe,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: sufixe,
        fillColor: Colors.grey.shade200,
        filled: true,
        hint: Text(title),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
