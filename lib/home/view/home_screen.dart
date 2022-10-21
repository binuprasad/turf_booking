import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/home/controller/home_controller.dart';
import 'package:movie_tickets/home/widgets/cuatom_card2.dart';
import 'package:movie_tickets/home/widgets/home_custom_card.dart';
import 'package:movie_tickets/home/widgets/text_widget.dart';
import 'package:movie_tickets/location_controller/location_controller.dart';
import 'package:movie_tickets/splash_screen/view/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homecontroller = Get.put(HomeController());
  final locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/image/grass.jpg",
              ),
              fit: BoxFit.fitHeight),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.remove('token');
                          Get.offAll(() => SplashScreen());
                        },
                        child: Text(
                          'Arco',
                          style: GoogleFonts.akronim(
                              fontSize: 70, color: Colors.white),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.white),
                          Obx(
                            () => Text(
                              '${locationController.currentAddress}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: PageView(
                      pageSnapping: false,
                      children: const <Widget>[
                        HomeCustomCard(
                            image: 'assets/image/turf.jpg', text: 'FootBall'),
                        HomeCustomCard(
                            image: 'assets/image/badminton.jpg',
                            text: 'Badminton'),
                        HomeCustomCard(
                            image: 'assets/image/cricket.jpg', text: 'Cricket'),
                        HomeCustomCard(
                            image: 'assets/image/yoga.jpg', text: 'Yoga'),
                      ],
                    ),
                  ),
                  const TitleText(
                    text: 'Nearby Turf',
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final temp = homecontroller.nearby[index];
                        log("image${temp.id}");
                        return CustomCard2(
                          image: temp.turfImages!.turfImages1!,
                          turfName: temp.turfName.toString(),
                        );
                      },
                      itemCount: homecontroller.nearby.length,
                    ),
                  ),
                  const TitleText(
                    text: 'FootBall',
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCard2(
                          image: homecontroller
                              .nearby[index].turfImages!.turfImages2!,
                          turfName:
                              homecontroller.nearby[index].turfName.toString(),
                        );
                      },
                      itemCount: homecontroller.nearby.length,
                    ),
                  ),
                  const TitleText(
                    text: 'Cricket',
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCard2(
                            image: homecontroller
                                .nearby[index].turfImages!.turfImages3!,
                            turfName: homecontroller.nearby[index].turfName!);
                      },
                      itemCount: homecontroller.nearby.length,
                    ),
                  ),
                  const TitleText(
                    text: 'Badminton',
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCard2(
                            image: homecontroller
                                .nearby[index].turfImages!.turfImages1!,
                            turfName: homecontroller.nearby[index].turfName!);
                      },
                      itemCount: homecontroller.nearby.length,
                    ),
                  ),
                  const TitleText(
                    text: 'Yoga',
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCard2(
                            image: homecontroller
                                .nearby[index].turfImages!.turfImages1!,
                            turfName: homecontroller.nearby[index].turfName!);
                      },
                      itemCount: homecontroller.nearby.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
