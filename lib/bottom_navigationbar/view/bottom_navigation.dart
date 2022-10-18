import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/bottom_navigationbar/controller/bottom_navigationbar_controller.dart';

class BottomNavigationBarwidget extends StatelessWidget {
  BottomNavigationBarwidget({Key? key}) : super(key: key);

  final bottomNavigationBarController =
      Get.put(BottonNavigationBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => bottomNavigationBarController
            .pages[bottomNavigationBarController.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: Colors.lightGreen,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          onTap: (value) =>
              bottomNavigationBarController.selectedIndex.value = value,
          currentIndex: bottomNavigationBarController.selectedIndex.value,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Grounds'),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
