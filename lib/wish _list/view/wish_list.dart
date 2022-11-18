import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/constant/color.dart';
import 'package:movie_tickets/constant/constant_widget.dart';
import 'package:movie_tickets/home/controller/home_controller.dart';
import 'package:movie_tickets/wish%20_list/controller/wish_list_controller.dart';
import 'package:movie_tickets/wish%20_list/widgets/favourite_button.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';

class WishList extends StatelessWidget {
  WishList({
    Key? key,
  }) : super(key: key);
  final homeScreencontroller = Get.put(HomeController());
  final favouriteController = Get.put(WishListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              ht20,
              GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                     favouriteController
                                            .favaTurf.length,
                    (i) => GridAnimatorWidget(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        favouriteController
                                            .favaTurf[i].turfLogo!,
                                      ),
                                      fit: BoxFit.fill)),
                            ),
                            FavTurfIconButton(
                                data:  favouriteController
                                            .favaTurf[i]),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon:  const CircleAvatar(
                            //     backgroundColor: Colors.pinkAccent,
                            //     child: Icon(
                            //       Icons.favorite_outline_outlined,
                            //       color: white,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ).toList()),
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: 10,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         height: MediaQuery.of(context).size.height / 7,
              //         width: MediaQuery.of(context).size.width,
              //         decoration: BoxDecoration(
              //             color: Colors.green,
              //             borderRadius: BorderRadius.circular(15)),
              //         child: Row(
              //           children: [
              //             Container(
              //               width: MediaQuery.of(context).size.width / 3,
              //               decoration: const BoxDecoration(
              //                 color: Colors.red,
              //                 image: DecorationImage(
              //                     image: NetworkImage(
              //                         'https://images.unsplash.com/photo-1560272564-c83b66b1ad12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8&w=1000&q=80'),
              //                     fit: BoxFit.fill),
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.symmetric(horizontal: 70),
              //               child: Column(
              //                 children: [
              //                   const Text(
              //                     "turf name",
              //                     textAlign: TextAlign.center,
              //                     style: TextStyle(fontSize: 20),
              //                   ),
              //                   const Text("Available"),
              //                   const Text('turf type'),
              //                   Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Row(
              //                         children: const [
              //                           Icon(
              //                             Icons.star,
              //                             color: Colors.yellow,
              //                           ),
              //                           Text('3.7')
              //                         ],
              //                       ),
              //                       IconButton(
              //                         onPressed: () {},
              //                         icon: const Icon(
              //                             Icons.favorite_outline_outlined),
              //                       ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
