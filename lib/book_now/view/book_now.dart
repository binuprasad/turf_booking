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
  BookNow({Key? key, required this.data}) : super(key: key);
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
                                  booknowController.selectedValue = date;
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
                          builder: (controller) => Wrap(
                            children: List.generate(
                              booknowController.morning.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  booknowController.slotBooking(
                                      index, booknowController.morning);
                                },
                                child: ChoiceContainer(
                                  time: '${booknowController.morning[index]}',
                                  contains: booknowController.slotList.contains(
                                      booknowController.morning[index]),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading:
                              const BookingTimeHeading(heading: 'Afternoon'),
                          trailing: PriceText(
                            data: data,
                            text: '₹${data.turfPrice!.afternoonPrice!}',
                          ),
                        ),
                        GetBuilder<BookNowController>(
                          builder: (controller) => Wrap(
                            children: List.generate(
                              booknowController.afterNoon.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  booknowController.slotBooking(
                                      index, booknowController.afterNoon);
                                },
                                child: ChoiceContainer(
                                  time: '${booknowController.afterNoon[index]}',
                                  contains: booknowController.slotList.contains(
                                      booknowController.afterNoon[index]),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const BookingTimeHeading(heading: 'Evening'),
                          trailing: PriceText(
                            data: data,
                            text: '₹${data.turfPrice!.eveningPrice!}',
                          ),
                        ),
                        GetBuilder<BookNowController>(
                          builder: (controller) => Wrap(
                            children: List.generate(
                              booknowController.evening.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  booknowController.slotBooking(
                                      index, booknowController.evening);
                                },
                                child: ChoiceContainer(
                                    contains: booknowController.slotList
                                        .contains(
                                            booknowController.evening[index]),
                                    time:
                                        '${booknowController.evening[index]}'),
                              ),
                            ),
                          ),
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
          children: const [
            BottomNavigationContainer(
              text: 'TotalPrice:1400',
              backgrounColor: green,
              textColor: white,
            ),
            BottomNavigationContainer(
              text: 'Book',
              backgrounColor: white,
              textColor: green,
            )
          ],
        ),
      ),
    );
  }
}
