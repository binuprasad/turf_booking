import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/login/create_account/controller/create_new_account_controller.dart';
import 'package:movie_tickets/login/verification/view/verification_screen.dart';
import 'package:movie_tickets/login/widgets/text_form_field.dart';
import 'package:movie_tickets/service/login_service.dart';

class CreateNewAccount extends StatelessWidget {
  CreateNewAccount({Key? key}) : super(key: key);
  final createNewAccountcontroller = Get.put(CreateNewAccountcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Create New Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Enter your username,password and phone',
              style: GoogleFonts.akayaKanadaka(fontSize: 20),
            ),
            RichText(
              text: TextSpan(
                text: 'for Signup.',
                style: GoogleFonts.akayaKanadaka(
                    fontSize: 20, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Already have an account?',
                    style: GoogleFonts.akayaKanadaka(
                        fontSize: 20, color: Colors.green),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextformField(
              text: 'Email',
              icon: Icons.email,
              validatortxt: 'invalid Email',
              textcontroller: createNewAccountcontroller.emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextformField(
              text: 'Password',
              icon: Icons.lock,
              validatortxt: 'invalid Password',
              textcontroller: createNewAccountcontroller.passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextformField(
              text: 'ConfirmPassword',
              icon: Icons.lock,
              validatortxt: 'invalid password',
              textcontroller:
                  createNewAccountcontroller.confirmPasswordController,
            ),
            const SizedBox(height: 30),
            Container(
              height: 50,
              width: 290,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.black, Colors.lightBlue],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  String email =
                      createNewAccountcontroller.emailController.text.trim();
                  String password =
                      createNewAccountcontroller.passwordController.text.trim();
                  final response = await ApiServices()
                      .createNewAccountService(email, password);
                  if (response!.error == true) {

                    Get.snackbar('', response.messege.toString());
                  } else {
                    createNewAccountcontroller.id = response.id!;
                    log('Created ID${createNewAccountcontroller.id}');
                    Get.to(() => OTPverification());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                child: Text(
                  'Sign in',
                  style: GoogleFonts.andadaPro(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: const Divider(
                    thickness: 1,
                  ),
                ),
                const Text('OR'),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: const Divider(
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.1,
              child: SignInButton(
                Buttons.Google,
                onPressed: () {},
                text: 'Sign in with google',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 50,
              child: SignInButton(
                Buttons.Facebook,
                onPressed: () {},
                text: 'Sign in with facebook',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
