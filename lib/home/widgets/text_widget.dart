import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aleo(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}