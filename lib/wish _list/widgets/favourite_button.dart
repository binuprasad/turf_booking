import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/constant/color.dart';
import '../../model/home_model.dart';
import '../controller/wish_list_controller.dart';

class FavTurfIconButton extends GetView<WishListController> {
  final WishListController wishlistcontroller = Get.put(WishListController());
  FavTurfIconButton({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Obx(() => IconButton(
          onPressed: () {
            log('entering into the favbutton ontap');

            controller.checkFavAndAddToDb(data);
          },
          icon: Icon(
            controller.isFav(data).value 
                ? Icons.bookmark
                : Icons.bookmark_outline,
          ),
          color: controller.isFav(data).value ? black : black,
        ));
  }
}
