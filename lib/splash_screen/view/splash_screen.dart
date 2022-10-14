import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_tickets/login/login_home/view/login_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: LoginPage(),
      splash: Lottie.asset(
        
        'assets/image/36365-the-6-loading-circles-model-22g-iphone-12-colors.json',
      ),
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
