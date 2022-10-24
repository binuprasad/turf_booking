import 'package:flutter/material.dart';

class AmenitiesText extends StatelessWidget {
  const AmenitiesText({Key? key, required this.icon, required this.text})
      : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(icon)),
        Text(text),
      ],
    );
  }
}
