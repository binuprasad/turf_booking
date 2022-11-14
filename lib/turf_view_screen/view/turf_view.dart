import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/book_now/controller/booknow_controller.dart';
import 'package:movie_tickets/constant/color.dart';
import 'package:movie_tickets/model/home_model.dart';
import 'package:movie_tickets/turf_view_screen/widgets/amenties_text.dart';
import 'package:movie_tickets/turf_view_screen/widgets/turf_time_widget.dart';
import '../../constant/constant_widget.dart';

class TurfViewScreen extends StatelessWidget {
  TurfViewScreen({Key? key, required this.data}) : super(key: key);
  final Datum data;
  final bookNowController = Get.put(BookNowController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.greenAccent),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          image: DecorationImage(
                              image:
                                  NetworkImage(data.turfImages!.turfImages1!),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Positioned(
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: CircleAvatar(
                            backgroundColor: white.withOpacity(0.6),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 25,
                              color: green,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomCard(
                    childPadding: 0,
                    borderRadius: 20,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient:
                              const LinearGradient(colors: [appColor, white])),
                      child: Column(
                        children: [
                          ht10,
                          Text(
                            data.turfName!,
                            style: GoogleFonts.notoSerif(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: green),
                          ),
                          ht10,
                          RichText(
                            text: TextSpan(
                              text: 'Location:',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: data.turfPlace,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                          ht10,
                          const Divider(),
                          Text(
                            'Turf Time',
                            style: GoogleFonts.notoSerif(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: green),
                          ),
                          ht10,
                          TurfSchedulings(
                            data: data,
                            textstart:
                                '${bookNowController.convertedList[0]}Am -',
                            textend: "${bookNowController.convertedList[1]}Am",
                            time: 'Morning: ',
                          ),
                          ht5,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TurfSchedulings(
                                data: data,
                                textstart:
                                    "${bookNowController.convertedList[2]} Pm -",
                                time: "    Noon: ",
                                textend:
                                    "${bookNowController.convertedList[3]}Pm"),
                          ),
                          ht5,
                          TurfSchedulings(
                              data: data,
                              textstart:
                                  "${bookNowController.convertedList[4]}Pm -",
                              time: "Evening: ",
                              textend:
                                  "${bookNowController.convertedList[5]}Pm"),
                          const Divider(),
                          Text(
                            'Amenities',
                            style: GoogleFonts.notoSerif(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: green,
                            ),
                          ),
                          ht5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  AmenitiesText(
                                      icon: Icons.local_drink,
                                      text: 'Drinking Water'),
                                  AmenitiesText(
                                      icon: Icons.wc, text: 'Wash Room'),
                                  AmenitiesText(
                                      icon: Icons.local_parking,
                                      text: 'Parking'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  AmenitiesText(
                                      icon: Icons.local_hospital,
                                      text: 'First Aid'),
                                  AmenitiesText(
                                      icon: Icons.shower, text: 'Shower'),
                                  AmenitiesText(
                                      icon: Icons.family_restroom,
                                      text: 'Restroom'),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ht30
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 1.3,
        child: ElevatedButton(
          onPressed: () async {
            await bookNowController.bookNowOntap(data);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: const Text(
            'Book Now',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
