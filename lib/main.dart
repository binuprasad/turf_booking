import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/bottom_navigationbar/view/bottom_navigation.dart';
import 'package:movie_tickets/home/view/home_screen.dart';
import 'package:movie_tickets/login/create_account/view/create_new_account.dart';
import 'package:movie_tickets/login/login_home/view/login_page.dart';
import 'package:movie_tickets/splash_screen/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   BottomNavigationBarwidget(),
    );
  }
}
