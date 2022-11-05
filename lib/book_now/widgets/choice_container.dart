import 'package:flutter/material.dart';
import '../../constant/color.dart';

class ChoiceContainer extends StatelessWidget {
  const ChoiceContainer({Key? key, required this.time, required this.contains})
      : super(key: key);
  final String time;
  final bool contains;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height / 14,
        width: MediaQuery.of(context).size.width / 3.5,
        decoration: BoxDecoration(
          color: contains ? blueGrey : green,
          borderRadius: BorderRadius.circular(20),
        ),
        duration: const Duration(seconds: 1),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
                fontWeight: FontWeight.w800, color: contains ? white : black),
          ),
        ),
      ),
    );
  }
}
