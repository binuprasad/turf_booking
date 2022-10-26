import 'package:get/get.dart';
import 'package:movie_tickets/home/controller/home_controller.dart';
import 'package:movie_tickets/model/home_model.dart';

class SearchController extends GetxController{
  final homecontroller = Get.put(HomeController());
  List<Datum> foundtufs = [];
  @override
  void onInit() {
    foundtufs = homecontroller.allTurfList;
    super.onInit();
  }
  void runFilter(String enteredKeyword){
    List <Datum> results = [];
    if (enteredKeyword.isEmpty){
      results = homecontroller.allTurfList;
    }else{
      results = homecontroller.allTurfList.where((element) => element.turfName!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    foundtufs = results;
    update();
  }
}