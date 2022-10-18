import 'package:get/get.dart';
import 'package:movie_tickets/home/view/home_screen.dart';
import 'package:movie_tickets/profile/view/profile.dart';
import 'package:movie_tickets/turf/view/turf.dart';

class BottonNavigationBarController extends GetxController{
  RxInt selectedIndex = 0.obs;
 final pages = [HomeScreen(), const ProfileScreen(), const TurfScreen(),];

 navigateBottombar(int index){
  selectedIndex.value =index;
  update();
 }
}