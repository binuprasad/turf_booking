import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morphing_text/morphing_text.dart';
import 'package:movie_tickets/constant/color.dart';
import 'package:movie_tickets/splash_screen/controller/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  SplashScreen({Key? key}) : super(key: key);
  final splashScreenController = Get.put(SplashScreenController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 62, 236, 18),
      body: Center(
        child: ScaleMorphingText(
          speed: const Duration(microseconds: 10),
          texts:splashScreenController. text,
          loopForever: true,
          onComplete: () {},
          textStyle: GoogleFonts.akronim(fontSize: 40.0, color: white),
        ),
      ),
    );
  }
}
