import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
