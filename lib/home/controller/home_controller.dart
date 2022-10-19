import 'package:get/get.dart';

class HomeController extends GetxController {
  
  var currentIndex = 0.0.obs;
  List<String> images = [
    'assets/image/turf.jpg',
    'assets/image/badminton.jpg',
    'assets/image/cricket.jpg',
    'assets/image/yoga.jpg'
  ];

  imageInadex(double index) {
    currentIndex.value = index;
    update();
  }
}
