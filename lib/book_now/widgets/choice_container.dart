import 'package:flutter/material.dart';
import '../../constant/color.dart';

class ChoiceContainer extends StatelessWidget {
  const ChoiceContainer({
    Key? key,
    required this.time,
    required this.contains,
    required this.isAvailable,
    required this.isBooked,
   
  }) : super(key: key);
  final String time;
  final bool contains;
  final bool isAvailable;
  final bool isBooked;
 
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
                  ? isBooked
                      ? red
                      : green.withOpacity(0.3)
                  : green,
          borderRadius: BorderRadius.circular(20),
        ),
        duration: const Duration(milliseconds: 300),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
                fontWeight: FontWeight.w800,
                color: isBooked || contains ? white : black),
          ),
        ),
      ),
    );
  }
}
// isBooked
//               ? red
//               : contains
//                   ? blueGrey
//                   : isAvailable
//                       ? green.withOpacity(0.1)
//                       : green,