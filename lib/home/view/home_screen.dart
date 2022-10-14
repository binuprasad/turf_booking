import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homecontroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/johnwick.jpeg"),
                      fit: BoxFit.fill),
                ),
              ),
              const DefaultTabController(
                length: 2,
                child: TabBar(
                  tabs: [
                    Text(
                      'Screen1',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Screen2',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
              Row(
                children: const [
                  CustomCards(image: 'assets/image/popcorn.jpg'),
                  CustomCards(image: 'assets/image/popcorn2.webp'),
                  CustomCards(image: 'assets/image/backgroundimage.jpg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCards extends StatelessWidget {
  const CustomCards({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 300,
      width: 120,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
