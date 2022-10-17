import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/login/verification/view/verification_screen.dart';
import 'package:movie_tickets/service/login_service.dart';

class CreateNewAccountcontroller extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late String id;
  final formKey = GlobalKey<FormState>();

  buttonclickValidator()async {
    if (formKey.currentState!.validate()) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    final response =
        await ApiServices().createNewAccountService(email, password);
    if (response!.error == true) {
      Get.snackbar('', response.messege.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.black);
    } else {
      id = response.id!;
      Get.to(() => OTPverification());
    }
    }
  }

  createAccountButtonClicked()  {
   
  }
}
