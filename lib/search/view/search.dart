import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/home/controller/home_controller.dart';
import 'package:movie_tickets/search/controller/search_controller.dart';
import 'package:movie_tickets/turf_view_screen/view/turf_view.dart';
import '../../constant/constant_widget.dart';

class SearchScreen extends GetView<SearchController> {
  SearchScreen({Key? key}) : super(key: key);
  final searchcontroller = Get.lazyPut(() => SearchController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.greenAccent, Colors.white],
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
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: const Text(
              'Search Your Turfs',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                        borderRadius: BorderRadius.circular(25.0),
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
                                      color: Colors.greenAccent,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4.5,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Container(
                                              height: 170,
                                              width: 150,
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
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                child: Text(
                                                  datas.turfName.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(Icons.location_on),
                                                  Text(datas.turfPlace
                                                      .toString()),
                                                ],
                                              ),
                                            ht20,
                                              Row(
                                                children: [
                                                  const Text('Turftype : '),
                                                  Text(datas
                                                      .turfType!.turfFives!
                                                      .toString()),
                                                ],
                                              ),
                                              ht20,
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 40),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                        ),
                                                        Text(datas.turfInfo!
                                                            .turfRating!
                                                            .toString())
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Row(
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {},
                                                          icon: const Icon(Icons
                                                              .favorite_outline),
                                                        ),
                                                      ],
                                                    ),
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
                        :const Text(
                            'No results found',
                            style: TextStyle(fontSize: 24),
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
