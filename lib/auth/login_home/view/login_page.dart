import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/auth/create_account/view/create_new_account.dart';
import 'package:movie_tickets/auth/login_home/controller/login_page_controller.dart';
import 'package:movie_tickets/auth/widgets/text_form_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final loginpageController = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Text(
              "Login",
              style: GoogleFonts.adamina(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                ),
              ),
            ),
            const SizedBox(height: 70),
            Form(
              key: loginpageController.formKey,
              child: Column(
                children: [
                  TextformField(
                    text: 'Email',
                    icon: Icons.email,
                    validator: (value) {
                      loginpageController.emailValidator(value);
                      return null;
                    },
                    textcontroller: loginpageController.emailcontroller,
                  ),
                  const SizedBox(height: 30),
                  Obx(
                    () => TextformField(
                      obscure: loginpageController.isobscure.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          loginpageController.isobscure.value =
                              !loginpageController.isobscure.value;
                        },
                        icon: Icon(
                          loginpageController.isobscure.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                      text: 'password',
                      icon: Icons.lock,
                      validator: (value) {
                        loginpageController.passwordValidator(value);
                        return null;
                      },
                      textcontroller: loginpageController.passwordcontroller,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.2,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: GoogleFonts.andadaPro(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
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
                onPressed: () {
                  loginpageController.loginButtonFunction();
                  loginpageController.buttonclickValidator();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                child: Text(
                  'Login',
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
            RichText(
              text: TextSpan(
                text: "Don't have an account?",
                style: GoogleFonts.akayaKanadaka(
                    fontSize: 20, color: Colors.black),
                children: [
                  TextSpan(
                    text: ' Signup',
                    style: GoogleFonts.akayaKanadaka(
                        fontSize: 20, color: Colors.lightBlue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => CreateNewAccount()),
                  ),
                ],
              ),
            ),
   
          ],
        ),
      ),
    );
  }

  
}
