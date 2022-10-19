import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/home/controller/home_controller.dart';
import 'package:movie_tickets/home/widgets/cuatom_card2.dart';
import 'package:movie_tickets/home/widgets/home_custom_card.dart';
import 'package:movie_tickets/home/widgets/text_widget.dart';
import 'package:movie_tickets/location_controller/location_controller.dart';

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
                      Text(
                        'Arco',
                        style: GoogleFonts.akronim(
                            fontSize: 70, color: Colors.white),
                      ),
                      Row(
                        children:  [
                          const Icon(Icons.location_on, color: Colors.white),
                          Obx(() => Text(
                            '${locationController.currentAddress}',
                            style: const TextStyle(color: Colors.white),
                          ),),
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
                  // Center(
                  //   child: Obx(() => DotsIndicator(
                  //   dotsCount: homecontroller.images.length,
                  //   position: homecontroller.currentIndex.value,
                  //   decorator: const DotsDecorator(
                  //     color: Colors.grey, // Inactive dot colors
                  //     activeColor:Colors.white , // Àctive dot colors
                  //   ),
                  // ),)
                  // ),
                  const TitleText(
                    text: 'FootBall',
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CustomCard2(image: 'assets/image/turf.jpg'),
                        CustomCard2(image: 'assets/image/turf.jpg'),
                        CustomCard2(image: 'assets/image/turf.jpg'),
                        CustomCard2(image: 'assets/image/turf.jpg'),
                      ],
                    ),
                  ),
                  const TitleText(
                    text: 'Cricket',
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CustomCard2(image: 'assets/image/cricket.jpg'),
                        CustomCard2(image: 'assets/image/cricket.jpg'),
                        CustomCard2(image: 'assets/image/cricket.jpg'),
                        CustomCard2(image: 'assets/image/cricket.jpg'),
                      ],
                    ),
                  ),
                  const TitleText(
                    text: 'Badminton',
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CustomCard2(image: 'assets/image/badminton.jpg'),
                        CustomCard2(image: 'assets/image/badminton.jpg'),
                        CustomCard2(image: 'assets/image/badminton.jpg'),
                        CustomCard2(image: 'assets/image/badminton.jpg'),
                      ],
                    ),
                  ),
                  const TitleText(
                    text: 'Yoga',
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CustomCard2(image: 'assets/image/yoga.jpg'),
                        CustomCard2(image: 'assets/image/yoga.jpg'),
                        CustomCard2(image: 'assets/image/yoga.jpg'),
                        CustomCard2(image: 'assets/image/yoga.jpg'),
                      ],
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
