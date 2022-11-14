import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/book_now/controller/booknow_controller.dart';
import 'package:movie_tickets/book_now/widgets/booking_time_heading.dart';
import 'package:movie_tickets/book_now/widgets/price_text.dart';
import 'package:movie_tickets/constant/color.dart';
import 'package:movie_tickets/constant/constant_widget.dart';
import 'package:movie_tickets/model/home_model.dart';
import '../widgets/botton_navigation_container.dart';
import '../widgets/choice_container.dart';

class BookNow extends StatelessWidget {
  BookNow({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Datum data;

  final booknowController = Get.put(BookNowController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: appColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height + 250),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  image: DecorationImage(
                      image: NetworkImage(data.turfImages!.turfImages1!),
                      fit: BoxFit.fill),
                ),
              ),
              Positioned(
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: CircleAvatar(
                    backgroundColor: white.withOpacity(0.5),
                    child: const Icon(Icons.arrow_back_ios_new,
                        size: 25, color: green),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 4.0,
                child: Container(
                  height: MediaQuery.of(context).size.height + 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 20.0)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30.0),
                      ),
                      color: appColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ht10,
                        Row(
                          children: [
                            Expanded(
                              child: DatePicker(
                                DateTime.now(),
                                daysCount: 31,
                                initialSelectedDate: DateTime.now(),
                                selectionColor: black,
                                selectedTextColor: white,
                                onDateChange: (date) {
                                  booknowController.onDateChangeFunction(date);
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: booknowController.selectedValue,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(
                                    const Duration(days: 100),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.date_range),
                            ),
                          ],
                        ),
                        ListTile(
                          leading: const BookingTimeHeading(heading: 'Morning'),
                          trailing: PriceText(
                            data: data,
                            text: '₹${data.turfPrice!.morningPrice!}',
                          ),
                        ),
                        ht5,
                        GetBuilder<BookNowController>(
                          builder: (controller) {
                            return Wrap(
                              children: List.generate(
                                booknowController.morning.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    booknowController.selectingSlot(
                                      index: index,
                                      list: booknowController.morning,
                                      price: data.turfPrice!.morningPrice!,
                                      key: 'morning',
                                    );
                                  },
                                  child: ChoiceContainer(
                                    time: booknowController.morning[index],
                                    contains:
                                        booknowController.newSlotList.contains(
                                      booknowController.morning[index],
                                    ),
                                    isAvailable: booknowController
                                        .isAvailableCheckFunction(
                                      item: booknowController.morning[index],
                                      heading: 'morning',
                                    ),
                                    isBooked: booknowController
                                        .alreadyBookingslots
                                        .contains(booknowController.finalTime),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading:
                              const BookingTimeHeading(heading: 'Afternoon'),
                          trailing: PriceText(
                            data: data,
                            text: '₹${data.turfPrice!.afternoonPrice!}',
                          ),
                        ),
                        GetBuilder<BookNowController>(builder: (controller) {
                          return Wrap(
                            children: List.generate(
                              booknowController.afterNoon.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  booknowController.selectingSlot(
                                    index: index,
                                    list: booknowController.afterNoon,
                                    price: data.turfPrice!.afternoonPrice!,
                                    key: 'afternoon',
                                  );
                                },
                                child: ChoiceContainer(
                                    time: booknowController.afterNoon[index],
                                    contains: booknowController.newSlotList
                                        .contains(
                                            booknowController.afterNoon[index]),
                                    isAvailable: booknowController
                                        .isAvailableCheckFunction(
                                      item: booknowController.afterNoon[index],
                                      heading: 'afternoon',
                                    ),
                                    isBooked: booknowController
                                        .alreadyBookingslots
                                        .contains(booknowController.finalTime)),
                              ),
                            ),
                          );
                        }),
                        ListTile(
                          leading: const BookingTimeHeading(heading: 'Evening'),
                          trailing: PriceText(
                            data: data,
                            text: '₹${data.turfPrice!.eveningPrice!}',
                          ),
                        ),
                        GetBuilder<BookNowController>(
                          builder: (controller) {
                            return Wrap(
                              children: List.generate(
                                booknowController.evening.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    booknowController.selectingSlot(
                                      index: index,
                                      list: booknowController.evening,
                                      price: data.turfPrice!.eveningPrice!,
                                      key: 'evening',
                                    );
                                  },
                                  child: ChoiceContainer(
                                      contains: booknowController.newSlotList
                                          .contains(
                                              booknowController.evening[index]),
                                      time: booknowController.evening[index],
                                      isAvailable: booknowController
                                          .isAvailableCheckFunction(
                                        item: booknowController.evening[index],
                                        heading: 'evening',
                                      ),
                                      isBooked: booknowController
                                          .alreadyBookingslots
                                          .contains(
                                              booknowController.finalTime)),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height / 13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {},
                child: BottomNavigationContainer(
                  text: 'TotalPrice:${booknowController.totalPrice}',
                  backgrounColor: green,
                  textColor: white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                booknowController.addBooking(data.id!);
              },
              child: const BottomNavigationContainer(
                text: 'Book',
                backgrounColor: white,
                textColor: green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
