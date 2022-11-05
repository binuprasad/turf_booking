import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BottomNavigationContainer extends StatelessWidget {
  const BottomNavigationContainer({
    Key? key,required this.text, required this.textColor, required this.backgrounColor
  }) : super(key: key);
 final String text;
 final Color textColor;
 final Color backgrounColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height,
      color: backgrounColor,
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style:  GoogleFonts.ptSerif(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: textColor),
          ),
        ),
      ),
    );
  }
}


