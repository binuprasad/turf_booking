import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/home/view/home_screen.dart';
import 'package:movie_tickets/login/create_account/controller/create_new_account_controller.dart';
import 'package:movie_tickets/login/verification/controller/otp_verification_controller.dart';
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
            Text(
              'Enter the OTP if you want to login.',
              style: GoogleFonts.andadaPro(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            Pinput(
              length: 4,
              controller: otpverificationcontroller.otpSignUpController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "OTP is required";
                }
      
                if (value.length != 4) {
                  return 'Invalid OTP';
                }
                return null;
              },
            ),
            const SizedBox(height: 20,),
            RichText(
              text: TextSpan(
                text: "Don't recieve the code?",
                style:
                    GoogleFonts.akayaKanadaka(fontSize: 17, color: Colors.black),
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
                onPressed: ()async {
                  String otp =otpverificationcontroller.otpSignUpController.text.trim();
                  log("Transfer Id${createNewAccountcontroller.id}");
                  log(otp);
                final response= await ApiServices().otpverificationService(otp,createNewAccountcontroller.id);
                  if(response!.error == true){
                    Get.snackbar('', response.message.toString());
                    log(response.message.toString());
                  }else{
                    log('no error');
                    Get.offAll(()=>HomeScreen());
                    Get.snackbar('Success', 'Successfully created your account ');   
                  }
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
