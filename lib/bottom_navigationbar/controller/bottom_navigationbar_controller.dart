import 'package:get/get.dart';
import 'package:movie_tickets/home/controller/home_controller.dart';
import 'package:movie_tickets/home/view/home_screen.dart';
import 'package:movie_tickets/profile/view/profile.dart';
import 'package:movie_tickets/search/view/search.dart';
import 'package:movie_tickets/turf/view/turf.dart';

class BottonNavigationBarController extends GetxController{
final homeController = Get.put(HomeController());
  RxInt selectedIndex = 0.obs;
 final pages = [HomeScreen(), const ProfileScreen(),const SearchScreen(), const TurfScreen(),];

 navigateBottombar(int index){
  selectedIndex.value =index;
  update();
 }

 @override
  void onInit() {
  homeController.nearestTurf();

    super.onInit();
  }
}