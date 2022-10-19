import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCustomCard extends StatelessWidget {
  const HomeCustomCard({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderColor: Colors.green,
      borderRadius: 20.0,
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width / 1,
      childPadding: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.rye(
                color: Colors.lightGreenAccent.withOpacity(0.8),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
