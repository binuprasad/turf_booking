import 'package:flutter/material.dart';
import 'package:movie_tickets/model/home_model.dart';

class Turfschedulings extends StatelessWidget {
  const Turfschedulings({
    Key? key,
    required this.data,
    required this.textstart,
    required this.time,
    required this.textend,
  }) : super(key: key);

  final Datum data;
  final String textstart;
  final String time;
  final String textend;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: time,
        style: const TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: textstart,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          TextSpan(
            text: textend,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
