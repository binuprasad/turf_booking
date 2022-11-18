import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/book_now/controller/booknow_controller.dart';
import 'package:movie_tickets/constant/color.dart';
import 'package:movie_tickets/constant/constant_widget.dart';
import 'package:movie_tickets/home/controller/home_controller.dart';
import 'package:movie_tickets/home/widgets/cuatom_card2.dart';
import 'package:movie_tickets/home/widgets/home_custom_card.dart';
import 'package:movie_tickets/home/widgets/text_widget.dart';
import 'package:movie_tickets/location_controller/location_controller.dart';
import 'package:movie_tickets/auth/login_home/view/login_page.dart';
import 'package:movie_tickets/search/view/search.dart';
import 'package:movie_tickets/turf_view_screen/view/turf_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homecontroller = Get.put(HomeController());
  final locationController = Get.put(LocationController());
  final bookNowController = Get.put(BookNowController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: appColor),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
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
                            Get.offAll(() => LoginPage());
                          },
                          child: Text(
                            'Arco',
                            style: GoogleFonts.akronim(
                                fontSize: 70, color: Colors.white),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(() => SearchScreen());
                          },
                          icon: const Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.white),
                          Obx(
                            () => Text(
                              '${locationController.currentAddress}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
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
                              image: 'assets/image/cricket.jpg',
                              text: 'Cricket'),
                          HomeCustomCard(
                              image: 'assets/image/yoga.jpg', text: 'Yoga'),
                        ],
                      ),
                    ),
                    const TitleText(text: 'Nearby Turf'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.8,
                      width: MediaQuery.of(context).size.width,
                      child: GetBuilder<HomeController>(
                        builder: (controller) => ListView.builder(
                          itemCount: homecontroller.nearby.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final data = homecontroller.nearby[index];
                            if (homecontroller.isLoading.value) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => TurfViewScreen(data: data));
                                  bookNowController.convert24ToNormalTime(data);
                                },
                                child: CustomCard2(
                                  image: data.turfLogo.toString(),
                                  turfName: data.turfName.toString(),
                                  starRating:
                                      data.turfInfo!.turfRating!.toString(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    const TitleText(text: 'All Turfs'),
                    GetBuilder<HomeController>(
                      builder: (controller) => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: homecontroller.allTurfList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final datas = homecontroller.allTurfList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => TurfViewScreen(data: datas));
                                bookNowController.convert24ToNormalTime(datas);
                              },
                              child: GlassContainer(
                                elevation: 3.0,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.40),
                                    Colors.white.withOpacity(0.10)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderGradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.60),
                                    Colors.white.withOpacity(0.10),
                                    Colors.lightBlueAccent.withOpacity(0.05),
                                    Colors.lightBlueAccent.withOpacity(0.6)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                blur: 15.0,
                                borderWidth: 1,
                                height: MediaQuery.of(context).size.height / 4,
                                width: MediaQuery.of(context).size.height,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  datas.turfLogo.toString()),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: FittedBox(
                                              child: Text(
                                                datas.turfName.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold,
                                                    color: green),
                                              ),
                                            ),
                                          ),
                                          ht10,
                                          Row(
                                            children: [
                                              Text(
                                                datas.turfPlace.toString(),
                                                style: GoogleFonts.ptSerif(),
                                              ),
                                              const Icon(
                                                Icons.location_on,
                                                color: Colors.blueGrey,
                                              ),
                                            ],
                                          ),
                                          ht10,
                                          Row(
                                            children: [
                                              Text(
                                                'TurfCapacity : ',
                                                style: GoogleFonts.ptSerif(),
                                              ),
                                              datas.turfType!.turfFives!
                                                  ? Text(
                                                      '5s',
                                                      style: GoogleFonts
                                                          .notoSerif(),
                                                    )
                                                  : const Text(''),
                                              datas.turfType!.turfSevens!
                                                  ? Text(
                                                      '&7s',
                                                      style: GoogleFonts
                                                          .notoSerif(),
                                                    )
                                                  : const Text('')
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons.star,
                                                      color: Colors.yellow),
                                                  Text(datas
                                                      .turfInfo!.turfRating!
                                                      .toString())
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6,
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.favorite_outline),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    ht30,
                    ht10,
                    ht30
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
