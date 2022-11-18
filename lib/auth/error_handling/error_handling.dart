import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorHandling {
  errorHandler(Object e) {
    if (e is DioError) {
      // if (e.response?.statusCode == 401) {
      //   showDialogue('Server not found !');
      // } else if (e.type == DioErrorType.connectTimeout) {
      //   showDialogue('Connection Timout');
      // } else if (e.type == DioErrorType.receiveTimeout) {
      //   showDialogue('Recieve Timout');
      // } else if (e.type == DioErrorType.cancel) {
      //   showDialogue('Request cancelled');
      // } else if (e.type == DioErrorType.sendTimeout) {
      //   showDialogue('Url  sent timeout');
      // } else if (e.type == DioErrorType.response) {
      //   showDialogue('Incorrect status code, such as 404, 503...');
      // } else if (e.type == DioErrorType.other) {
      //   showDialogue('Some other Error');
      // }

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
