import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_tickets/book_now/view/book_now.dart';
import 'package:movie_tickets/model/booking_model.dart';
import 'package:movie_tickets/model/home_model.dart';
import 'package:movie_tickets/service/booking_service.dart';
import '../../model/add_booking_model.dart';

class BookNowController extends GetxController {
  DateTime selectedValue = DateTime.now();
  RxInt totalPrice = 0.obs;
  var finalTime = 0;
  late String parseddate;
  String selectedDate = '';
  List<String> morning = [];
  List<String> afterNoon = [];
  List<String> evening = [];
  List<dynamic> allTime = [];
  List<dynamic> convertedList = [];
  List<String> newSlotList = [];
  List<int> sendToBackendlist = [];

  List alreadyBookingslots = [];
  Map<String, List<int>> bookingslotsMap = {};
//-----------------------------------------------------------convert 24 hrs to 12 hrs
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

//------------------------------------------------------------------------split time
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

//----------------------------------------------------------------------------slot booking

  void selectingSlot({
    required int index,
    required List<String> list,
    required int price,
    required String key,
  }) {
    var selectedDate = DateFormat.d().format(selectedValue);
    var nowDate = DateTime.now().day.toString();

    if (key != 'morning') {
      finalTime = int.parse(list[index].trim().split(':').first) + 12;
    } else {
      finalTime = int.parse(list[index].trim().split(':').first);
    }

    if (selectedDate == nowDate) {
      if (finalTime > DateTime.now().hour) {
        checkAndAddPrice(list, index, price, finalTime);
      }
    } else {
      checkAndAddPrice(list, index, price, finalTime);
    }
    // log(sendToBackendlist.toString());
    update();
  }

//----------------------------------------------------------------------------
  void checkAndAddPrice(
    List<String> list,
    int index,
    int price,
    int finalTime,
  ) {
    if (newSlotList.contains(list[index]) ||
        alreadyBookingslots.contains(finalTime)) {
      if (!alreadyBookingslots.contains(finalTime)) {
        totalPrice -= price;
      }

      sendToBackendlist.remove(finalTime);
      newSlotList.remove(list[index]);
    } else {
      totalPrice += price;
      sendToBackendlist.add(finalTime);
      newSlotList.add(list[index]);
    }
  }

//-----------------------------------------------------------------------------is available check function
  bool isAvailableCheckFunction({
    required String item,
    required String heading,
  }) {
    int parsedTime = int.parse(item.trim().split(':').first);
    var parseddate = DateFormat.d().format(selectedValue);
    log('$parseddate ---------parsedate');
    finalTime = 0;
    if (heading != 'morning') {
      finalTime = parsedTime + 12;
    } else {
      finalTime = parsedTime;
    }
    return (DateTime.now().hour >= finalTime &&
            parseddate == DateTime.now().day.toString() ||
        alreadyBookingslots.contains(finalTime));
  }

//--------------------------------------------------------------------------------on date change function
  void onDateChangeFunction(DateTime date) {
    selectedValue = date;
    newSlotList.clear();
    sendToBackendlist.clear();
    totalPrice.value = 0;
    alreadyBookingslots.clear();
    addToBookingSlots();
    update();
  }

//---------------------------------------------------------------------book now on tap function
  Future<void> bookNowOntap(data) async {
    totalPrice.value = 0;

    selectedValue = DateTime.now();
    newSlotList.clear();
    convert24ToNormalTime(data);
    splitTime();
    await getBookings(data.id!.trim());
    alreadyBookingslots.clear();
    await addToBookingSlots();
    sendToBackendlist.clear();
    Get.to(() => BookNow(data: data));
  }

//-------------------------------------------------------------------------------------get booked turf function
  Future<void> getBookings(String id) async {
    log(" turf id $id");
    final BookResponse? response = await BookingService().getBooking(id: id);
   
    if (response != null) {
       log('respnse in get booking ${response.data}');
      for (var element in response.data) {
        bookingslotsMap[element.bookingDate] = element.timeSlot;
        log('$bookingslotsMap  -----------booking map');
      }
    } else {
      log('response . data is null');
      // bookingslotsMap['11/12/2022'] = [15, 22, 5, 10];
    }
  }

//--------------------------------------------------------add bookingslot map to already booked slots list
  addToBookingSlots() {
    selectedDate = DateFormat.yMd().format(selectedValue);
    alreadyBookingslots.clear();
    if (bookingslotsMap.containsKey(selectedDate)) {
      alreadyBookingslots.addAll(bookingslotsMap[selectedDate]!);
      log('bookig slots sfter adding $alreadyBookingslots');
    }
    log('booking slot map $bookingslotsMap');
    log('selected Date $selectedDate');
    log(alreadyBookingslots.toString());
  }

//-------------------------------------------------------------------book turf function
  Future<void> addBooking(String id) async {
    AddBookingRequest model = AddBookingRequest(
        bookingDate: parseddate, turfId: id, timeSlot: sendToBackendlist);
    final bool? response = await BookingService().addBooking(model: model);
    if (response != null) {
    } else {
      log('no data is found');
    }
  }
}
