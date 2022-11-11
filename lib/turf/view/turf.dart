import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TurfScreen extends StatelessWidget {
  const TurfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'GROUND',
        style: GoogleFonts.akayaKanadaka(fontSize: 70),
      ),
    );
  }
}
