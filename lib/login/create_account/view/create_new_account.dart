import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/login/create_account/controller/create_new_account_controller.dart';
import 'package:movie_tickets/login/widgets/text_form_field.dart';

class CreateNewAccount extends StatelessWidget {
  CreateNewAccount({Key? key}) : super(key: key);
  final createNewAccountcontroller = Get.put(CreateNewAccountcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5.5,
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
            Form(
              key: createNewAccountcontroller.formKey,
              child: Column(
                children: [
                  TextformField(
                    text: 'Email',
                    icon: Icons.email,
                    validator: (value) {
                      createNewAccountcontroller.emailValidator(value);
                      return null;
                    },
                    textcontroller: createNewAccountcontroller.emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextformField(
                    text: 'Password',
                    icon: Icons.lock,
                    validator: (value) {
                      createNewAccountcontroller.passwordValidator(value);
                      return null;
                    },
                    textcontroller:
                        createNewAccountcontroller.passwordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextformField(
                    text: 'ConfirmPassword',
                    icon: Icons.lock,
                    validator: (value) {
                      createNewAccountcontroller
                          .confirmPasswordValidator(value);
                      return null;
                    },
                    textcontroller:
                        createNewAccountcontroller.confirmPasswordController,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              height: 50,
              width: 290,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.black, Colors.lightBlue],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  createNewAccountcontroller.buttonclickValidator();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  'Signup',
                  style: GoogleFonts.andadaPro(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
