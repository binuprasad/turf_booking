import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/auth/create_account/controller/create_new_account_controller.dart';
import 'package:movie_tickets/auth/verification/controller/otp_verification_controller.dart';
import 'package:movie_tickets/service/login_service.dart';
import 'package:pinput/pinput.dart';

class OTPverification extends StatelessWidget {
  OTPverification({Key? key}) : super(key: key);
  final otpverificationcontroller = Get.put(OTPverificationController());
  final createNewAccountcontroller = Get.put(CreateNewAccountcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  child: FittedBox(
                    child: Text(
                      'Enter the OTP if you want\nto login.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.andadaPro(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            Pinput(
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(30, 60, 87, 1),
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 47, 131, 130)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              length: 4,
              controller: otpverificationcontroller.otpSignUpController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                otpverificationcontroller.verificationValidation(value);

                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                text: "Don't recieve the code?",
                style: GoogleFonts.akayaKanadaka(
                    fontSize: 17, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Resend OTP',
                    style: GoogleFonts.akayaKanadaka(
                        fontSize: 17, color: Colors.green),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
            ),
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
                  String otp =
                      otpverificationcontroller.otpSignUpController.text.trim();
                  log("Transfer Id${createNewAccountcontroller.id}");
                  log(otp);
                  final response = await ApiServices().otpverificationService(
                    otp,
                    createNewAccountcontroller.id,
                  );

                  otpverificationcontroller.bottonOnclickCondition(response!);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                child: Text(
                  ' Verify',
                  style: GoogleFonts.andadaPro(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
