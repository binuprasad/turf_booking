import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorHandling {
  errorHandler(Object e) {
    if (e is DioError) {
     

      showDialogue(e.response!.data['message'].toString());
    } else if (e is SocketException) {
      showDialogue(
        'No Internet Connection',
      );
    }
  }

  void showDialogue(String text) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color.fromARGB(255, 238, 233, 235),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'Alert',
            style: GoogleFonts.pressStart2p(fontSize: 17),
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(text),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Cancel',
              style: GoogleFonts.oleoScript(),
            ),
          )
        ],
      ),
    );
  }
}
