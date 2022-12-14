import 'dart:developer';
import 'package:get/get.dart';
import 'package:movie_tickets/bottom_navigationbar/view/bottom_navigation.dart';
import 'package:movie_tickets/auth/login_home/view/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  List<String> text = [
    "Arco",
    "The arena of games",
    "the world of happy",
    " forgot all things .",
    "and play with a smile",
  ];
  // final homeConrtroller =Get.put(HomeController());
  checkUserLogin() async {
    
    SharedPreferences prf = await SharedPreferences.getInstance();
    final token = prf.getString('token');
    if (token == null || token.isEmpty) {
      await Future.delayed(
        const Duration(seconds: 5),
      );
      return Get.offAll(() => LoginPage());
    } else {
      await Future.delayed(
        const Duration(seconds: 5),
      );

      return Get.offAll(() => BottomNavigationBarwidget());
    }
  }

  @override
  void onInit()async {
  await  checkUserLogin();
    log("splash oninit");
//  await homeConrtroller.nearestTurf();
  log("splash oninit22222");
    super.onInit();
  }
}
