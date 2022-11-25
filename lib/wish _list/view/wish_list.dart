import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_tickets/constant/color.dart';
import 'package:movie_tickets/constant/constant_widget.dart';
import 'package:movie_tickets/home/controller/home_controller.dart';
import 'package:movie_tickets/home/widgets/text_widget.dart';
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
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: TitleText(text: 'WishList'),
              ),
              ht30,
              ht30,
              favouriteController.favaTurf.isEmpty
                  ? Center(
                      child: Lottie.asset("assets/image/114164-favourite.json",
                          animate: true),
                    )
                  : GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children: List.generate(
                        favouriteController.favaTurf.length,
                        (index) => GridAnimatorWidget(
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
                                              .favaTurf[index].turfLogo!,
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                FavTurfIconButton(
                                    data: favouriteController.favaTurf[index]),
                              ],
                            ),
                          ),
                        ),
                      ).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
