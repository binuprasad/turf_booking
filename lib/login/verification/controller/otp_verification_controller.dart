import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/home/view/home_screen.dart';

class OTPverificationController extends GetxController {
  final otpSignUpController = TextEditingController();

  verificationValidation(value) {
    if (value == null || value.isEmpty) {
      return "OTP is required";
    }

    if (value.length != 4) {
      return 'Invalid OTP';
    }
  }

  bottonOnclickCondition(response) {
    if (response!.error == true) {
      Get.snackbar('', response.message.toString());
      log(response.message.toString());
    } else {
      log('no error');
      Get.offAll(() => HomeScreen());
      Get.snackbar('Success', 'Successfully created your account ',
          backgroundColor: Colors.limeAccent,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
