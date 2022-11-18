import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/home/view/home_screen.dart';
import 'package:movie_tickets/model/create_account_verify.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bottonOnclickCondition(EmailOTPResponse response)async {
    if (response.error == true) {
      Get.snackbar('', response.message.toString());
      log(response.message.toString());

    } else {
       SharedPreferences prf = await SharedPreferences.getInstance();
     prf.setString('token', response.token!);
     prf.setString('refreshtoken', response.refreshToken!);
      log('no error');
      Get.offAll(() => HomeScreen());
      Get.snackbar('Success', 'Successfully created your account ',
          backgroundColor: Colors.limeAccent,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
