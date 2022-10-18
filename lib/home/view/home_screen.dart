import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homecontroller = Get.put(HomeController());

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
            padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                        children: const [
                          Icon(Icons.location_on,color: Colors.white,),
                          Text(
                            'Malappuram,Wandoor',
                            style: TextStyle(color: Colors.white),
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
                          image: 'assets/image/turf.jpg',
                          text: 'FootBall',
                        ),
                        HomeCustomCard(
                          image: 'assets/image/badminton.jpg',
                          text: 'Badminton',
                        ),
                        HomeCustomCard(
                          image: 'assets/image/cricket.jpg',
                          text: 'Cricket',
                        ),
                        HomeCustomCard(
                          image: 'assets/image/yoga.jpg',
                          text: 'Yoga',
                        ),
                      ],
                    ),
                  ),
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

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aleo(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}

class CustomCard2 extends StatelessWidget {
  const CustomCard2({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderColor: Colors.yellowAccent,
      borderRadius: 20.0,
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width / 2,
      childPadding: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class HomeCustomCard extends StatelessWidget {
  const HomeCustomCard({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderColor: Colors.green,
      borderRadius: 20.0,
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width / 1,
      childPadding: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.rye(
                color: Colors.lightGreenAccent.withOpacity(0.8),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
