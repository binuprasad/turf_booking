import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/constant/color.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Text(
            text,
            style: GoogleFonts.aleo(
                fontSize: 25, fontWeight: FontWeight.bold, color: black),
          ),
          const Expanded(
            child: StepProgressIndicator(
              gradientColor: LinearGradient(
                end: Alignment.topLeft,
                begin: Alignment.bottomRight,
                colors: [green, white],
              ),
              totalSteps: 10,
            ),
          )
        ],
      ),
    );
  }
}
