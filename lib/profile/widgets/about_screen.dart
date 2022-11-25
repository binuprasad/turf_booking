import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/constant/color.dart';
import 'package:movie_tickets/profile/controller/about_controller.dart';

class AboutScreen extends GetView<ProfileController> {
  AboutScreen({Key? key}) : super(key: key);

  final aboutcontroller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [white, green],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          centerTitle: true,
          title:  Text(
            'About',
            style: GoogleFonts.ptSans(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 50,
              ),
              child: TabBar(
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                  indicator:
                      const UnderlineTabIndicator(borderSide: BorderSide.none),
                  controller: aboutcontroller.controller,
                  tabs: aboutcontroller.myTap
                 
                  ),
            ),
            CustomCard(
              color: const Color.fromARGB(255, 235, 239, 230),
              elevation: 15,
              shadowColor: Colors.green,
              borderRadius: 30,
              height: MediaQuery.of(context).size.height / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  controller: aboutcontroller.controller,
                  children: const [
                    Center(
                      child: Text(
                        'Welcome to MusicMusca and enjoy listening offline music with better experience. If you have any suggestions you can inform me by clicking the feedback section in the settings,We will try to improve our app more better,thank you.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Center(
                      child: Text(
                        "I am Binuprasad.Expertised in UI/UX Designing and Flutter development based on kerala,if you have any queries related to  musicapp or about me by taping 'Contact' on the settings. Once of all thank you for supporting me.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
