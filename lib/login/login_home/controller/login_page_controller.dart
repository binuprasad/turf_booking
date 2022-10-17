import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/service/login_service.dart';

class LoginPageController extends GetxController {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isobscure = false.obs;

  buttonclickValidator() {
    if (formKey.currentState!.validate()) {
      // Get.snackbar('', 'data is processing',snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.lightGreen);
      return;
    }
  }

  loginButtonFunction() async {
    final email = emailcontroller.text.trim();
    final password = passwordcontroller.text.trim();
    final response = await ApiServices().loginpageService(email, password);
    if (response!.error == true) {
      Get.snackbar('', response.error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.limeAccent);
    } else {
      Get.snackbar('', "Successfully logined",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.limeAccent);
    }
  }

  passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'invalid password';
    }
    if (value.length < 6) {
      return 'Must be more than 5 charater';
    }
  }

  emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'invalid Email';
    }
  }

 
}
