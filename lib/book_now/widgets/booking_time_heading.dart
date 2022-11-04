import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingTimeHeading extends StatelessWidget {
  const BookingTimeHeading({
    Key? key,
    required this.heading,
  }) : super(key: key);
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: GoogleFonts.ptSerif(fontSize: 20, fontWeight: FontWeight.w700),
    );
  }
}