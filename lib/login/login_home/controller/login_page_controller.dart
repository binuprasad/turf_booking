import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isobscure = false.obs;

  buttonclickValidator() {
    if (formKey.currentState!.validate()) {
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'token',
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzNTEzMTMxNjIyYWU2OTg0ZWQ2NzhhNyIsImlhdCI6MTY2NjMyODM1NywiZXhwIjoxNjY2NDE0NzU3fQ.o93r4BmmJgPOhL2tGs3fqS6_N3c5g4isbmBoND600yU",
    );
    prefs.setString('refreshtoken', response.refreshToken.toString());
    var token = prefs.getString('token');
    log(token.toString());
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
