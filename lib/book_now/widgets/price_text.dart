import 'package:flutter/material.dart';
import '../../constant/color.dart';
import '../../model/home_model.dart';

class PriceText extends StatelessWidget {
  const PriceText({
    Key? key,
    required this.data,required this.text
  }) : super(key: key);

  final Datum data;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
       text,style: const TextStyle(color: white,fontSize: 20),);
  }
}