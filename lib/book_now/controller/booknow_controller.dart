import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie_tickets/constant/color.dart';
import 'package:movie_tickets/model/home_model.dart';

class BookNowController extends GetxController {
  DateTime selectedValue = DateTime.now();
  bool selected = false;
  RxInt totalPrice = 0.obs;
  List morning = [];
  List afterNoon = [];
  List evening = [];
  List allTime = [];
  List convertedList = [];
  List slotList = [];

  convert24ToNormalTime(Datum data) {
    allTime.clear();
    allTime.addAll([
      data.turfTime!.timeMorningStart,
      data.turfTime!.timeMorningEnd,
      data.turfTime!.timeAfternoonStart,
      data.turfTime!.timeAfternoonEnd,
      data.turfTime!.timeEveningStart,
      data.turfTime!.timeEveningEnd!
    ]);
    convertedList.clear();

    for (var i = 0; i < allTime.length; i++) {
      if (allTime[i] > 12) {
        convertedList.add(allTime[i] - 12);
      } else {
        convertedList.add(allTime[i]);
      }
    }
    log('1st $convertedList');
  }

  splitTime() {
    morning.clear();
    evening.clear();
    afterNoon.clear();
    for (int i = convertedList[0]; i < convertedList[1]; i++) {
      morning.addAll(['$i :00 - ${i + 1} :00']);
    }

    for (int i = convertedList[2]; i < convertedList[3]; i++) {
      afterNoon.addAll(['$i :00 - ${i + 1} :00']);
    }

    for (int i = convertedList[4]; i < convertedList[5]; i++) {
      evening.addAll(['$i :00 - ${i + 1} :00 ']);
    }
  }

  slotBooking({
    required int index,
    required list,
    required int price,
    required String key,
  }) {
    String temp = list[index].trim().split(":").first;
    int selectedTime = 0;
    int dateTimeNow = DateTime.now().hour;
    // log('$dateTimeNow ----date time. now');
    // log('$selectedTime ----ontap time');
    if (key != "morning") {
      selectedTime = int.parse(temp) + 12;
    } else {
      selectedTime = int.parse(temp);
    }
    log(selectedTime.toString());
    var selectedDate = DateFormat.d().format(selectedValue);

    if (selectedDate == DateTime.now().day.toString()) {
      if (selectedTime > dateTimeNow) {
        if (slotList.contains(list[index])) {
          totalPrice -= price;
          slotList.remove(list[index]);
        } else {
          totalPrice += price;
          slotList.add(list[index]);
        }
      } else {
        log('time unavailable');
        Get.snackbar("", '',
            messageText: Center(
              child: Text(
                "This slot is expired",
                style: GoogleFonts.ptSerif(color: white),
              ),
            ),
            backgroundColor: Colors.lightBlue.withOpacity(0.5));
      }
    } else {
      if (slotList.contains(list[index])) {
        totalPrice -= price;
        slotList.remove(list[index]);
      } else {
        totalPrice += price;
        slotList.add(list[index]);
      }
    }

    update();
  }

  bool isAvailableCheckFunction({
    required String item,
    required String heading,
  }) {
    var temp = item.trim();
    var splittedtime = temp.split(':').first;
    var parsedTime = int.parse(splittedtime);
    var parseddate = DateFormat.d().format(selectedValue);
    var finalTime = 0;
    if (heading != 'morning') {
      finalTime = parsedTime + 12;
    } else {
      finalTime = parsedTime;
    }
    return DateTime.now().hour >= finalTime &&
        parseddate == DateTime.now().day.toString();
  }

  void onDateChangeFunction(date) {
    selectedValue = date;
    update();
  }
}
