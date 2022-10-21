import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/splash_screen/controller/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  SplashScreen({Key? key}) : super(key: key);
  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('splashscreen'),
      ),
    );
  }
}
