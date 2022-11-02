import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookNowController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
   DateTime selectedValue = DateTime.now();

  final List<Tab> myTap = [
    const Tab(text: 'Morning',),
    const Tab(text: "Noon"),
    const Tab(text: "Evening"),
  ];
  @override
  void onInit() {
    controller = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
