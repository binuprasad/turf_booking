import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/book_now/controller/booknow_controller.dart';
import 'package:movie_tickets/constant/color.dart';
import 'package:movie_tickets/constant/constant_widget.dart';
import 'package:movie_tickets/model/home_model.dart';

class BookNow extends StatelessWidget {
  BookNow({Key? key, required this.data}) : super(key: key);
  final Datum data;
  final booknowController = Get.put(BookNowController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: black,
        height: MediaQuery.of(context).size.height / 13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: green,
              width: MediaQuery.of(context).size.width / 2,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'TotalPrice :1500',
                    style: TextStyle(color: white),
                  ),
                ),
              ),
            ),
            Container(
              color: white,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Book ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: green),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height + 150),
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
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                      color: black,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 4.1,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 20.0)],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30.0)),
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
                                // Expanded(child: Icon(icon),)
                                DateTime.now(),
                                daysCount: 31,
                                initialSelectedDate: DateTime.now(),
                                selectionColor: black,
                                selectedTextColor: white,
                                onDateChange: (date) {
                                  // New date selected

                                  booknowController.selectedValue = date;
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
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
                          trailing: Text(
                              '   ₹${data.turfPrice!.morningPrice!.toString()}'),
                        ),
                        ht5,
                        Wrap(
                          children: const [
                            ChoiceContainer(time: '6:00 Am'),
                            ChoiceContainer(time: '7:00 Am'),
                            ChoiceContainer(time: '8:00Am'),
                            ChoiceContainer(time: '9:00 Am'),
                            ChoiceContainer(time: '10:00 Am'),
                            ChoiceContainer(time: '11:00Am')
                          ],
                        ),
                        ListTile(
                          leading:
                              const BookingTimeHeading(heading: 'Afternoon'),
                          trailing: Text(
                              '₹${data.turfPrice!.afternoonPrice!.toString()}'),
                        ),
                        Wrap(
                          children: const [
                            ChoiceContainer(time: '12:00 Pm'),
                            ChoiceContainer(time: '1:00 Pm'),
                            ChoiceContainer(time: '2:00 Pm'),
                            ChoiceContainer(time: '3:00 Am'),
                          ],
                        ),
                        ListTile(
                          leading: const BookingTimeHeading(heading: 'Evening'),
                          trailing: Text(
                              ' ₹${data.turfPrice!.eveningPrice!.toString()}'),
                        ),
                        Wrap(
                          children: const [
                            ChoiceContainer(time: '6:00 Pm'),
                            ChoiceContainer(time: '7:00 Pm'),
                            ChoiceContainer(time: '8:00 Pm'),
                            ChoiceContainer(time: '9:00 Pm'),
                            ChoiceContainer(time: '10:00 Pm'),
                            ChoiceContainer(time: '11:00Pm')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BookingTimeHeading extends StatelessWidget {
  const BookingTimeHeading({
    Key? key,
    required this.heading,
  }) : super(key: key);
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: GoogleFonts.ptSerif(fontSize: 20, fontWeight: FontWeight.w700),
    );
  }
}

class ChoiceContainer extends StatelessWidget {
  const ChoiceContainer({
    Key? key,
    required this.time,
  }) : super(key: key);
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 14,
        width: MediaQuery.of(context).size.width / 3.5,
        decoration: BoxDecoration(
            color: green, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            time,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
