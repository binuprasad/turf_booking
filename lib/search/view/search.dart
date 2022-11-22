import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_tickets/constant/color.dart';
import 'package:movie_tickets/home/controller/home_controller.dart';
import 'package:movie_tickets/search/controller/search_controller.dart';
import 'package:movie_tickets/turf_view_screen/view/turf_view.dart';

class SearchScreen extends GetView<SearchController> {
  SearchScreen({Key? key}) : super(key: key);
  final searchcontroller = Get.lazyPut(() => SearchController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.lightBlueAccent.withOpacity(0.5), Colors.white],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            title: Text(
              'Search Your Turfs',
              style: GoogleFonts.ptSerif(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 7.0,
                ),
                GetBuilder<SearchController>(
                  builder: (controller) => TextField(
                    onChanged: (value) => controller.runFilter(value),
                    decoration: InputDecoration(
                      hintText: "Search your turf",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                GetBuilder<SearchController>(
                  builder: (controller) => Expanded(
                    child: controller.foundtufs.isNotEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: controller.foundtufs.length,
                              itemBuilder: (BuildContext context, int index) {
                                final datas = controller.foundtufs[index];

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () => Get.to(
                                        () => TurfViewScreen(data: datas)),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(colors: [Colors.lightBlue,white]),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight:
                                                  Radius.circular(40))),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5.0,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: NetworkImage(datas
                                                        .turfLogo
                                                        .toString()),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                14,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0,
                                                        vertical: 20),
                                                child: SizedBox(
                                                  width: 150,
                                                  height: 30,
                                                  child: FittedBox(
                                                    child: Text(
                                                      datas.turfName.toString(),
                                                      style:
                                                          GoogleFonts.ptSerif(
                                                              fontSize: 19,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: green),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                      ),
                                                      Text(datas
                                                          .turfInfo!.turfRating!
                                                          .toString())
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : SingleChildScrollView(
                            child:
                                Lottie.asset('assets/image/100123-search.json'),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
