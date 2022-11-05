import 'dart:developer';

import 'package:get/get.dart';
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

  slotBooking({required int index, required list, required int price}) {
    if (slotList.contains(list[index])) {
      totalPrice -= price;
      slotList.remove(list[index]);
    } else {
      totalPrice += price;
      slotList.add(list[index]);
    }
    update();
  }
}
