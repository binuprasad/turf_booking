import 'package:flutter/material.dart';
import '../../constant/color.dart';

class ChoiceContainer extends StatelessWidget {
  const ChoiceContainer({
    Key? key,
    required this.time,
    required this.contains,
    required this.isAvailable,
  }) : super(key: key);
  final String time;
  final bool contains;
  final bool isAvailable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height / 14,
        width: MediaQuery.of(context).size.width / 3.5,
        decoration: BoxDecoration(
          color: contains
              ? blueGrey
              : isAvailable
                  ? red.withOpacity(0.1)
                  : green,
          borderRadius: BorderRadius.circular(20),
        ),
        duration: const Duration(milliseconds: 30),
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
