import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/constant/constant_widget.dart';
import 'package:movie_tickets/model/home_model.dart';

class TurfViewScreen extends StatelessWidget {
  const TurfViewScreen({Key? key, required this.data}) : super(key: key);
  final Datum data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:SizedBox(
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 1.3,
        child: ElevatedButton(
          onPressed: () {},
          style:
              ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: const Text(
            'Book Now',
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
          ),
        ),
      ) ,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.white],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Text(
                        'Arco',
                        style: GoogleFonts.akronim(
                            fontSize: 70, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      image: DecorationImage(
                          image: NetworkImage(data.turfImages!.turfImages1!),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomCard(
                    childPadding: 0,
                    borderRadius: 20,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        
                        children: [
                          constwidgetsobj.ht10,
                          Text(
                            data.turfName!,
                            style:const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const Text(
                            'Turf Time',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10,),
                          Turftime(data: data, textstart: '${data.turfTime!.timeMorningStart!.toString()}Am -', textend: "${ data.turfTime!.timeMorningEnd!.toString()}Am", time: 'Morning: ',),
                          constwidgetsobj.ht5,
                          Turftime(data: data, textstart: "${ data.turfTime!.timeAfternoonStart!.toString()}Pm -", time:"Noon: " , textend: "${ data.turfTime!.timeAfternoonEnd!.toString()}Pm"),
                          constwidgetsobj.ht5,

                          Turftime(data: data, textstart: "${ data.turfTime!.timeEveningStart!.toString()}Pm -", time:"Evening: " , textend: "${ data.turfTime!.timeEveningEnd!.toString()}Pm"),


                          const Divider(),
                          const Text(
                            'Amenities',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  AmenitiesText(
                                      icon: Icons.local_drink,
                                      text: 'Drinking Water'),
                                  AmenitiesText(
                                      icon: Icons.wc, text: ' Wash Room'),
                                  AmenitiesText(
                                      icon: Icons.local_parking, text: 'Parking'),
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
                const SizedBox(
                  height: 30,
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Turftime extends StatelessWidget {
   Turftime({
    Key? key,
    required this.data,
    required this.textstart,
    required this.time,
    required this.textend,
  }) : super(key: key);

  final Datum data;
  String textstart;
  String time;
  String textend;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text:time,
        style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: textstart,
            style: const TextStyle(
              fontSize: 15,
            ),
           
          ),
           TextSpan(
            text:textend,
            style: const TextStyle(
              fontSize: 15,
            ),
           
          ),
        ],
      ),
    );
  }
}

class AmenitiesText extends StatelessWidget {
  const AmenitiesText({Key? key, required this.icon, required this.text})
      : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(icon)),
        Text(text),
      ],
    );
  }
}
